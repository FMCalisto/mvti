<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="hosted_pay.aspx.cs" Inherits="caixatec.safepay.demos.hosted_pay_page" %>
<%@ Register TagPrefix="ctc" TagName="frmpay" Src="~/hosted_pay.ascx" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Hosted</title>
</head>
<body>
    <form id="txtform1" runat="server" autocomplete="off">
    <div>
        <ctc:frmpay MoedaOperacao="9782"
            Tpa="8026"
            CartaoSup="967179100350001810000"
            UrlConfirmacao="http://safepay.lardocelar.com/teste_response.jsp"
            UrlAutorizacao="https://teste.mbnet.pt/servlet/pvtn"
            UrlPagamento="https://teste.mbnet.pt/pvtn"
            Certificado="C:/caixatec/webapps/safepay/WEB-INF/certificate/cq/0000008026.p12"
            CertificadoPW="ER396ANL"
            runat="server" />
    </div>
    </form>
</body>
</html>
