<!--#include file="include/conn.asp"-->
<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<head>
<!--#include file="../inc_mobile.asp"-->
<title>为何存储干细胞（博雅干细胞库）-boyalife博雅干细胞科技有限公司</title>
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<link href="../css/else.css" rel="stylesheet" type="text/css" />

    <script src="../js/jquery-1.4.min.js" type="text/javascript"></script>

    <script src="../js/nav.js" type="text/javascript"></script>

    <!--[if ie 6]>
	    <script type="text/javascript" src="../js/dd_belatedpng.js" ></script>
	    <script type="text/javascript">
	    dd_belatedpng.fix('.left_side ul li a:hover,.left_side ul li.left_current a');
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

        
        <div class="lv_content">  <div class="lv_banner1"><img src="images/banner.jpg" width="960" height="200"></div>
            
            <div class="lv_box">
                
                <div class="left_side">
                    <div class="left_side_tit">
                        <img src="../images/else/left_tit02.jpg" style="display: block;" />
                    </div>
                    

<ul>
    <li><a href="index.html" onfocus="this.blur();">干细胞简历</a></li>
    <li><a href="zxxb.html" onfocus="this.blur();">脐带血干细胞</a></li>
    <!-- <li><a href="czxb.html" onfocus="this.blur();">脐带间充质干细胞</a></li>-->
	<li><a href="tpxb.html" onfocus="this.blur();">脐带/胎盘干细胞</a></li>
	<li><a href="kzljb.html" onfocus="this.blur();">可治疗的疾病</a></li>
		<!--
    <li><a href="disease.html" onfocus="this.blur();">可治疗的疾病</a></li>
    <li><a href="donation.html" onfocus="this.blur();">互捐互赠</a></li>-->
    <li><a href="treatment.html" onfocus="this.blur();">治疗案例</a></li>
	
    <li class="left_current"><a href="research.html" onfocus="this.blur();">研究新动态</a></li><!--
    <li><a href="quickdefault.html" onfocus="this.blur();">快速浏览</a></li>-->


</ul>
<div class="left_img">
    <a href="index.html">
        <img src="../images/else/img01.jpg" style="display: block;" /></a>
</div>

<!--#include file="../inc_leftlastnews.asp"-->

                </div>
                
                <div class="rignt_con">
                    <div class="lv_tree">
                        <div class="lv_tree_tit">
                            <img src="../images/default/ico01.jpg" align="absmiddle" />&nbsp;&nbsp;研究新动态</div>
                        <p>
                            您现在的位置：<span><a href="../index.html">首页</a></span> - <span><a href="index.html">为何存储干细胞</a></span>
                            - <span class="lv_tree_current"><a href="#">研究新动态</a></span></p>
                    </div>
                    <div class="box">
                       		<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
															<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																					<td style="border-bottom:1px solid #fcedc8" width="70%"><strong><font color="fb6911" style="font-size:14px">学术课堂</font></strong></td>
																			<td style="border-bottom:1px solid #fcedc8" width="30%"><div align="right"><a href="research3.html"><font color="fb6911">+more</font></a></div></td>
																	</tr>
															</table></td>
													</tr>
													<tr>
															<td height="10" colspan="2"></td>
													</tr>
													<tr>
															<td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
																			<%
set rs=server.createobject("adodb.recordset")
sql="select top 2 * from tb_article where classid=(select classid from tb_articletype where classname='学术课堂' ) order by id desc"
rs.open sql,conn,1,1
do while not rs.eof
%>
																			<tr>
																					<td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
																							<tr>
																											<td width="160" style="background:url(../images/else/img_bg_small.png) no-repeat center left; padding:4px"><a href="<%if ""&rs("picbig")&""<>"" then%>../<%=rs("picbig")%><%else%>research3.asp?id=<%=rs("id")%>&amp;classid=<%=rs("classid")%>"<%end if%>"><img src="../<%=rs("picsmall")%>" width="131" height="84" style="display: block" /></a></td>
																									<td><ul>
																															<li>
																																	<p><a href="<%if ""&rs("picbig")&""<>"" then%>../<%=rs("picbig")%><%else%>research3.asp?id=<%=rs("id")%>&amp;classid=<%=rs("classid")%>"<%end if%>"><strong><font color="fb6911"><%=rs("title")%></font></strong></a> </p>
																																	<p><%=gottopic(removehtml(rs("content")),300)%></p>
																															</li>
																									</ul></td>
																							</tr>
																					</table></td>
																			</tr>
