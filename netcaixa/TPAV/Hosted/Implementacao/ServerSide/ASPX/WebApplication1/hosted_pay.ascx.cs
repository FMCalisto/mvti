using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Net;
using System.IO;
using System.Xml;
using System.Collections;
using System.ComponentModel;
using System.Security.Cryptography.X509Certificates;
using System.Xml.Linq;

namespace caixatec.safepay.demos
{
    public partial class UC_hosted_pay : System.Web.UI.UserControl
    {
        [Description("Valor inteiro referente à moeda a ser usada. (9782 é euro)")]
        public int MoedaOperacao
        {
            get { return intA105; }
            set { intA105 = value; }
        }

        [Description("Url para confirmação. Deve incluir o protocolo.")]
        public string UrlConfirmacao
        {
            get { return strC012; }
            set { strC012 = value; }
        }

        [Description("")]
        public string CartaoSup
        {
            get { return strCartaoSup; }
            set { strCartaoSup = value; }
        }
        [Description("")]
        public string Tpa
        {
            get { return strA001; }
            set { strA001 = value; }
        }
        [Description("Caminho completo para o certificado")]
        public string Certificado
        {
            get { return strCertificado; }
            set { strCertificado = value; }
        }
        [Description("")]
        public string CertificadoPW
        {
            get { return strCertificadoPassword; }
            set { strCertificadoPassword = value; }
        }
         [Description("")]
        public string UrlAutorizacao
        {
            get { return strUrlMensagensForm3; }
            set { strUrlMensagensForm3 = value; }
        }
         [Description("")]
        public string UrlPagamento
        {
            get { return strUrlMensagens; }
            set { strUrlMensagens = value; }
        } 

        // Variáveis necessárias para efectuar o pagamento
        private static int intA105 = 9782; // Moeda da Operação
        private static string strC012;  // URL da página de confirmação da encomenda

        private string strCartaoSup = ""; // Nº de cartão de supervisor
        private string strA001 = ""; // Nº TPA
        private string strCertificado = ""; // Caminho para o certificado
        private string strCertificadoPassword = ""; // Password do certificado
        private string strUrlMensagensForm3 = ""; // URL para as mensagens FORM3 (O URL para ambiente de testes é https://teste.mbnet.pt/servlet/pvtn. O URL para ambiente de produção é https://www.mbnet.pt/servlet/pvtn)
        private string strUrlMensagens = ""; // URL para as restantes mensagens (O URL para ambiente de testes é https://teste.mbnet.pt/pvtn. O URL para ambiente de produção é https://www.mbnet.pt/pvtn)

        private string strC007 = string.Empty; // Ref. pagamento
        private double dblA061 = 0;
        private string strA061 = string.Empty; // Montante
        private string strC003 = string.Empty; // PAN cliente
        private string strC004 = string.Empty; // Dt. expiração cartão
        private string strC005 = string.Empty; // Cód. Segurança
        private string strC013 = string.Empty; // Elemento de segurança
        private string strA030 = string.Empty; // Código da mensagem
        private string strA105 = string.Empty; // Moeda de Operação

        private string strMensagemErr = "Error processing the transaction";

        private bool boolAuth = false;
        private bool boolPagamento = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Validar preenchimento dos campos
            Page.Validate();

            // Formulário submetido
            if (Page.IsPostBack && Page.IsValid)
            {
                assignVariables();
                formatFields();

                // Autorizar pagamento junto da SIBS
                boolAuth = authorizePayment();

                // Efectuar o pagamento
                if (boolAuth)
                    boolPagamento = doPayment();

                // Mostrar o resultado do pagamento
                this.pnlMsg.Controls.Clear();
                if (boolAuth && boolPagamento)
                    this.pnlMsg.Controls.Add(new LiteralControl("<br/><div style='color:green;'><b>Operação realizada com sucesso!</b></div>"));
                else
                    this.pnlMsg.Controls.Add(new LiteralControl("<br/><div style='color:red;'><b>Operação não realizada!</b></div>"));
            }
        }


        private bool doPayment()
        {
            // Check Payment 
            string strDtPagamento = checkPayment();
            
            #region PAGAMENTO

            // Gerar hash com a mensagem
            strA030 = "M002";
            strC013 = buildHash(strA030 + strA001, true);

            // Parametros FORM020
            string strParamsM002 = "A030=" + strA030 +
                                   "&A001=" + strA001 +
                                   "&C007=" + strC007 +
                                   "&C013=" + strC013 +
                                   "&A061=" + strA061 +
                                   "&A105=" + strA105 +
                                   "&A037=" + strDtPagamento;

            // Efectuar o pedido à sibs para autorização do pagamento
            string strRespb = doPostHttps(strCertificado, strCertificadoPassword, strUrlMensagens ,strParamsM002);

            Hashtable hstValores = parseXml(strRespb);

            string strRespCodMensagem = string.Empty;

            if (hstValores.ContainsKey("A030"))
                strRespCodMensagem = hstValores["A030"].ToString();

            boolPagamento = !string.IsNullOrEmpty(strRespCodMensagem) && strRespCodMensagem.Equals("M102") && 
                            hstValores.ContainsKey("A038") && int.Parse(hstValores["A038"].ToString()) == 0;

            #endregion

            return boolPagamento;
        }

