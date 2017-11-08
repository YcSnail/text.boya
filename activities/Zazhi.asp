<!--#include file="include/conn.asp"-->
<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<head>
<!--#include file="../inc_mobile.asp"--><title>boyalife博雅干细胞科技有限公司（博雅干细胞库）</title>
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<link href="../css/else.css" rel="stylesheet" type="text/css" />

    <script src="../js/jquery-1.4.min.js" type="text/javascript"></script>

    <script src="../js/nav.js" type="text/javascript"></script>

    <!--[if ie 6]>
	    <script type="text/javascript" src="../js/dd_belatedpng.js" ></script>
	    <script type="text/javascript">
	    dd_belatedpng.fix('.left_side ul li a:hover,.left_side ul li.left_current a,.work_step_tit');
	    </script>
    <![endif]-->
<meta name="keywords" content="博雅干细胞库,符合国际标准的高端干细胞库,国际干细胞联合研究中心,无锡国际干细胞联合研究中心" /><meta name="description" content="博雅干细胞库2009年成立于无锡，博雅干细胞库是由博雅干细胞科技有限公司整体运营的，由来自全球知名的干细胞存储、研究团队组建，中国内地首家也是唯一一家按照国际aabb（美国血库协会）标准设计和建立的干细胞库，代表着目前该领域国际最领先的技术水平。" /></head>
<body>

    <div id="wrap">
        
        

<script type="text/javascript"> 
    var currenturl = window.location.href;
       function house() {
            //alert(title);
              window.external.addfavorite(currenturl,"boyalife博雅干细胞科技有限公司")
       }

</script>

<!--#include file="../inc_head.asp"-->

<!--#include file="../inc_nav.asp"-->
        
        <div class="lv_content"><div class="lv_banner1"><img src="images/banner.jpg" width="960" height="200" /></div>
            
            <div class="lv_box">
                
                <div class="left_side">
                    <div class="left_side_tit">
                        <img src="../images/else/left_tit05.jpg" style="display: block;" />
                    </div>
                    
<ul>
    <li   style="display:none;"><a href="index.html" onfocus="this.blur();">索取资料</a></li>
    <li   style="display:none;"><a href="action.html" onfocus="this.blur();">博雅免费存储活动</a></li>
    <li><a href="../stemcells/research3.html" onfocus="this.blur();">学术课堂</a></li>  
    <li><a href="newszx.html" onfocus="this.blur();">行业资讯</a></li>
   
    <li><a href="video.html" onfocus="this.blur();">在线视频</a></li>
    <li class="left_current"><a href="zazhi.html" onfocus="this.blur();">母婴杂志</a></li>
    <li><a href="investigation.html" onfocus="this.blur();">在线调查</a></li>
</ul>
<div class="left_img">
    <a href="../stemcells/index.html">
        <img src="../images/else/img01.jpg" style="display: block;" /></a>
</div>

<!--#include file="../inc_leftlastnews.asp"-->


                </div>
                
                <div class="rignt_con">
                    <div class="lv_tree">
                        <div class="lv_tree_tit">
                            <img src="../images/default/ico01.jpg" align="absmiddle" />&nbsp;&nbsp;母婴杂志</div>
                        <p>
                            您现在的位置：<span><a href="../index.html">首页</a></span> - <span><a href="action.html">资料库</a></span>
                            - <span class="lv_tree_current"><a href="#">母婴杂志</a></span></p>
                    </div>
                    <div class="box">
                    		<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
									<tr>
						<script type="text/javascript">
function disp_prompt()
{
    alert("您还不是会员，请先注册！");
		window.location.assign("../member/index.html");
}
</script>
<%
if session("m_user") <>"" then
hr="magazine1.html"
hr1="../pregnancy/magazine.html"
else
hr="javascript:disp_prompt();"
hr1="javascript:disp_prompt();"
end if
%>			
											<td><div align="center"><a href="<%=hr%>">
<%
set rs=server.createobject("adodb.recordset")
sql="select * from information where id=7 order by px desc"
rs.open sql,conn,1,1
do while not rs.eof
%>
<img src="../<%=rs("pic")%>" width="272" height="366" border="0" />
<%
rs.movenext
loop
rs.close
set rs=nothing
%></a></div></td>
											<td><div align="center"><a href="<%=hr1%>"><%
set rs=server.createobject("adodb.recordset")
sql="select * from information where id=6 order by px desc"
rs.open sql,conn,1,1
do while not rs.eof
%>
<img src="../<%=rs("pic")%>" width="272" height="366" border="0" />
<%
rs.movenext
loop
rs.close
set rs=nothing
%></a></div></td>
											
									</tr>
									<tr>
											<td height="30"><div align="center"><strong><a href="<%=hr%>"><font color="fb6911" style="font-size:14px">博雅孕育堂</font></a></strong></div></td>
											<td><div align="center"><strong><a href="<%=hr1%>"><font color="fb6911" style="font-size:14px">你好宝贝</font></a></strong></div></td>
									</tr>
							</table>
                    </div>
                </div>
            </div>
        </div>
        
        
<!--#include file="../inc_foot.asp"-->

    </div>
<!-- boyalife.com baidu tongji analytics -->
<script type="text/javascript">
var _bdhmprotocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3cscript src='" + _bdhmprotocol + "hm.baidu.com/h.js%3f73b8ef2157e56c7b6d0ef7c2598feff0' type='text/javascript'%3e%3c/script%3e"));
</script>
</body>
</html>
