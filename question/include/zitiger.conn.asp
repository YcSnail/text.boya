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