        private string checkPayment()
        {
            // Gerar hash com a mensagem
            strA030 = "M020";
            strC013 = buildHash(strA030 + strA001, false);

            // Parametros FORM020
            string strParamsM020 = "A030=" + strA030 +
                                    "&A001=" + strA001 +
                                    "&C007=" + strC007 +
                                    "&C013=" + strC013;

            // Efectuar o pedido à sibs para autorização do pagamento
            string strResp = doPostHttps(strCertificado, strCertificadoPassword, strUrlMensagens, strParamsM020);

            Hashtable hstValores = parseXml(strResp);

            string strDtPagamento = string.Empty;

            if (hstValores.ContainsKey("A037"))
            {
                strDtPagamento = hstValores["A037"].ToString();

                if (!string.IsNullOrEmpty(strDtPagamento))
                    strDtPagamento.PadRight(14, '0');
            }

            return strDtPagamento;
        }

        private Hashtable parseXml(string strRespXml)
        {
            XDocument xDoc;

            using (StringReader s = new StringReader(strRespXml))
            {
                xDoc = XDocument.Load(s);
            }

            Hashtable hstValores = new Hashtable();

            foreach (XElement xe in xDoc.Descendants())
            {
                if (!hstValores.ContainsKey(xe.Name.ToString()))
                    hstValores.Add(xe.Name.ToString(), xe.Value);
            }

            return hstValores;
        }

        private bool authorizePayment()
        {
            // Gerar hash da Mensagem
            strA030 = "H3D0";
            strC013 = buildHash(strA030 + 
                strA001 + 
                strC007 + 
                strA105 + 
                "0" + strA061.Remove(strA061.IndexOf('.'), 1) + 
                strC003 + 
                strC004 + 
                strC005 + 
                strC012, true);

            // Parametros FORM3
            string strParamsFORM3 = "A030=" + strA030 +
                                    "&A001=" + strA001 +
                                    "&C007=" + strC007 +
                                    "&A105=" + strA105 +
                                    "&A061=" + strA061 +
                                    "&C003=" + strC003 +
                                    "&C004=" + strC004 +
                                    "&C005=" + strC005 +
                                    "&A7707=" +
                                    "&A7706=" + 
                                    "&C046=" +
                                    "&C012=" + strC012 +
                                    "&C013=" + strC013 +
                                    "&";

            // Efectuar o pedido à sibs para autorização do pagamento
            string strResp = doPostHttps(strCertificado, strCertificadoPassword,strUrlMensagensForm3 ,strParamsFORM3);
            if (!string.IsNullOrEmpty(strResp) && strResp.IndexOf(strMensagemErr) == -1)
                return true;
            else
                return false;
        }

        private string doPostHttps(string strCertificado, string strCertificadoPassword, string sUrl,string strParams)
        {
            X509Certificate Cert = new X509Certificate(@strCertificado, strCertificadoPassword);
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(sUrl + "?" + strParams);

            request.Method = "POST";
            request.ClientCertificates.Add(Cert);
            
            string strResp = string.Empty;
            using (var reader = new StreamReader(request.GetResponse().GetResponseStream()))
            {
                strResp = reader.ReadToEnd(); 
            }

            return strResp;
        }

        private string buildHash(string sHash_Msg, bool bHMAC)
        {
            byte[] messageBytes = new System.Text.ASCIIEncoding().GetBytes(sHash_Msg);
            byte[] hashmessage;

            if (bHMAC)
            {
                byte[] keyByte = new System.Text.ASCIIEncoding().GetBytes(strCartaoSup);
                HMACSHA1 algo = new HMACSHA1(keyByte);
                hashmessage = algo.ComputeHash(messageBytes);
            }
            else
            {
                SHA1 algo = new SHA1CryptoServiceProvider();
                hashmessage = algo.ComputeHash(messageBytes);
            }

            
            // Converter os bytes para string
            string sFinal = "";
            for (int i = 0; i < hashmessage.Length; i++)
            {
                sFinal += hashmessage[i].ToString("X2"); // hex format
            }
          
            return sFinal.ToUpper();
        }

        private void assignVariables()
        {
            strC007 = this.txtC007.Text;
            dblA061 = double.Parse(this.txtA061.Text);
            strC007 = this.txtC007.Text;
            strA061 = this.dblA061.ToString("F2").Replace(',','.');
            strC003 = this.txtC003.Text;
            strC004 = this.txtC004.Text;
            strC005 = this.txtC005.Text;
            strA105 = intA105.ToString();
        }

        
        private void formatFields()
        {
            strA001 = strA001.PadLeft(9, '0');
            strC007 = strC007.PadLeft(15, '0');
            strA105 = strA105.PadRight(4, '0');
            //strA061 = ;
            strA061 = strA061.PadLeft(8, '0');
            strC003 = strC003.PadRight(16, '0');
            strC004 = strC004.PadRight(6, '0');
            strC005 = strC005.PadRight(3, '0');
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
          
        }
    }
}