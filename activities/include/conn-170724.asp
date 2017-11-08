<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" LCID="2052"%>
<%Response.CodePage="65001":Response.Charset="utf-8":Response.LCID="2052"%>
<!--#include file="../../include/config.asp"-->
<!--#include file="../../include/md5.asp"-->
<!--#include file="../../include/function.asp"-->
<!--#include file="../../include/pager.class.asp"-->
<!--#include file="../../include/mail.class.asp"-->
<% 
JumpRel="../"
call OpenConn(JumpRel)
%>
<!--#include file="../../global.asp"-->

<%
sub news
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Article where classid=(select classid from TB_ArticleType where classname='博雅动态' )  order by "&NewsPXMethod'addtime desc"
rs.open sql,conn,1,1

titleChrNum=50
rs.pagesize =12
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
<table  width="100%" cellpadding="0" cellspacing="0" border="0">
<%
for i=1 to rs.pagesize
if rs.eof then exit for
if i=1 then
%>
<tr>
<td style="padding-bottom:30px">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
   <%if rs("Picsmall")<>"" then%>
    <td valign="top" width="175"><a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>"><img src="<%=JumpRel%><%=rs("Picsmall")%>" width="163" height="104" style="display: block; margin: 0 auto;" /></a></td>
    <%end if%>
    <td valign="top">
       <p><strong><a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>"><%=rs("title")%></a></strong></p>
       <p><%=year(rs("AddTime"))%>-<%=month(rs("AddTime"))%>-<%=day(rs("AddTime"))%></p>
       <p><%=gotTopic(RemoveHTML(rs("content")),300)%></p>
    </td>
  </tr>
</table>

</td>
</tr>
<%else%>
<tr>
<td height="30" style="border-bottom:1px solid #FCE9CD">
  <span style="float:left"> 
  	<a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>" onFocus="this.blur();"><em><%=rs("title")%></em></a></span> 
  <span style="float:right"> <%=year(rs("AddTime"))%>-<%=month(rs("AddTime"))%>-<%=day(rs("AddTime"))%></span>
</td>
</tr>
<%end if

rs.movenext
next
%>
</table>

<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>
<%
end if
rs.close
set rs=nothing

end sub

sub shownews(id)'显示新闻内容'
dim arrLink()
dim arrTitle()
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Article where ID>0 "
if request("classid")<>"" then sql=sql&"and classid="&request("classid")&" "
sql=sql&"order by "&NewsPxMethod
'response.write(sql)
rs.open sql,conn,1,1
for i=1 to rs.recordcount
  ReDim Preserve arrLink(i-1)
  arrLink(i-1)=rs("ID")
  ReDim Preserve arrTitle(i-1)
  arrTitle(i-1)=rs("Title")
rs.movenext
next
rs.close
set rs=nothing
set rs=server.CreateObject("ADODB.Recordset")   

sql="select * from TB_Article where ID>0 "
if id<>"" then sql=sql&"and ID="&clng(id)&" "
sql=sql&"order by "&NewsPxMethod
'response.write(sql)
rs.Open sql,Conn,1,3
rs("Hits")=rs("Hits")+1
rs.update
strTemp="<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>"
strTemp=strTemp&"<tr><td height='30' align='center'><strong style='font-size:14px; color:#ff6600'>"&rs("Title")&"</strong></td></tr>"
strTemp=strTemp&"<tr><td height='30' align='center'>"&AddDate_lang&rs("Addtime")&Hits_lang&rs("Hits")&"</td></tr>"
strTemp=strTemp&"<tr><td style='border-top:1px dashed #cccccc; padding:10px'>"
strContent=replace(rs("Content"),"uploadfiles/",JumpRel&"uploadfiles/")
strContent=replace(strContent,"ImgUpload/",JumpRel&"ImgUpload/")
ContentLen=len(strContent)
CurrentPage=trim(request("page"))
if Instr(strContent,"[NextPage]")<=0 then
	strTemp=strTemp&strContent
else
	arrContent=split(strContent,"[NextPage]")
	pages=Ubound(arrContent)+1
	if CurrentPage="" then
		CurrentPage=1
	else
		CurrentPage=Cint(CurrentPage)
	end if
	if CurrentPage<1 then CurrentPage=1
	if CurrentPage>pages then CurrentPage=pages
	strTemp=strTemp&arrContent(CurrentPage-1)
	strTemp=strTemp&"<p align='center'>"
	pageObj.pageskin=3
	strTemp=strTemp&pageObj.link(pages,1,CurrentPage,"?page=","&id="&rs("ID")&"")
	strTemp=strTemp&"</p>"
