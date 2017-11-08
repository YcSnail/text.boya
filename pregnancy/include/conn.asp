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
sub AssistantClass()
set rs=server.CreateObject("adodb.recordset")
sql="select * from Assistantclass where parentclassid=0 order by px desc,id desc"
rs.open sql,conn,1,1
for i=1 to rs.recordcount
if request("AssistantCid")="" then
    if i=1 then AssistantCid=rs("id")
else
	AssistantCid=request("AssistantCid")
end if
%>
 <li <%if cstr(AssistantCid)=cstr(rs("id")) then response.Write("class='service_tab_current'")%> ><a href="?AssistantCid=<%=rs("id")%>" onFocus="this.blur();"><%=rs("classname")%></a> </li>
<%
rs.movenext
next
rs.close
set rs=nothing
end sub


sub Assistant(AssistantCid)
set rs=server.CreateObject("adodb.recordset")
sql="select * from Assistant where id>0 "
if AssistantCid<>"" then sql=sql&" and oneclassid="&AssistantCid&" "
sql=sql&"order by px desc,id desc"
rs.open sql,conn,1,1
if rs.eof and rs.bof then
	response.Write("<a href=#>No Information</a>")
else
%>
<div class="service_box clear">
      <ul id="menu1">
<%
for i=1 to rs.recordcount
if rs.eof then exit for
%>
<li><img src="../images/arrow.jpg" />&nbsp;&nbsp;<a href="#" onfocus="this.blur();"  style="font-weight:bold; color:#F60">
			<%=rs("title")%></a>
			<ul>
				<li>
					<p style="border:1px dotted #FD8F46; padding:8px; color:#e77208">
					 <%=rs("content")%></p>
				</li>
			</ul>
		</li>

<%
rs.movenext
next
%>
</ul>
</div>
<%
end if
rs.close
set rs=nothing
end sub


sub Magazine
set rs=server.CreateObject("adodb.recordset")
sql="select * from Magazine order by px desc,id desc"

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
    <td><a href="Magazine/index.asp?id=<%=rs("id")%>" target="_blank"><img src="../<%=rs("pic")%>" width="150" height="200" style="display: block" /></a></td>
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


sub Knowledge
%>
<img src="../images/baodian.jpg" /><b style="color:#ff6600; font-size:14px">孕期四十周 （点击色块查看信息）</b><br><br>
<span class="gallery">

<%
set rs=server.createobject("adodb.recordset")
sql="select * from knowledge where oneclassid=1 order by px desc,id desc"
rs.open sql,conn,1,1
for ii=1 to rs.recordcount
if rs("subtitle")<>"" then 
bgc="FF7733"
bgl="<img src='images/zs-l.jpg' style='float:left'>"
bgr="<img src='images/zs-r.jpg'  style='float:left'>"
else 
bgc="FF9D00"
bgl="<img src='images/cs-l.jpg'  style='float:left'>"
bgr="<img src='images/cs-r.jpg' style='float:left'>"
end if
%>
   <a href="#inline_demo<%=ii%>" rel="prettyPhoto[inline]" style="cursor:pointer; float:left; margin-right:6px; margin-top:12px">
   	<table cellspacing="0" cellpadding="0" border="0"  title="<%=rs("title")%>"><tr><td><%=bgl%></td><td style="background:#<%=bgc%>;color:#ffffff; white-space:nowrap"><%if rs("subtitle")<>"" then response.Write rs("subtitle") else response.Write("&nbsp;&nbsp;&nbsp;") end if%></td><td><%=bgr%></td></tr></table>
   </a>
<%if ii mod 15=0 then response.Write("<br style='clear:both'>")%>   
   <div id="inline_demo<%=ii%>" style="display:none;"><span style="line-height:156%;"><b><%=rs("title")%></b><br><%=rs("content")%></span></div>
<%
rs.movenext
next
rs.close
set rs=nothing
%>
<br style='clear:both'>
<p>&nbsp;</p>
<p>&nbsp;</p>
<img src="../images/baodian1.jpg" /><b style="color:#ff6600; font-size:14px">新生儿十二个月（点击色块查看信息）</b><br><br>

<%
set rs=server.createobject("adodb.recordset")
sql="select * from knowledge where oneclassid=2 order by px desc,id desc"
rs.open sql,conn,1,1
for ii=1 to rs.recordcount
if rs("subtitle")<>"" then 
bgc="90d151"
bgl="<img src='images/ls-l.jpg' style='float:left'>"
bgr="<img src='images/ls-r.jpg'  style='float:left'>"
else 
bgc="AED140"
bgl="<img src='images/ns-l.jpg'  style='float:left'>"
bgr="<img src='images/ns-r.jpg' style='float:left'>"
end if
%>
   <a href="#inline_demoo<%=ii%>" rel="prettyPhoto[inline]" style="cursor:pointer; float:left; margin-right:6px; margin-top:12px">
   	<table cellspacing="0" cellpadding="0" border="0" title="<%=rs("title")%>" ><tr><td><%=bgl%></td><td style="background:#<%=bgc%>;color:#ffffff; white-space:nowrap"><%if rs("subtitle")<>"" then response.Write rs("subtitle") else response.Write("&nbsp;&nbsp;&nbsp;") end if%></td><td><%=bgr%></td></tr></table>
   </a>
<%if ii mod 15=0 then response.Write("<br style='clear:both'>")%>   
   <div id="inline_demoo<%=ii%>" style="display:none;"><span style="line-height:156%;"><b><%=rs("title")%></b><br><%=rs("content")%></span></div>
<%
rs.movenext
next
rs.close
set rs=nothing
%>

</span>

<script type="text/javascript" charset="utf-8">
		$(document).ready(function(){
			$(".gallery a[rel^='prettyPhoto']").prettyPhoto({theme:'facebook'});
		});
		</script>

<%end sub%>
