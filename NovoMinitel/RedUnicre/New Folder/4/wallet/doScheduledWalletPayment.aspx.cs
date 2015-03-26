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
    public payment payment = new payment();
    public order order = new order();
    public orderDetail orderDetail1 = new orderDetail();
    public orderDetail orderDetail2 = new orderDetail();
    public privateData privateData1 = new privateData();
    public privateData privateData2 = new privateData();
    public privateData privateData3 = new privateData();
    public privateData[] privateDataList = new privateData[3];
    public string paymentRecordId;
    public string walletId;
    public result resultat;
    public string errorMessage = "";
    public string errorDetails = "";
    string scheduledDate = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            DirectPaymentAPI ws = new DirectPaymentAPI();

            // WALLET ID
            walletId = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("walletId"))).Text;
            
            payment.amount = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("paymentAmount"))).Text;
            payment.mode = ((DropDownList)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("paymentMode"))).Text;
            payment.action = ((DropDownList)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("paymentFonction"))).Text;
            payment.currency = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("paymentCurrency"))).Text;
            payment.contractNumber = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("paymentContractNumber"))).Text;
            payment.differedActionDate = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("paymentDifferedActionDate"))).Text; // Format : "dd/mm/yy"

            // ORDER
            order.@ref = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderRef"))).Text;
            order.origin = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderOrigin"))).Text;
            order.country = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderCountry"))).Text;
            order.taxes = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderTaxes"))).Text;

            order.currency = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderCurrency"))).Text;
            if (order.currency == "")
                order.currency = Resources.Resource.ORDER_CURRENCY;

            order.amount = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderAmount"))).Text;
            order.date = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderDate"))).Text; // format : "dd/mm/yyyy HH24:MM"

            // ORDER DETAILS
            orderDetail1.@ref = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderDetailRef1"))).Text;
            orderDetail1.price = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderDetailPrice1"))).Text;
            orderDetail1.quantity = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderDetailQuantity1"))).Text;
            orderDetail1.comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderDetailComment1"))).Value;

            orderDetail2.@ref = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderDetailRef2"))).Text;
            orderDetail2.price = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderDetailPrice2"))).Text;
            orderDetail2.quantity = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderDetailQuantity2"))).Text;
            orderDetail2.comment = ((HtmlTextArea)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("orderDetailComment2"))).Value;

            order.details = new orderDetail[2];
            order.details.SetValue(orderDetail1, 0);
            order.details.SetValue(orderDetail2, 1);

            // PRIVATE DATA (optional)            
            privateData1.key = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("privateDataKey1"))).Text;
            privateData1.value = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("privateDataValue1"))).Text;
            privateData2.key = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("privateDataKey2"))).Text;
            privateData2.value = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("privateDataValue2"))).Text;
            privateData3.key = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("privateDataKey3"))).Text;
            privateData3.value = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("privateDataValue3"))).Text;

            privateDataList.SetValue(privateData1, 0);
            privateDataList.SetValue(privateData2, 1);
            privateDataList.SetValue(privateData3, 2);
            
            
            // SCHEDULED DATE
            scheduledDate = ((TextBox)(Page.PreviousPage.FindControl("doScheduledWalletPayment").FindControl("scheduledDate"))).Text;

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

            resultat = ws.doScheduledWalletPayment(payment, order.@ref, order.date, scheduledDate, walletId, order, privateDataList, out paymentRecordId);
        }
        catch (Exception exc)
        {
            errorMessage = exc.Message;
            errorDetails = exc.ToString();
        } 
    }
}