end if
strTemp=strTemp&"</td></tr><tr><td align='center' height='80'><input type='button' style='background:url(../images/else/btn_bg.jpg);width:43px; height:19px; border:0; color:#ffffff' value='返回' onclick='history.back()'></td></tr><tr><td height='30'>"
for o=0 to ubound(arrLink)
  if arrLink(o)=rs("id") then
	  if o>0 then
		strTemp=strTemp&"<a href='?id="&arrLink(o-1)&"&classid="&request("classid")&"'>"&prevLink_lang&"："&arrTitle(o-1)&"</a>"
	  end if
	  strTemp=strTemp&"<br>"
	  if o<ubound(arrLink) then
		strTemp=strTemp&"<a href='?id="&arrLink(o+1)&"&classid="&request("classid")&"'>"&nextLink_lang&"："&arrTitle(o+1)&"</a>"
	  end if
  end if
next
strTemp=strTemp&"</td></tr></table>"
response.write strTemp
rs.close
set rs=nothing
end sub
%>



<%
sub news1
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Article where classid=(select classid from TB_ArticleType where classname='焦点新闻' ) order by addtime desc"
rs.open sql,conn,1,1

titleChrNum=50
rs.pagesize =12
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
<table  width="100%" cellpadding="0" cellspacing="0" border="0">
<%
for i=1 to rs.pagesize
if rs.eof then exit for
if i=1 then
%>
<tr>
<td style="padding-bottom:30px">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
   <%if rs("Picsmall")<>"" then%>
    <td valign="top" width="175"><a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>"><img src="<%=JumpRel%><%=rs("Picsmall")%>" width="163" height="104" style="display: block; margin: 0 auto;" /></a></td>
    <%end if%>
    <td valign="top">
       <p><strong><a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>"><%=rs("title")%></a></strong></p>
       <p><%=year(rs("AddTime"))%>-<%=month(rs("AddTime"))%>-<%=day(rs("AddTime"))%></p>
       <p><%=gotTopic(RemoveHTML(rs("content")),300)%></p>
    </td>
  </tr>
</table>

</td>
</tr>
<%else%>
<tr>
<td height="30" style="border-bottom:1px solid #FCE9CD">
  <span style="float:left"> <a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>" onFocus="this.blur();"><em><%=rs("title")%></em></a></span> <span style="float:right"> <%=year(rs("AddTime"))%>-<%=month(rs("AddTime"))%>-<%=day(rs("AddTime"))%></span>
</td>
</tr>
<%end if

rs.movenext
next
%>
</table>

<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>
<%
end if
rs.close
set rs=nothing

end sub

sub shownews1(id)'显示新闻内容'
dim arrLink()
dim arrTitle()
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Article where ID>0 "
if request("classid")<>"" then sql=sql&"and classid="&request("classid")&" "
sql=sql&"order by "&NewsPxMethod
rs.open sql,conn,1,1
for i=1 to rs.recordcount
  ReDim Preserve arrLink(i-1)
  arrLink(i-1)=rs("ID")
  ReDim Preserve arrTitle(i-1)
  arrTitle(i-1)=rs("Title")
rs.movenext
next
rs.close
set rs=nothing
set rs=server.CreateObject("ADODB.Recordset")   
sql="select * from TB_Article where ID>0 "
if id<>"" then sql=sql&"and ID="&clng(id)&" "
sql=sql&"order by "&NewsPxMethod
rs.Open sql,Conn,1,3
rs("Hits")=rs("Hits")+1
rs.update
strTemp="<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>"
strTemp=strTemp&"<tr><td height='30' align='center'><strong style='font-size:14px; color:#ff6600'>"&rs("Title")&"</strong></td></tr>"
strTemp=strTemp&"<tr><td height='30' align='center'>"&AddDate_lang&rs("Addtime")&Hits_lang&rs("Hits")&"</td></tr>"
strTemp=strTemp&"<tr><td style='border-top:1px dashed #cccccc; padding:10px'>"
strContent=replace(rs("Content"),"uploadfiles/",JumpRel&"uploadfiles/")
strContent=replace(strContent,"ImgUpload/",JumpRel&"ImgUpload/")
ContentLen=len(strContent)
CurrentPage=trim(request("page"))
if Instr(strContent,"[NextPage]")<=0 then
	strTemp=strTemp&strContent
else
	arrContent=split(strContent,"[NextPage]")
	pages=Ubound(arrContent)+1
	if CurrentPage="" then
		CurrentPage=1
	else
		CurrentPage=Cint(CurrentPage)
	end if
	if CurrentPage<1 then CurrentPage=1
	if CurrentPage>pages then CurrentPage=pages
	strTemp=strTemp&arrContent(CurrentPage-1)
	strTemp=strTemp&"<p align='center'>"
	pageObj.pageskin=3
	strTemp=strTemp&pageObj.link(pages,1,CurrentPage,"?page=","&id="&rs("ID")&"")
	strTemp=strTemp&"</p>"