<tr><td height="10px"></td></tr>
																			<%
rs.movenext
loop
rs.close
set rs=nothing
%>

															</table></td>
													</tr>
													<tr>
															<td colspan="2">&nbsp;</td>
													</tr>
									<tr>
											<td colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
													<tr>
															<td style="border-bottom:1px solid #fcedc8"><strong><font color="fb6911" style="font-size:14px">临床进展</font></strong></td>
															<td style="border-bottom:1px solid #fcedc8" ><div align="right"><a href="research1.html"><font color="fb6911">+more</font></a></div></td>
													</tr>
											</table>																								</tr>
									<tr>
											<td height="10" colspan="2"></td>
									</tr>
									<tr>
											<td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
													<%
set rs=server.createobject("adodb.recordset")
sql="select top 2 * from tb_article where classid=(select classid from tb_articletype where classname='临床进展' ) order by id desc"
rs.open sql,conn,1,1
do while not rs.eof
%>
													<tr>
															<td height="35" colspan="2"><table width="100%" border="0" cellspacing="0" cellpadding="0">
																			<tr>
																					<td width="160" style="background:url(../images/else/img_bg_small.png) no-repeat center left; padding:4px"><a href="research1.asp?id=<%=rs("id")%>&amp;classid=<%=rs("classid")%>" ><img src="../<%=rs("picsmall")%>" width="131" height="84" style="display: block" /></a></td>
																					<td><ul>
																									<li>
																											<p><a href="research1.asp?id=<%=rs("id")%>"><strong><font color="fb6911"><%=rs("title")%></font></strong></a> </p>
																											<p><%=gottopic(removehtml(rs("content")),300)%></p>
																									</li>
																					</ul></td>
																			</tr>
															</table></td>
													</tr>
<tr><td height="10px"></td></tr>
													<%
rs.movenext
loop
rs.close
set rs=nothing
%>
													<tr>
															<td colspan="2">&nbsp;</td>
													</tr>
												
													<tr>
															<td><table width="100%" border="0" cellspacing="0" cellpadding="0">
																	<tr>
																					<td style="border-bottom:1px solid #fcedc8" width="70%"><strong><font color="fb6911" style="font-size:14px">行业风向标</font></strong></td>
																			<td style="border-bottom:1px solid #fcedc8" width="30%"><div align="right"><a href="research2.html"><font color="fb6911">+more</font></a></div></td>
																	</tr>
															</table></td>
													</tr>
													<tr>
															<td height="10" colspan="2"></td>
													</tr>
													<tr>
															<td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
																			<%
set rs=server.createobject("adodb.recordset")
sql="select top 2 * from tb_article where classid=(select classid from tb_articletype where classname='行业风向标' ) order by id desc"
rs.open sql,conn,1,1
do while not rs.eof
%>
																			<tr>
																					<td height="35"><table width="100%" border="0" cellspacing="0" cellpadding="0">
																							<tr>
																											<td width="160" style="background:url(../images/else/img_bg_small.png) no-repeat center left; padding:4px"><a href="research2.asp?id=<%=rs("id")%>&amp;classid=<%=rs("classid")%>"><img src="../<%=rs("picsmall")%>" width="131" height="84" style="display: block" /></a></td>
																									<td><ul>
																															<li>
																																	<p><a href="research2.asp?id=<%=rs("id")%>"><strong><font color="fb6911"><%=rs("title")%></font></strong></a> </p>
																																	<p><%=gottopic(removehtml(rs("content")),300)%></p>
																															</li>
																									</ul></td>
																							</tr>
																					</table></td>
																			</tr>
<tr><td height="10px"></td></tr>
																			<%
rs.movenext
loop
rs.close
set rs=nothing
%>

															</table></td>
													</tr>
													<tr>
															<td height="10px" colspan="2">&nbsp;</td>
													</tr>

											</table>											
											<p>&nbsp;</p>											</td></tr></td></table>
                       		<p>&nbsp;</p>

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
