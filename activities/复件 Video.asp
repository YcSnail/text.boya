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
    <li><a href="action.html" onfocus="this.blur();">博雅免费存储活动</a></li>
    <li><a href="tidbits.html" onfocus="this.blur();">活动花絮</a></li>
  
   
    <li class="left_current"><a href="video.html" onfocus="this.blur();">在线视频</a></li>
    <li><a href="magazine1.html" onfocus="this.blur();">电子杂志</a></li>
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
                            <img src="../images/default/ico01.jpg" align="absmiddle" />&nbsp;&nbsp;在线视频</div>
                        <p>
                            您现在的位置：<span><a href="../index.html">首页</a></span> - <span><a href="action.html">资料库</a></span>
                            - <span class="lv_tree_current"><a href="#">在线视频</a></span></p>
                    </div>
                    <div class="box">
                        <div class="videobox">
                            <%
							set rs=server.createobject("adodb.recordset")
							sql="select * from tb_video order by "&newspxmethod
							rs.open sql,conn,1,1
							titlechrnum=50
							rs.pagesize =12
							page=clng(request("page"))
							if page<=0 then page=1 
							if page > rs.pagecount then page=rs.pagecount
							if not rs.eof then rs.absolutepage=page
							for i=1 to 3
							if rs.eof then exit for
							%>
							<ul>
                                <%
								for j=1 to 2
								if rs.eof then exit for
								%>
                                <li>
                                    <div class="videoimg">
                                        <a href="videofram.asp?id=<%=rs("id")%>">
                                            <img src="../<%=rs("pic")%>" width="291" height="219" style="display: block;" /></a>
                                    </div>
                                    <div class="video_tit">
                                        <p><%=rs("filename")%></p>
                                    </div>
                                </li>
                                <%
								rs.movenext
								next
								%>
                            </ul>
                            <div style="clear:both;"></div>
							<%
							next
							%>
                            <div id="pgarticle" style=" padding-top:10px;">
                                
<p style="padding:15px 0">
<%
pageobj.pageskin=6
pageobj.img_path="../image/"
response.write pageobj.link(rs.recordcount,rs.pagesize,page,"?page=",qrystring)
%>
</p>

                            </div>
                            
                             <script type="text/javascript" src="../js/opendiv.js"></script>

							<script type="text/javascript">
							jquery(document).ready(function($) {
								$(".videobox ul a").click(function() {
									var thishref = $(this).attr("href");
									var thistitle = $(this).attr("title");
									var thtml = '<div id="opendivoverlay"><div id="opendivlightbox"><div class="alertmsn scralert"><div class="alertiframe"><div class="aclose">关闭</div><iframe src="'+thishref+'" frameborder="0" width="520" height="440" scrolling="no"></iframe></div></div></div></div>';
									openboxshow(thtml);
									$(".carsjia").show();
									return false;
								});
								
	
							});
                            </script>
                        </div>
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
