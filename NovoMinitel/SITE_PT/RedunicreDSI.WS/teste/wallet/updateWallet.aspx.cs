using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class _Default : System.Web.UI.Page 
{
    public address address = new address();
    public privateData privateData1 = new privateData();
    public privateData privateData2 = new privateData();
    public privateData privateData3 = new privateData();
    public privateData[] privateDataList = new privateData[3];
    public authentication3DSecure authentication3DSecure = new authentication3DSecure();
    public card card = new card();
    public wallet wallet = new wallet();
    public string contractNumber;
    public result resultat;
    public string errorMessage = "";
    public string errorDetails = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DirectPaymentAPI ws = new DirectPaymentAPI();
            
            // CONTRACT NUMBER
            contractNumber = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("contractNumber"))).Text;
                           
            // ADDRESS (optional)            
            address.name = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("addressName"))).Text;
            address.street1 = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("addressStreet1"))).Text;
            address.street2 = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("addressStreet2"))).Text;
            address.cityName = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("addressCity"))).Text;
            address.zipCode = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("addressZipCode"))).Text;
            address.country = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("addressCountry"))).Text;
            address.phone = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("addressPhone"))).Text;
            
            // CARD INFO
            card.number = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("cardNumber"))).Text;
            card.type = ((DropDownList)(Page.PreviousPage.FindControl("updateWallet").FindControl("cardType"))).Text;
            card.expirationDate = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("cardExpirationDate"))).Text;
            card.cvx = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("cardCrypto"))).Text;
            card.ownerBirthdayDate = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("cardOwnerBirthdayDate"))).Text;
            card.password = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("cardPassword"))).Text;

            // PRIVATE DATA (optional)            
            privateData1.key = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("privateDataKey1"))).Text;
            privateData1.value = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("privateDataValue1"))).Text;
            privateData2.key = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("privateDataKey2"))).Text;
            privateData2.value = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("privateDataValue2"))).Text;
            privateData3.key = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("privateDataKey3"))).Text;
            privateData3.value = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("privateDataValue3"))).Text;

            privateDataList.SetValue(privateData1, 0);
            privateDataList.SetValue(privateData2, 1);
            privateDataList.SetValue(privateData3, 2);

            // WALLET INFO
            wallet.walletId = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("walletId"))).Text;
            wallet.lastName = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("lastName"))).Text;
            wallet.firstName = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("firstName"))).Text;
            wallet.email = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("email"))).Text;
            wallet.card = card;
            wallet.shippingAddress = address;
            wallet.comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("updateWallet").FindControl("comment"))).Value;

            // AUTHENTICATION 3D SECURE (optional)           
            authentication3DSecure.md = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("md"))).Text;
            authentication3DSecure.pares = ((TextBox)(Page.PreviousPage.FindControl("updateWallet").FindControl("pares"))).Text;

            //PROXY
            if (Resources.Resource.PROXY_HOST != "" && Resources.Resource.PROXY_PORT != "")
            {
                ws.Proxy = new System.Net.WebProxy(Resources.Resource.PROXY_HOST, Convert.ToInt32(Resources.Resource.PROXY_PORT));
                if (Resources.Resource.PROXY_USER != "" && Resources.Resource.PROXY_PASSWORD != "")
                {
                    ws.Proxy.Credentials = new System.Net.NetworkCredential(Resources.Resource.PROXY_USER, Resources.Resource.PROXY_PASSWORD);
                }
            }

            if (Resources.Resource.PROD == "true")
                ws.Url = Resources.Resource.ENDPOINT_DIRECT;

            ws.Credentials = new System.Net.NetworkCredential(Resources.Resource.MERCHANT_ID, Resources.Resource.ACCESS_KEY);

            resultat = ws.updateWallet(contractNumber, wallet, privateDataList, authentication3DSecure);            
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        }
    }
}