end if
strTemp=strTemp&"</td></tr><tr><td align='center' height='80'><input type='button' style='background:url(../images/else/btn_bg.jpg);width:43px; height:19px; border:0; color:#ffffff' value='返回' onclick='history.back()'></td></tr><tr><td height='30'>"
for o=0 to ubound(arrLink)
  if arrLink(o)=rs("id") then
	  if o>0 then
		strTemp=strTemp&"<a href='?id="&arrLink(o-1)&"&classid="&request("classid")&"'>"&prevLink_lang&"："&arrTitle(o-1)&"</a>"
	  end if
	  strTemp=strTemp&"<br>"
	  if o<ubound(arrLink) then
		strTemp=strTemp&"<a href='?id="&arrLink(o+1)&"&classid="&request("classid")&"'>"&nextLink_lang&"："&arrTitle(o+1)&"</a>"
	  end if
  end if
next
strTemp=strTemp&"</td></tr></table>"
response.write strTemp
rs.close
set rs=nothing
end sub
%>




<%
sub newszx
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Article where classid=(select classid from TB_ArticleType where classname='行业资讯' )  order by "&NewsPXMethod'addtime desc"
rs.open sql,conn,1,1

titleChrNum=50
rs.pagesize =12
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
<table  width="100%" cellpadding="0" cellspacing="0" border="0">
<%
for i=1 to rs.pagesize
if rs.eof then exit for

%>
<tr>
<td height="30" style="border-bottom:1px solid #FCE9CD">
  <span style="float:left"> 
  	<a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>" onFocus="this.blur();"><em><%=rs("title")%></em></a></span> 
  <span style="float:right"> <%=year(rs("AddTime"))%>-<%=month(rs("AddTime"))%>-<%=day(rs("AddTime"))%></span>
</td>
</tr>
<%

rs.movenext
next
%>
</table>

<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>
<%
end if
rs.close
set rs=nothing

end sub

sub shownewszx(id)'显示行业资讯内容'
dim arrLink()
dim arrTitle()
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Article where ID>0 "
if request("classid")<>"" then sql=sql&"and classid="&request("classid")&" "
sql=sql&"order by "&NewsPxMethod
'response.write(sql)
rs.open sql,conn,1,1
for i=1 to rs.recordcount
  ReDim Preserve arrLink(i-1)
  arrLink(i-1)=rs("ID")
  ReDim Preserve arrTitle(i-1)
  arrTitle(i-1)=rs("Title")
rs.movenext
next
rs.close
set rs=nothing
set rs=server.CreateObject("ADODB.Recordset")   

sql="select * from TB_Article where ID>0 "
if id<>"" then sql=sql&"and ID="&clng(id)&" "
sql=sql&"order by "&NewsPxMethod
'response.write(sql)
rs.Open sql,Conn,1,3
rs("Hits")=rs("Hits")+1
rs.update
strTemp="<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>"
strTemp=strTemp&"<tr><td height='30' align='center'><strong style='font-size:14px; color:#ff6600'>"&rs("Title")&"</strong></td></tr>"
strTemp=strTemp&"<tr><td height='30' align='center'>"&AddDate_lang&rs("Addtime")&Hits_lang&rs("Hits")&"</td></tr>"
strTemp=strTemp&"<tr><td style='border-top:1px dashed #cccccc; padding:10px'>"
strContent=replace(rs("Content"),"uploadfiles/",JumpRel&"uploadfiles/")
strContent=replace(strContent,"ImgUpload/",JumpRel&"ImgUpload/")
ContentLen=len(strContent)
CurrentPage=trim(request("page"))
if Instr(strContent,"[NextPage]")<=0 then
	strTemp=strTemp&strContent
else
	arrContent=split(strContent,"[NextPage]")
	pages=Ubound(arrContent)+1
	if CurrentPage="" then
		CurrentPage=1
	else
		CurrentPage=Cint(CurrentPage)
	end if
	if CurrentPage<1 then CurrentPage=1
	if CurrentPage>pages then CurrentPage=pages
	strTemp=strTemp&arrContent(CurrentPage-1)
	strTemp=strTemp&"<p align='center'>"
	pageObj.pageskin=3
	strTemp=strTemp&pageObj.link(pages,1,CurrentPage,"?page=","&id="&rs("ID")&"")
	strTemp=strTemp&"</p>"
