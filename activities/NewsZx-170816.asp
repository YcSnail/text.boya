<!--#include file="include/conn.asp"-->
<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<head>
<!--#include file="../inc_mobile.asp"-->
<title>行业资讯_博雅干细胞（boyalife）</title>
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
<meta name="keywords" content="博雅干细胞科技集团,间充质干细胞,癌症基因检测" />
<meta name="description" content="博雅干细胞科技集团等中外科学院士、医疗机构、科研院校、投资金融企业、生物科技企业负责人等嘉宾受邀出席精准医疗大会并作专题分享。" />
</head>
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
        
        <div class="lv_content"><div class="lv_banner1"><img src="images/banner1.jpg" width="960" height="200" /></div>
            
            <div class="lv_box">
                
                <div class="left_side">
                    <div class="left_side_tit"><img src="../images/else/left_tit01.jpg" style="display: block;" /></div>
                    
<ul>
   
    <li><a href="../stemcells/research3.html" onfocus="this.blur();">学术课堂</a></li>
  
    <li class="left_current"><a href="newszx.html" onfocus="this.blur();">行业资讯</a></li>
   
    <li><a href="video.html" onfocus="this.blur();">在线视频</a></li>
    <li><a href="zazhi.html" onfocus="this.blur();">母婴杂志</a></li>
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
                            <img src="../images/default/ico01.jpg" align="absmiddle" />&nbsp;&nbsp;行业资讯</div>
                        <p>
                            您现在的位置：<span><a href="../index.html">首页</a></span> - <span><a href="../stemcells/research3.html">资料库</a></span>
                            - <span class="lv_tree_current">行业资讯</span></p>
                    </div>
                    <div class="box">
                        <%
						if request("id")="" then
						  call newszx
						else
						  call shownewszx(request("id"))
						end if
						%>
                        
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
