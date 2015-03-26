<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%

	Dim txt
	Set txt = Server.CreateObject("Interface_min.txt")
	Dim db
	Set db = Server.CreateObject("Interface_min.db")
	Dim MySQL : MySQL=""
	Dim SN
		SN=txt.ABSTxt(cstr(request.Form("SN")))
		
	Rem Verifico se existe o numero de serie
	MySQL="Select count(1) as Total From formulario_wacom where serie='" & SN & "'"
	Dim Total
		Total=cint(db.Query(cstr(MySQL))("Total"))
	If Total=0 Then 
		Session("Erro")="N&uacute;mero de serie inexistente !"
		response.Redirect("wacom_erro.asp")
	end if
	
	Rem Verifico Se já foi inserido
	MySQL="Select count(1) as Total From Wn_Formularios where Campo08='" & SN & "'"
		Total=cint(db.Query(cstr(MySQL))("Total"))
	If Total<>0 Then 
		Session("Erro")="N&uacute;mero de serie j&aacute; registado !"
		response.Redirect("wacom_erro.asp")
	end if
	
	Rem Ate aqui está tudo ok 
	Dim Data
		Data=cstr(txt.ABSTxt(cstr(request.Form("AAAA"))) & "-" & txt.ABSTxt(cstr(request.Form("MM"))) & "-" & txt.ABSTxt(cstr(request.Form("DD"))) & " 00:00:00.000")
	DIm CP
		CP=txt.ABSTxt(cstr(request.Form("CP4"))) & "-" & txt.ABSTxt(cstr(request.Form("CP3")))
		MySQL="INSERT INTO [WebSiteMINITEL].[dbo].[Wn_Formularios] ([Quando],[Titulo],[Campo01],[Campo02],[Campo03],[Campo04],[Campo05],[Campo06],[Campo07],[Campo08],[Campo09],[Campo10]) VALUES (getdate(),'WACOM','" & txt.ABSTxt(cstr(request.Form("NOME"))) & "','" & txt.ABSTxt(cstr(request.Form("MORADA"))) & "','" & CP & "','" & txt.ABSTxt(cstr(request.Form("LOCALIDADE"))) & "','" & txt.ABSTxt(cstr(request.Form("EMAIL"))) & "','" & txt.ABSTxt(cstr(request.Form("TELEFONE"))) & "','" & txt.ABSTxt(cstr(request.Form("LOCAL"))) & "','" & txt.ABSTxt(cstr(request.Form("SN"))) & "','" & Data & "','NA')"
		db.QueryExec(cstr(MySQL))
	Set db=nothing
	Set txt=nothing
	
	response.Redirect("wacom_ok.asp")
%>
		
		