end if
strTemp=strTemp&"</td></tr><tr><td align='center' height='80'><input type='button' style='background:url(../images/else/btn_bg.jpg);width:43px; height:19px; border:0; color:#ffffff' value='返回' onclick='history.back()'></td></tr><tr><td height='30'>"
for o=0 to ubound(arrLink)
  if arrLink(o)=rs("id") then
	  if o>0 then
		strTemp=strTemp&"<a href='?id="&arrLink(o-1)&"&classid="&request("classid")&"'>"&prevLink_lang&"："&arrTitle(o-1)&"</a>"
	  end if
	  strTemp=strTemp&"<br>"
	  if o<ubound(arrLink) then
		strTemp=strTemp&"<a href='?id="&arrLink(o+1)&"&classid="&request("classid")&"'>"&nextLink_lang&"："&arrTitle(o+1)&"</a>"
	  end if
  end if
next
strTemp=strTemp&"</td></tr></table>"
response.write strTemp
rs.close
set rs=nothing
end sub
%>



















<%
sub Activity
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Article where classid=(select classid from TB_ArticleType where classname='活动花絮' ) order by "&NewsPXMethod
rs.open sql,conn,1,1
titleChrNum=50
rs.pagesize =6
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
for i=1 to rs.pagesize
if rs.eof then exit for
%>
 <ul>
	<li class="img_bg">
		<a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>"><img src="<%=JumpRel%><%=rs("picsmall")%>" width="131" height="84" style="display: block" border="0" /></a></li>
	<li class="img_con">
		<p><strong><a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>"><%=rs("title")%></a></strong></p>
		<p><%=gotTopic(removehtml(rs("content")),260)%>&nbsp;&nbsp;<a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>" style='color:#ff6600'>[点击查看]</a></p>
	</li>
</ul>
<%

rs.movenext
next
%>
<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>
<%
end if
rs.close
set rs=nothing
end sub
%>






<%
if request("action")="add" then

		arrStr1=array("","了解","一般","不了解")
		arrStr2=array("","很有用","一般","没有用","不了解")
		arrStr3=array("","会","看情况","不会","不了解")
		arrStr4=array("","有用","一般","没用","不了解")
		arrStr5=array("","成熟","一般","不成熟","不了解")
		arrStr6=array("","高","一般","不高","不了解")
		arrStr7=array("","3000以下","5000","1万","2万","3万以上")
		arrStr8=array("","20岁以下","21-25岁","26-30岁","31-35岁","36岁以上")
		arrStr9=array("","12周以下","13-20周","21-28周","29-35周","36周以上")
		arrStr10=array("","2万以下","2-5万(含5万)","5-10万(含10万)","10-20万(含20万)","20万以上")
		
		arrStr11=array("","一般企业","金融保险","机关、事业单","餐饮娱乐","文教","家庭主妇","其他")
		arrStr12=array("","网络","育儿书籍","报刊杂志","电视节目","专题讲座","亲友","其他")
		arrStr13=array("","愿意","看情况","不愿意")
		arrStr14=array("","愿意","看情况","不愿意")


		set rs=server.CreateObject("adodb.recordset")
		rs.open "select * from TB_Investigation",conn,1,3
		rs.addnew
		rs("isknow")=trim(request.Form("rdoKnow"))
		if trim(request("rdoKnow"))<>"" then rs("IsKnowtext")=arrStr1(cint(request("rdoKnow")))
		
		rs("ishelp")=trim(request.Form("rdoIsHelp"))
		if trim(request("rdoIsHelp"))<>"" then rs("IsHelpText")=arrStr2(cint(request("rdoIsHelp")))
		
		rs("IsSave")=trim(request.Form("rdoIsSave"))
		if trim(request("rdoIsSave"))<>"" then rs("IsSavetext")=arrStr3(cint(request("rdoIsSave")))
		
		rs("isstemsellhelp")=trim(request.Form("rdoIsStemSellHelp"))
		if trim(request("rdoIsStemSellHelp"))<>"" then rs("IsStemsellHelpText")=arrStr4(cint(request("rdoIsStemSellHelp")))
		
		rs("tech")=trim(request.Form("rdoTech"))
		if trim(request("rdoTech"))<>"" then rs("techtext")=arrStr5(cint(request("rdoTech")))
		
		rs("price")=trim(request.Form("rdoPrice"))
		if trim(request("rdoPrice"))<>"" then rs("pricetext")=arrStr6(cint(request("rdoPrice")))
		
		rs("money")=trim(request.Form("rdoMoney"))
		if trim(request("rdoMoney"))<>"" then rs("moneytext")=arrStr7(cint(request("rdoMoney")))
		
		rs("age")=trim(request.Form("rdoAge"))
		if trim(request("rdoAge"))<>"" then rs("agetext")=arrStr8(cint(request("rdoAge")))
		
		rs("Pregnancy")=trim(request.Form("rdoPregnancy"))
		if trim(request("rdoPregnancy"))<>"" then rs("PregnancyText")=arrStr9(cint(request("rdoPregnancy")))
		
		rs("income")=trim(request.Form("rdoIncome"))
		if trim(request("rdoIncome"))<>"" then rs("incometext")=arrStr10(cint(request("rdoIncome")))
		
		rs("Occupation")=trim(request.Form("rdoOccupation"))
		if trim(request("rdoOccupation"))<>"" then rs("OccupationText")=arrStr11(cint(request("rdoOccupation")))
		
		rs("way")=trim(request.Form("rdoWay"))
		if trim(request("rdoWay"))<>"" then rs("waytext")=arrStr12(cint(request("rdoWay")))

		rs("isjoin")=trim(request.Form("rdoIsjoin"))
		if trim(request("rdoIsjoin"))<>"" then rs("isjointext")=arrStr13(cint(request("rdoIsjoin")))

		rs("isyoga")=trim(request.Form("rdoIsYoga"))
		if trim(request("rdoIsYoga"))<>"" then rs("isyogatext")=arrStr14(cint(request("rdoIsYoga")))

		rs("name")=trim(request.Form("txtName"))
		rs("emailorqq")=trim(request.Form("txtEmail"))
		rs("linkmethod")=trim(request.Form("txtTel"))
		rs("addtime")=now()
		rs.update
		rs.close
		alert("提交成功")
		call gopage("js:back:-2",0)
