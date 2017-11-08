<!--#include file="include/conn.asp"-->
<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<head>
<!--#include file="../inc_mobile.asp"--><title>
	boyalife博雅干细胞科技有限公司（博雅干细胞库）
</title><link href="../css/common.css" rel="stylesheet" type="text/css" /><link href="../css/else.css" rel="stylesheet" type="text/css" />

    <script src="../js/jquery-1.4.min.js" type="text/javascript"></script>

<meta name="keywords" content="博雅干细胞库,符合国际标准的高端干细胞库,国际干细胞联合研究中心,无锡国际干细胞联合研究中心" /><meta name="description" content="博雅干细胞库2009年成立于无锡，博雅干细胞库是由博雅干细胞科技有限公司整体运营的，由来自全球知名的干细胞存储、研究团队组建，中国内地首家也是唯一一家按照国际aabb（美国血库协会）标准设计和建立的干细胞库，代表着目前该领域国际最领先的技术水平。" /></head>
<body>
<%
set rs=server.createobject("adodb.recordset")
sql="select * from tb_video where id="&clng(request("id"))
rs.open sql,conn,1,1
%>
    <div class="alerttit">
        <h2>
            在线视频</h2>
    </div>
    <div id="flash" class="carsvideo">

			
		<object type="application/x-shockwave-flash" data="vcastr3.swf" width="420" height="340" id="vcastr3">
			<param name="movie" value="vcastr3.swf"/> 
			<param name="allowfullscreen" value="true" />
			<param name="flashvars" value="xml=
				<vcastr>
					<channel>
						<item>
							<source>../<%=rs("filepath")%></source>
							<duration></duration>
							<title></title>
						</item>
					</channel>
					<config>
					<buffertime>4</buffertime> 
					<isautoplay>true</isautoplay> 
					<isrepeat>true</isrepeat>  
					<isloadbegin>true</isloadbegin> 
　　				<isshowabout>true</isshowabout> 

					</config>
					
				</vcastr>"/>
		</object>
		
		
    </div>
<!-- boyalife.com baidu tongji analytics -->
<script type="text/javascript">
var _bdhmprotocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3cscript src='" + _bdhmprotocol + "hm.baidu.com/h.js%3f73b8ef2157e56c7b6d0ef7c2598feff0' type='text/javascript'%3e%3c/script%3e"));
</script>
</body>
</html>
