<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	on error resume next
	Dim Erro : Erro=0
	Dim Rs
   	set rs = Server.CreateObject("ADODB.Recordset")

	Session("PHC_USR")=trim(request.Form("username"))
	Session("PHC_PASS")=trim(request.Form("password"))
	rs.ActiveConnection = "Provider=SQLOLEDB;Server=SRVPHC14;Uid=" & Session("PHC_USR") & ";PWD=" & Session("PHC_PASS") & ";Database=MIN_PHC;"

	Erro=err.number
	rs.close
	if Erro=0 Then 
		Session("autenticado")=1 
		response.Cookies("UserLogin")=trim(request.Form("username"))
		Session("Comercial")=trim(request.Form("username"))
		if ucase(Session("Comercial"))="FERNANDO.SANTOS" or ucase(Session("Comercial"))="ISABEL.RICO" Then
			Session("Admin")=1
		else
			Session("Admin")=0
		end if
	else 
		response.Cookies("UserLogin")=""
		Session("autenticado")=0
		Session("Comercial")=""
	End if
	response.Redirect("index.asp")
%>