end if


sub Magazine1
set rs=server.CreateObject("adodb.recordset")
sql="select * from Magazine1 where classid="&request("classid")&" order by px desc,id desc"
rs.open sql,conn,1,1
titleChrNum=50
rs.pagesize =8
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
	for i=1 to 2
	if rs.eof then exit for
	%>
  <tr>
<%
	for j=1 to 4
	if rs.eof then exit for
	%>
    <td>
    
 <table width="150" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><a href="Magazine/?id=<%=rs("id")%>" target="_blank"><img src="../<%=rs("pic")%>" width="150" height="200" style="display: block" /></a></td>
  </tr>
  <tr>
    <td align="center"><a href="Magazine/?id=<%=rs("id")%>" target="_blank"><strong><%=rs("title")%></strong></a></td>
  </tr>
</table>
   
    
    
    </td>
	<%
	rs.movenext
	next
%>
  </tr>
	<%
	next
%>
</table>
<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>
<%
end if
rs.close
set rs=nothing
end sub




sub Magazine2
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_MagazineType order by px desc,classid desc"
rs.open sql,conn,1,1
titleChrNum=50
rs.pagesize =6
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
	for i=1 to 2
	if rs.eof then exit for
	%>
  <tr>
<%
	for j=1 to 3
	if rs.eof then exit for
	%>
    <td>
    
 <table width="150" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><a href="Magazine.asp?classid=<%=rs("classid")%>" target="_self"><img src="../<%=rs("pic")%>" width="150" height="200" style="display: block" /></a></td>
  </tr>
  <tr>
    <td align="center"><a href="Magazine.asp?classid=<%=rs("classid")%>" target="_self"><strong><%=rs("classname")%></strong></a></td>
  </tr>
</table>
   
    
    
    </td>
	<%
	rs.movenext
	next
%>
  </tr>
	<%
	next
%>
</table>
<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>
<%
end if
rs.close
set rs=nothing
end sub














sub Magazine
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Download where classid=(select classid from TB_DownloadType where classname='电子杂志') order by "&NewsPXMethod
rs.open sql,conn,1,1
titleChrNum=50
rs.pagesize =12
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
<table  width="100%" cellpadding="0" cellspacing="0" border="0">
<%
for i=1 to rs.pagesize
if rs.eof then exit for
%>
<tr>
<td height="30" style="border-bottom:1px solid #FCE9CD">
  <span style="float:left"> <a href="<%=JumpRel%><%=rs("filepath")%>" target="_blank" onFocus="this.blur();"><em><%=rs("filename")%></em></a></span> <span style="float:right"><a href="<%=JumpRel%><%=rs("filepath")%>" target="_blank" onFocus="this.blur();"><em>点击下载</em></a> </span>
</td>
</tr>
<%
rs.movenext
next
%>
</table>

<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>
<%
end if
rs.close
set rs=nothing

end sub
%>


