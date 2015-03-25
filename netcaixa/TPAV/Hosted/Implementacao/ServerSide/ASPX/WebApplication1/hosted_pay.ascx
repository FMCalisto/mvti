<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hosted_pay.ascx.cs" Inherits="caixatec.safepay.demos.UC_hosted_pay" %>

<h2>
			Compra hosted (Versão ASP.NET)
</h2>
<div style="float:left; width:250px;">
	Referência de pagamento
</div>
<div style="float:left;">
	<asp:TextBox runat="server" id="txtC007" /><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtC007" ErrorMessage="O preenchimento deste campo é obrigatório!"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtC007" ValidationExpression="[0-9]+" ErrorMessage="Este campo deverá ser composto por um valor numérico." ></asp:RegularExpressionValidator>
</div>
<br style="clear:both"/><br/>
			
<div style="float:left; width:250px;">
	Montante
</div>
<div style="float:left;">
	<asp:TextBox runat="server" id="txtA061" /><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtA061" ErrorMessage="O preenchimento deste campo é obrigatório!"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtA061" ValidationExpression="^(0|(-?(((0|[1-9]\d*)\,\d+)|([1-9]\d*))))$" ErrorMessage="Este campo deverá ser composto por um valor numérico. Use a , para separador decimal." ></asp:RegularExpressionValidator>
</div>
<br style="clear:both"/><br/>
			
<div style="float:left; width:250px;">
	Nº Cartão
</div>
<div style="float:left;">
	<asp:TextBox runat="server" id="txtC003" Text="" /><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtC003" ErrorMessage="O preenchimento deste campo é obrigatório!"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtC003" ValidationExpression="[0-9]+" ErrorMessage="Este campo deverá ser composto por um valor numérico." ></asp:RegularExpressionValidator>
</div>
<br style="clear:both"/><br/>
			
<div style="float:left; width:250px;">
	Validade
</div>
<div style="float:left;">
	<asp:TextBox runat="server" id="txtC004" Text="" MaxLength="6" /><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtC004" ErrorMessage="O preenchimento deste campo é obrigatório!"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator  ID="RegularExpressionValidator4" ControlToValidate="txtC004" runat="server" ValidationExpression="^\d{6}$" ErrorMessage="Este campo deverá ser preenchido no formato AAAAMM." ></asp:RegularExpressionValidator>
</div>
<br style="clear:both"/><br/>
			
<div style="float:left; width:250px;">
	CVV
</div>
<div style="float:left;">
	<asp:TextBox runat="server" id="txtC005" Text="" /><br />
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtC005" ErrorMessage="O preenchimento deste campo é obrigatório!"></asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="txtC005" ValidationExpression="[0-9]+" ErrorMessage="Este campo deverá ser composto por um valor numérico." ></asp:RegularExpressionValidator>
</div>
<br style="clear:both"/><br/>
			
<div style="padding-left: 330px;">
	<asp:Button runat="server" ID="btnSubmit" Text="Submit" OnClick="btnSubmit_Click" />
</div>
<asp:Panel runat="server" ID="pnlMsg"></asp:Panel>
