<!--#include file="include/conn.asp"-->
<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<head>
<!--#include file="../inc_mobile.asp"-->
<title>国际aabb（美国血库协会）-boyalife博雅干细胞科技有限公司</title>
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
        
        <div class="lv_content">   <div class="lv_banner1"><img src="images/banner.jpg" width="960" height="200" /></div>
            
            <div class="lv_box">
                
                <div class="left_side">
                    <div class="left_side_tit">
                        <img src="../images/else/left_tit09.jpg" style="display: block;" />
                    </div>
                    
<ul>
    <li><a href="index.html" onfocus="this.blur();">安全期计算器</a></li>
    <li class="left_current"><a href="preg_cal.html" onfocus="this.blur();">孕期计算器</a></li>
    <li><a href="assistant.html" onfocus="this.blur();">体检助理</a></li>
    <li><a href="magazine.html" onfocus="this.blur();">你好宝贝</a></li>
    <li><a href="knowledge.html" onfocus="this.blur();">孕育宝典</a></li>
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
                            <img src="../images/default/ico01.jpg" align="absmiddle" />&nbsp;&nbsp;孕期计算器</div>
                        <p>
                            您现在的位置：<span><a href="../index.html">首页</a></span> - <span><a href="index.html">孕育家园</a></span>
                            - <span class="lv_tree_current"><a href="#">孕期计算器</a></span></p>
                    </div>
                    <div class="box">
 
 
                       
 <script language="javascript" src="js/preg_cal.js"></script> 
<link href="css/preg_cal.css" rel="stylesheet" type="text/css" />
 <div class="mainpanelcss">  
    <div class="mainpanelcss_content">                   
    <form id="health" name="health" method="get">
                <div class="dateset">
                    
                    
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="55">末次月经</td>
                        <td width="95">
                        <div style="position:relative; float:left">
                        <input name="set_year" class="set_year" id="set_year" maxlength="4" value="<%=year(now)%>" />
                        <div id="set_year_div" style="width:86px;position:absolute; left:0; top:28px; background:#fff; border-left:1px solid #f17410; border-bottom:1px solid #f17410; border-right:1px solid #f17410; font-size:14px; font-weight:bold; padding:5px 0px; display:none">
                        <a href="javascript:set_value('set_year_div','set_year','<%=year(now)%>');" style="display:block">&nbsp;<%=year(now)%></a>
                        <a href="javascript:set_value('set_year_div','set_year','<%=year(now)-1%>');"  style="display:block">&nbsp;<%=year(now)-1%></a>
                        </div>
                        </div>
                        </td>
                        <td>年</td>
                        <td width="55">
                        
                        <div style="position:relative; float:left">
                        <input name="set_month" class="set_month" id="set_month" maxlength="2" value="<%=month(now)%>"/>
                        <div id="set_month_div" style="width:146px;position:absolute; left:-38px; top:38px; background:#fff; border-left:1px solid #f17410; border-bottom:1px solid #f17410; border-right:1px solid #f17410; font-size:14px; font-weight:bold; padding:5px 0px; display:none">
                         <table>
						 <tr>
						 <%for i=1 to 12%>
						 <td>
                        <a href="javascript:set_value('set_month_div','set_month','<%=i%>');" style="display:block">&nbsp;<%=i%></a>
                        </td>
						  <%next%>                   
						</tr>
						</table>
                        </div>
                        </div>
                        </td>
                        <td>月</td>
                        <td width="55"> 
                        <div style="position:relative; float:left">
                        <input name="set_day" class="set_day" id="set_day" maxlength="2" value="<%=day(now)%>"  />
                        <div id="set_day_div" style="width:470px;position:absolute; left:-200px; top:38px; background:#fff; border-left:1px solid #f17410; border-bottom:1px solid #f17410; border-right:1px solid #f17410; font-size:14px; font-weight:bold; padding:5px 0px; display:none">
                        <table>
						<tr>
						<%for i=1 to 31%>
						<td>
                        <a href="javascript:set_value('set_day_div','set_day','<%=i%>');" style="display:block">&nbsp;<%=i%></a>
						</td>
						  <%next%>                   
						</tr>
						
						</table>
                        </div>
                        </div>
                        </td>
                        <td width="55">日，周期</td>
                        <td>
                        <div style="position:relative; float:left">
                        <input name="set_cycle" class="set_cycle" id="set_cycle" maxlength="2" value="28" />
                        <div id="set_cycle_div" style="width:46px;position:absolute; left:0; top:28px; background:#fff; border-left:1px solid #f17410; border-bottom:1px solid #f17410; border-right:1px solid #f17410; font-size:14px; font-weight:bold; padding:5px 0px; display:none">
                        <%for i=20 to 40%>
                        <a href="javascript:set_value('set_cycle_div','set_cycle','<%=i%>');" style="display:block">&nbsp;<%=i%></a>
                        <%next%>
                        </div>
                        </div>
                        </td>
                      </tr>
                    </table>

                  <p align="center" style="padding-top:20px"> <img src="images/jisuan.gif" style="cursor:pointer" onclick="return datejudgment()" align="absmiddle" alt="点击开始计算">
                   <div id="soucs">
                    您现在是孕<span id="weeks"></span>周</p>
                    <br>
                    您的宝宝预计于
                    <input name="born_year" class="born_year" id="born_year" value="" readonly/> 年
                    <input name="born_month" class="born_month" id="born_month" value="" readonly /> 月
                    <input name="born_day" class="born_day" id="born_day" value="" readonly/> 日出生，  还有
                    <input name="born_days" class="born_days" id="born_days" value="" readonly style="border:0;font-size:36px; color:#ffffff; line-height:80px;"/>
                    </div>
                </div>
    </form>   
    </div>
    <div class="bottom_txt">注：此计算结果仅供参考</div>                     
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
