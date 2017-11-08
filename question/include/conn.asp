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
sub questionnew
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Question where classid=(select classid from TB_QuestionType where classname='干细胞知识') order by AddTime Desc"
rs.open sql,conn,1,1
rs.pagesize =12
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
 <div class="question_list">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<%
for i=1 to rs.pagesize
if rs.eof then exit for
%>
<tr>
<td height="30" style="border-bottom:1px solid #FCE9CD">
  <span style="float:left"> <a href="?id=<%=rs("id")%>" onFocus="this.blur();"><em><%=rs("content")%></em></a></span> <span style="float:right"> <%=year(rs("AddTime"))%>-<%=month(rs("AddTime"))%>-<%=day(rs("AddTime"))%></span>
</td>
</tr>
<%
rs.movenext
next
%>
</table>
  <div id="pgArticle" style=" text-align:right; padding-top:10px;">
                                
<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>


	</div>
</div>
<%
end if
rs.close
set rs=nothing

end sub



sub showquestiontitle(id)'显示新闻标题'

set rs=server.CreateObject("ADODB.Recordset")   
sql="select * from TB_Question where ID>0 "
if id<>"" then sql=sql&"and ID="&clng(id)&" "
sql=sql&"order by id"
rs.Open sql,Conn,1,3

response.write rs("content") & " -BOYALIFE博雅干细胞科技有限公司"

rs.close
set rs=nothing
end sub



sub showquestionnew(id)'显示新闻内容'
dim arrLink()
dim arrTitle()
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Question "
sql=sql&"order by id"
rs.open sql,conn,1,1
for i=1 to rs.recordcount
  ReDim Preserve arrLink(i-1)
  arrLink(i-1)=rs("ID")
  ReDim Preserve arrTitle(i-1)
  arrTitle(i-1)=rs("Content")
rs.movenext
next
rs.close
set rs=nothing
set rs=server.CreateObject("ADODB.Recordset")   
sql="select * from TB_Question where ID>0 "
if id<>"" then sql=sql&"and ID="&clng(id)&" "
sql=sql&"order by id"
rs.Open sql,Conn,1,3

strTemp="<table width='100%' border='0' cellspacing='0' cellpadding='0' align='center'>"
strTemp=strTemp&"<tr><td height='30' align='center'><strong style='font-size:14px; color:#ff6600'>"&rs("content")&"</strong></td></tr>"
strTemp=strTemp&"<tr><td height='30' align='center'>"&AddDate_lang&rs("Addtime")&"</td></tr>"
strTemp=strTemp&"<tr><td style='border-top:1px dashed #cccccc; padding:10px'>"
strContent=replace(rs("answer"),"uploadfiles/",JumpRel&"uploadfiles/")


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






sub question
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Question where classid=(select classid from TB_QuestionType where classname='干细胞知识')"
rs.open sql,conn,1,1
rs.pagesize =12
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
 <div class="question_list">
       <ul id="menu">
<%
for i=1 to rs.pagesize
if rs.eof then exit for
%>
<li class="menu_tit"><a href="#" onfocus="this.blur();"><%=rs("content")%></a>
	<ul>
		<li class="menu_con">
			<p>
			<%=rs("answer")%></p>
		</li>
	</ul>
</li>
<%
rs.movenext
next
%>
</ul>
  <div id="pgArticle" style=" text-align:right; padding-top:10px;">
                                
<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>


	</div>
</div>
<%
end if
rs.close
set rs=nothing

end sub

sub senseClass()
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_QuestionType where parentid=(select classid from TB_QuestionType where classname='干细胞的业务常识') order by px desc,classid desc"
rs.open sql,conn,1,1
for i=1 to rs.recordcount
if request("senseCid")="" then
    if i=1 then senseCid=rs("classid")
else
	senseCid=request("senseCid")
end if
%>
 <li <%if cstr(senseCid)=cstr(rs("classid")) then response.Write("class='service_tab_current'")%> ><a href="Nous.asp?senseCid=<%=rs("classid")%>" onFocus="this.blur();"><%=rs("classname")%></a> </li>
<%
rs.movenext
next
rs.close
set rs=nothing
end sub


sub sense(senseCid)
set rs=server.CreateObject("adodb.recordset")
sql="select * from TB_Question where id>0 "
if senseCid<>"" then sql=sql&" and classid="&senseCid&" "
sql=sql&"order by px desc,id desc"
rs.open sql,conn,1,1
rs.pagesize =12
page=clng(request("page"))
if page<=0 then page=1 
if page > rs.pagecount then page=rs.pagecount
if not rs.eof then rs.AbsolutePage=page
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
<div class="service_box clear">
      <ul id="menu1">
<%
for i=1 to rs.pagesize
if rs.eof then exit for
%>
<li class="menu_tit1"><a href="#" onfocus="this.blur();">
			<%=rs("content")%></a>
			<ul>
				<li class="menu_con1">
					<p>
					 <%=rs("answer")%></p>
				</li>
			</ul>
		</li>

<%
rs.movenext
next
%>
</ul>
  <div id="pgArticle" style=" text-align:right; padding-top:10px;">
                                
<p style="padding:15px 0">
<%
pageObj.pageskin=6
pageObj.img_path="../image/"
response.Write pageObj.link(rs.recordcount,rs.pagesize,page,"?page=",qryString)
%>
</p>

	</div>
</div>
<%
end if
rs.close
set rs=nothing
end sub
%>


