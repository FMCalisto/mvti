<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#INCLUDE file="includes/inc_variaveis_globais.asp"-->
<%
Response.Buffer = True 

DIM RMtxt,RMtxt2,RMtxt3
RMtxt=" "
ATxt=txt.abstxt(request.QueryString("MARCA"))
RMtxt2=ATxt
'response.write("RMtxt2 := " & RMtxt2 & "<br />")

RMtxt3=Replace(RMtxt,"Marca=" & RMtxt2,"")
IF trim(RMtxt3)="" THEN
   RMtxt3="&OP=ListaProdutos"
   End if 
RMtxt=txt.abstxt(request.QueryString())
RMtxt=Replace(RMtxt,"%20"," ")
'response.write("RMtxt := " & RMtxt & "<br />")
'response.write("ATxt := " & ATxt & "<br />")
If ATxt<>"" Then
	ATxt="SELECT [FabricanteID]  FROM [WebSiteMINITEL].[dbo].[WN_Fabricante] where Fabricante like '%" & ATxt & "%'"
'    response.write("ATxt := " & ATxt & "<br />")
	ATxt=Trim(db.Query(cstr(ATxt))("FabricanteID"))
'    response.write("ATxt := " & ATxt & "<br />")
	RMtxt=Replace(RMtxt,"Marca=" & RMtxt2,"FABRICANTEID=" & ATxt & RMtxt3)
'    response.write("RMtxt := " & RMtxt & "<br />")
'	response.Redirect("/?FABRICANTEID="& ATxt &"&OP=ListaProdutos")
	response.Redirect("/?" & RMtxt)
End if
%>
