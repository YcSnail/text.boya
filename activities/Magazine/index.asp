﻿<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001" LCID="2052"%>
<%
response.buffer=true	
'强制浏览器重新访问服务器下载页面，而不是从缓存读取页面
Response.Buffer = True 
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1 
Response.Expires = 0 
Response.CacheControl = "no-cache" 
Response.CodePage="65001":Response.Charset="utf-8":Response.LCID="2052"%>
<!--#include file="../../include/config.asp"-->
<%
call openconn("../../")
set rs=server.CreateObject("adodb.recordset")
rs.open "select * from Magazine1 where id="&clng(request("id"))&"",conn,1,1
title=rs("title")

set rss=server.CreateObject("adodb.recordset")
rss.open "select * from NImage1 where parentid="&clng(request("id"))&" order by px asc,id desc",conn,1,1

XMLFILE="xml/Pages.xml"
dim writeContent
writeContent="<content width=""710"" height=""960"" bgcolor=""cccccc"" loadercolor=""ffffff""  panelcolor=""DC851F"" buttoncolor=""DC851F"" textcolor=""ffffff"">"&chr(10)
do while not rss.eof
writeContent=writeContent&"<page src=""./../../"&rss("pic")&"""/>"&chr(10)
rss.movenext
loop
writeContent=writeContent&"</content>"

call writefile(XMLFILE,writeContent)

function writefile(ByVal fileUrl,ByVal content)
	Set objFSO=Server.CreateObject("Scripting.FileSystemObject")
		If objFSO.FileExists(Server.MapPath(fileUrl)) Then
			Set f=objFSO.OpenTextFile(Server.MapPath(fileUrl), 2, True)
				f.writeline(content)
				WriteFile=True
			Set f=Nothing
		else
			WriteFile=False
		end if
	Set objFSO=Nothing
end function
%>
<html><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.1//EN" "http://www.w3.org/TR/xhtml11/DTD/xhtml11.dtd"><head>
<!--#include file="../../inc_mobile.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title><%=title%>-BOYALIFE博雅干细胞科技有限公司</title>

<style type="text/css">
<!--
body {
	background-color: #ccc;
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
}
-->
</style></head>
<body>
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=8,0,0,0" width="100%" height="100%">
  <param name="movie" value="swf/Magazine.swf" />
  <param name="quality" value="high" />
  <param name="bgcolor" value="#cccccc" />
  <param name="allowFullScreen" value="true" />
  <param name="allowScriptAccess" value="sameDomain" />
  <embed src="swf/Magazine.swf" width="100%" height="100%" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" allowFullScreen="true" allowScriptAccess="sameDomain"></embed>
</object>
<!-- boyalife.com Baidu tongji analytics -->
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F73b8ef2157e56c7b6d0ef7c2598feff0' type='text/javascript'%3E%3C/script%3E"));
</script>
</body></html>