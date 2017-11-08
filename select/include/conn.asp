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
if request("action")="QuickViewSave" then
	IsParent=trim(request("IsParent"))
	txtEmail=trim(request("txtEmail"))
	txtName=trim(request("txtName"))
	txtTel=trim(request("txtTel"))
	txtPost=trim(request("txtPost"))
	txtChildBirth=trim(request("txtChildBirth"))
	select case trim(request("drpSelect"))
	case 1:drpSelect="医院"
	case 2:drpSelect="网络"
	case 3:drpSelect="朋友/亲戚"
	case 4:drpSelect="产科医生"
	case 5:drpSelect="客户推荐"
	case 6:drpSelect="其他人推荐"
	case 7:drpSelect="宣传册"
	case 8:drpSelect="产前课程"
	case 9:drpSelect="报刊杂志"
	case 10:drpSelect="电视"
	case 11:drpSelect="广播"
	case 12:drpSelect="其他"
	end select
	
	
	select case trim(request("drpHospital"))
	case 1:drpHospital="无锡市妇幼保健院"
	case 2:drpHospital="无锡市人民医院"
	case 3:drpHospital="无锡市第四人民医院"
	end select
	
	txtOther=trim(request("txtOther"))
	select case trim(request("rdoChoice"))
	case 1:rdoChoice="我想将我宝宝的脐带（血）存储于私体库，用于我的家人。"
	case 2:rdoChoice="我想将我宝宝的脐带（血）捐献给公体库。"
	case 3:rdoChoice="我不确定。"
	end select 
	txtRemark=trim(request("txtRemark"))
	
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select * from tb_view",conn,1,3
	rs.addnew
	rs("IsParent")=IsParent
	rs("Email")=txtEmail
	rs("Name")=txtName
	rs("Tel")=txtTel
	rs("Post")=txtPost
	rs("ChildBirth")=txtChildBirth
	rs("howknow")=drpSelect
	rs("Hospital")=drpHospital
	rs("Choice")=rdoChoice
	rs("Remark")=txtRemark
	rs("AddTime")=now()
	rs.update
	rs.close
	set rs=nothing
	alert("提交成功")
	go("QuickDefault.html")
end if
%>

<%
sub news
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Article where classid=(select classid from TB_ArticleType where classname='服务承诺与质检保证' ) order by addtime desc"
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
  <span style="float:left"> <a href="?id=<%=rs("id")%>&classid=<%=rs("classid")%>" onFocus="this.blur();"><em><%=rs("title")%></em></a></span> <span style="float:right"> <%=year(rs("AddTime"))%>-<%=month(rs("AddTime"))%>-<%=day(rs("AddTime"))%></span>
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

sub shownews(id)'显示新闻内容'
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