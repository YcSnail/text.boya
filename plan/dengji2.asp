<!--#include file="include/conn.asp"-->
<%
surname=server.htmlencode(request("surname"))
chiname=server.htmlencode(request("chiname"))
idno=server.htmlencode(request("idno"))
dobdd=server.htmlencode(request("dobdd"))
dobmm=server.htmlencode(request("dobmm"))
dobyy=server.htmlencode(request("dobyy"))
occupation=server.htmlencode(request("occupation"))
resaddr=server.htmlencode(request("resaddr"))
corraddr=server.htmlencode(request("corraddr"))
phone=server.htmlencode(request("phone"))
officetel=server.htmlencode(request("officetel"))
faxno=server.htmlencode(request("faxno"))
mobile=server.htmlencode(request("mobile"))
childno=server.htmlencode(request("childno"))
birthmethod=server.htmlencode(request("birthmethod"))
fmyy=server.htmlencode(request("fmyy"))
lang=server.htmlencode(request("lang"))
email=server.htmlencode(request("email"))
duedd=server.htmlencode(request("duedd"))
duemm=server.htmlencode(request("duemm"))
dueyy=server.htmlencode(request("dueyy"))
msurname=server.htmlencode(request("msurname"))
mchiname=server.htmlencode(request("mchiname"))
midno=server.htmlencode(request("midno"))
mdobdd=server.htmlencode(request("mdobdd"))
mdobmm=server.htmlencode(request("mdobmm"))
mdobyy=server.htmlencode(request("mdobyy"))
moccupation=server.htmlencode(request("moccupation"))
mphone=server.htmlencode(request("mphone"))
mofficetel=server.htmlencode(request("mofficetel"))
mfaxno=server.htmlencode(request("mfaxno"))
memail=server.htmlencode(request("memail"))
docname=server.htmlencode(request("docname"))
docchiname=server.htmlencode(request("docchiname"))
mdocname=server.htmlencode(request("mdocname"))
mdocchiname=server.htmlencode(request("mdocchiname"))
docdelivery=server.htmlencode(request("docdelivery"))
mdocdelivery=server.htmlencode(request("mdocdelivery"))
	set rs = server.createobject("adodb.recordset")
	sql="select * from dengji"
	rs.open sql,conn,1,3
	rs.addnew
	rs("surname")=request.form("surname")
	rs("chiname")=request.form("chiname")
	rs("idno")=request.form("idno")
	rs("dobdd")=request.form("dobdd")
	rs("dobmm")=request.form("dobmm")
	rs("dobyy")=request.form("dobyy")
	rs("occupation")=request.form("occupation")
	rs("resaddr")=request.form("resaddr")
	rs("corraddr")=request.form("corraddr")
	rs("phone")=request.form("phone")
	rs("officetel")=request.form("officetel")
	rs("faxno")=request.form("faxno")
	rs("mobile")=request.form("mobile")
	rs("childno")=request.form("childno")
	rs("birthmethod")=request.form("birthmethod")
	rs("fmyy")=request.form("fmyy")
	rs("lang")=request.form("lang")
	rs("email")=request.form("email")
	rs("duedd")=request.form("duedd")
	rs("duemm")=request.form("duemm")
	rs("dueyy")=request.form("dueyy")
	rs("msurname")=request.form("msurname")
	rs("mchiname")=request.form("mchiname")
	rs("midno")=request.form("midno")
	rs("mdobdd")=request.form("mdobdd")	
	rs("mdobmm")=request.form("mdobmm")
	rs("mdobyy")=request.form("mdobyy")
	rs("moccupation")=request.form("moccupation")
	rs("mphone")=request.form("mphone")
	rs("mofficetel")=request.form("mofficetel")
	rs("mfaxno")=request.form("mfaxno")
	rs("memail")=request.form("memail")
	rs("docname")=request.form("docname")
	rs("docchiname")=request.form("docchiname")
	rs("mdocname")=request.form("mdocname")
	rs("mdocchiname")=request.form("mdocchiname")
	rs("docdelivery")=request.form("docdelivery")
	rs("adddate")=now()			
	rs.update
	rs.close
	set rs=nothing
%>
<!doctype html public "-//w3c//dtd xhtml 1.0 transitional//en" "http://www.w3.org/tr/xhtml1/dtd/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<head>
<!--#include file="../inc_mobile.asp"-->
<title>国际aabb（美国血库协会）-boyalife博雅干细胞科技有限公司</title>
<link href="../css/common.css" rel="stylesheet" type="text/css" />
<link href="../css/else.css" rel="stylesheet" type="text/css" />
<link rel=stylesheet type=text/css href="../css/all_zhcn.css" media=all>
    <script src="../js/jquery-1.4.min.js" type="text/javascript"></script>

    <script src="../js/nav.js" type="text/javascript"></script>
    


<script type=text/javascript 
src="../js/ie-hover-pack.js"></script>

<script type=text/javascript 
src="../js/jquery-1.3.2.min.js"></script>

<script type=text/javascript 
src="../js/jquery.main.js"></script>



<script type=text/javascript src="../js/chkform.js"></script>

</head>
<body>

    <div id="wrap">
           
           
          
                    <div class="box1">
<div id=page>
  <div id=content>
    <div class=right-column>
      <div class=right-column-content>
  <div class="right-column-content-l max">


<div id=page1 class=enrollmentform>
<!-- #################################### --><!-- personal details of expectant mother --><!-- #################################### -->
<table class=data>
  <tbody>
  <tr>
    <td class=header>
      <table>
        <tbody>
        <tr>
          <th>母亲个人资料</th></tr></tbody></table></td></tr><!--  full legal name  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=normal><label>姓名</label> 
            <table class=surname>
              <tbody>
              <tr>
                <th></th>
                <td><span style="display: none" id=surname_err 
                  class=notice>请输入姓名。</span><input id=surname 
                  class=txtfield name=surname value="<%=surname%>"></td>
                <th></th>
                <td></td></tr></tbody></table></td>
          <td class=xsmall><label>民族</label><input id=chiname 
            class=txtfield name=chiname value="<%=chiname%>"></td>
          <td class=small><label>身份证号码</label><span style="display: none" id=idno_err 
            class=notice>请输入身份证号码。</span> <input id=idno class=txtfield 
            name=idno value="<%=idno%>"></td></tr></tbody></table></td></tr>
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=normal><label>出生日期</label><span style="display: none" 
            id=dobdd_err class=notice>请输入出生日期。</span><span style="display: none" 
            id=dobmm_err class=notice>请输入出生日期。</span><span style="display: none" 
            id=dobyy_err class=notice>请输入出生日期。</span> 
            <table class=year>
              <tbody>
              <tr>
                <td><input id=dobdd class=txtfield name=dobdd value="<%=dobdd%>"></td>
                <th>dd日</th>
                <td><input id=dobmm class=txtfield name=dobmm value="<%=dobmm%>"></td>
                <th>mm月</th>
                <td><input id=dobyy class=txtfield name=dobyy value="<%=dobyy%>"></td>
                <th>yyyy年</th></tr></tbody></table></td>
          <td class=normal><label>职业</label><span style="display: none" 
            id=occupation_err class=notice>请输入职业。</span><input id=occupation 
            class=txtfield name=occupation value="<%=occupation%>"></td></tr></tbody></table></td></tr><!--  residential address  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=normal><label>住址</label><span style="display: none" 
            id=resaddr_err class=notice>请输入住址。</span><input id=resaddr 
            class=txtfield name=resaddr value="<%=resaddr%>"></td>
          <td class=normal><label>通讯地址 (若与左不同)</label><span 
            style="display: none" id=corraddr_err 
            class=notice>请输入通讯地址。</span><input id=corraddr class=txtfield 
            name=corraddr value="<%=corraddr%>"></td></tr></tbody></table></td></tr><!--  telephone number  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=small><label>住宅电话</label><span style="display: none" 
            id=phone_err class=notice>请输入住宅电话。</span><input id=phone 
            class=txtfield name=phone value="<%=phone%>"></td>
          <td class=small><label>移动电话</label><span style="display: none" 
            id=officetel_err class=notice>请输入移动电话。</span><input id=officetel 
            class=txtfield name=officetel value="<%=officetel%>"></td>
          <td class=small><label>qq号码</label><span style="display: none" 
            id=faxno_err class=notice>请输入qq号码。</span><input id=faxno 
            class=txtfield name=faxno value="<%=faxno%>"></td></tr></tbody></table></td></tr><!--  number of child  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=small><label>紧急联络人</label><span style="display: none" 
            id=mobile_err class=notice>请输入紧急联络人。</span><input id=mobile 
            class=txtfield name=mobile value="<%=mobile%>"></td>
          <td class=small><label>紧急联络人号码</label><span 
            style="display: none" id=childno_err 
            class=notice>请输入紧急联络人号码。</span><input id=childno class=txtfield 
            name=childno value="<%=childno%>"></td>
          <td class=small><label>孩子数目(包括此新生儿)</label><span 
            style="display: none" id=birthmethod_err class=notice>请输入孩子数目(包括此新生儿)。</span><input id=birthmethod class=txtfield 
            name=birthmethod value="<%=birthmethod%>"> 
</td></tr></tbody></table></td></tr>

<!--  nationality  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=small><label>分娩医院</label><span style="display: none" 
            id=fmyy_err class=notice>请输入分娩医院。</span><input id=fmyy 
            class=txtfield name=fmyy value="<%=fmyy%>"></td>
          <td class=large><label>分娩方式</label><span style="display: none" 
            id=lang_other_err class=notice>请选择分娩方式。</span> 
            <table class=caesarean>
              <tbody>
              <tr>
                <td><input id=lang  type=radio 
                  name=lang <%if ""&lang&""="自然分娩" then%>checked="checked"<%end if%>>自然分娩</td>
                <td><input id=lang_0  type=radio 
                  name=lang <%if ""&lang&""="剖腹手术" then%>checked="checked"<%end if%>>剖腹手术</td></tr></tbody></table></td></tr></tbody></table></td></tr><!--  date of birth  -->
<!--  email address  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=normal><label>电子邮件地址</label><span style="display: none" 
            id=email_err class=notice>请输入电子邮件地址。</span><input id=email 
            class=txtfield name=email value="<%=email%>"></td>
          <td class=normal><label>预产期</label><span style="display: none" 
            id=duedd_err class=notice>请输入预产期。</span><span style="display: none" 
            id=duemm_err class=notice>请输入预产期。</span><span style="display: none" 
            id=dueyy_err class=notice>请输入预产期。</span> 
            <table class=year>
              <tbody>
              <tr>
                <td><input id=duedd class=txtfield name=duedd value="<%=duedd%>"></td>
                <th>dd日</th>
                <td><input id=duemm class=txtfield name=duemm value="<%=duemm%>"></td>
                <th>mm月</th>
                <td><input id=dueyy class=txtfield name=dueyy value="<%=dueyy%>"></td>
                <th>yyyy年</th></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table><!-- #################################### --><!-- personal details of expectant father --><!-- #################################### -->
<table class=data>
  <tbody>
  <tr>
    <td class=header>
      <table>
        <tbody>
        <tr>
          <th>父亲个人资料</th></tr></tbody></table></td></tr><!--  full legal name  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=normal><label>姓名</label> 
            <table class=surname>
              <tbody>
              <tr>
                <th></th>
                <td><span style="display: none" id=msurname_err 
                  class=notice>请输入姓名。</span><input id=msurname 
                  class=txtfield name=msurname value="<%=msurname%>"></td>
                <th></th>
                <td></td></tr></tbody></table></td>
          <td class=xsmall><label>民族</label><span style="display: none" 
            id=mchiname_err class=notice>请输入民族。</span><input id=mchiname 
            class=txtfield name=mchiname value="<%=mchiname%>"></td>
          <td class=small><label>身份证号码</label><span style="display: none" id=midno_err 
            class=notice>请输入身份证号码。</span> <input id=midno class=txtfield 
            name=midno value="<%=midno%>"></td></tr></tbody></table></td></tr><!--  nationality  -->
  <tr style="display:none">
    <td>
      <table>
        <tbody>
        <tr>
          <td class=small><label>国籍</label><span style="display: none" 
            id=mnation_err class=notice>请输入国籍。</span><input id=mnation 
            class=txtfield name=mnation ></td>
          <td class=large><label>语言</label><span style="display: none" 
            id=mlang_err class=notice>请选择语言。</span><span style="display: none" 
            id=mlang_other_err class=notice>请输入语言。</span> 
            <table class=language>
              <tbody>
              <tr>
                <td><input id=mlang value=0 type=radio name=mlang>广东话</td>
                <td><input id=mlang_0 value=_0 type=radio name=mlang>普通话</td>
                <td><input id=mlang_1 value=_1 type=radio name=mlang>英文</td>
                <td><input id=mlang_2 value=_2 type=radio name=mlang>其他</td>
                <td><input id=mlang_other class=txtfield 
              name=mlang_other></td></tr></tbody></table></td></tr></tbody></table></td></tr><!--  date of birth  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=normal><label>出生日期</label><span style="display: none" 
            id=mdobdd_err class=notice>请输入出生日期。</span><span 
            style="display: none" id=mdobmm_err 
            class=notice>请输入出生日期。</span><span style="display: none" 
            id=mdobyy_err class=notice>请输入出生日期。</span> 
            <table class=year>
              <tbody>
              <tr>
                <td><input id=mdobdd class=txtfield name=mdobdd value="<%=mdobdd%>"></td>
                <th>dd日</th>
                <td><input id=mdobmm class=txtfield name=mdobmm value="<%=mdobmm%>"></td>
                <th>mm月</th>
                <td><input id=mdobyy class=txtfield name=mdobyy value="<%=mdobyy%>"></td>
                <th>yyyy年</th></tr></tbody></table></td>
          <td class=normal><label>职业</label><span style="display: none" 
            id=moccupation_err class=notice>请输入职业。</span><input id=moccupation 
            class=txtfield name=moccupation value="<%=moccupation%>"></td></tr></tbody></table></td></tr><!--  telephone number  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=small><label>住宅电话</label><span style="display: none" 
            id=mphone_err class=notice>请输入住宅电话。</span><input id=mphone 
            class=txtfield name=mphone value="<%=mphone%>"></td>
          <td class=small><label>移动电话</label><span style="display: none" 
            id=mofficetel_err class=notice>请输入移动电话。</span><input id=mofficetel 
            class=txtfield name=mofficetel value="<%=mofficetel%>"></td>
          <td class=small><label>qq号码</label><span style="display: none" 
            id=mfaxno_err class=notice>请输入qq号码。</span><input id=mfaxno 
            class=txtfield name=mfaxno value="<%=mfaxno%>"></td></tr></tbody></table></td></tr><!--  email address  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
         
          <td class=normal><label>电子邮件地址</label><span style="display: none" 
            id=memail_err class=notice>请输入电子邮件地址。</span><input id=memail 
            class=txtfield name=memail value="<%=memail%>"></td></tr></tbody></table></td></tr></tbody></table><!-- #################################### --><!-- details of doctor --><!-- #################################### -->
<table class=data>
  <tbody>
  <tr>
    <td class=header>
      <table>
        <tbody>
        <tr>
          <th>签约信息</th></tr></tbody></table></td></tr><!--  name of doctor  -->
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=normal><label>负责代表</label><span 
            style="display: none" id=docname_err class=notice>请输入负责代表。</span><input id=docname class=txtfield name=docname value="<%=docname%>"></td>
          <td class=normal><label>联系电话</label><span style="display: none" 
            id=docchiname_err class=notice>请输入联系电话。</span><input id=docchiname 
            class=txtfield name=docchiname  value="<%=docchiname%>"></td></tr></tbody></table></td></tr><!--  delivery or collection of cord blood  -->
   <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=normal><label>签约代表</label><span 
            style="display: none" id=mdocname_err class=notice>请输入签约代表。</span><input id=mdocname class=txtfield name=mdocname  value="<%=mdocname%>"></td>
          <td class=normal><label>联系电话</label><span style="display: none" 
            id=mdocchiname_err class=notice>请输入联系电话。</span><input id=mdocchiname 
            class=txtfield name=mdocchiname  value="<%=mdocchiname%>"></td></tr></tbody></table></td></tr>           
  <tr>
    <td>
      <table>
        <tbody>
        <tr>
          <td class=full>
            <table class=doctor>
              <tbody>
              <tr>
                <td><label>签约地区</label><span 
            style="display: none" id=docdelivery_err class=notice>请选择签约地区。</span><input id=docdelivery value="" type=checkbox name=docdelivery  <%if ""&docdelivery&""="江苏区域" then%>checked="checked"<%end if%>>江苏区域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=docdelivery value="" type=checkbox name=docdelivery  <%if ""&docdelivery&""="浙江区域" then%>checked="checked"<%end if%>>浙江区域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=docdelivery value="" type=checkbox name=docdelivery  <%if ""&docdelivery&""="上海区域" then%>checked="checked"<%end if%>>上海区域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=docdelivery value="" type=checkbox name=docdelivery  <%if ""&docdelivery&""="北京区域" then%>checked="checked"<%end if%>>北京区域<br><br><input id=docdelivery value="" type=checkbox name=docdelivery  <%if ""&docdelivery&""="湖北区域" then%>checked="checked"<%end if%>>湖北区域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=docdelivery value="" type=checkbox name=docdelivery  <%if ""&docdelivery&""="安徽区域" then%>checked="checked"<%end if%>>安徽区域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=docdelivery value="" type=checkbox name=docdelivery  <%if ""&docdelivery&""="重庆区域" then%>checked="checked"<%end if%>>重庆区域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=docdelivery value="" type=checkbox name=docdelivery  <%if ""&docdelivery&""="广西区域" then%>checked="checked"<%end if%>>广西区域<br><br><input id=docdelivery value="" type=checkbox name=docdelivery  <%if ""&docdelivery&""="河北区域" then%>checked="checked"<%end if%>>河北区域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=docdelivery value="其他区域" type=checkbox name=docdelivery <%if ""&docdelivery&""="其他区域" then%>checked="checked"<%end if%>>其他区域<input id=mdocdelivery 
            class=txtfield name=mdocdelivery  <%if ""&docdelivery&""="其他区域" then%>value="<%=mdocdelivery%>"<%end if%>></td></tr></tbody></table></td></tr></tbody></table></td></tr></tbody></table><!-- #################################### --><!-- details of hospital --><!-- #################################### --></div><!-- #################################### --><!-- medical health history --><!-- #################################### -->
<!--<a 
name=remark></a>
<p># 此部份须由准父亲填写</p>
<p>本医疗健康病历的原文是以英文书写，并可能译成不同的语言译本，如译本与原文有任何差异，以英文原文为准。</p>
<div class=button><input value=重设 type=reset name=resetform><input onclick="if (checkform2(this.form)) submitform();" value=递交 type=button name=doform type_="submit"></div></div></form>
<div style="display: none" id=processing class=enrollmentform>
<p>正在处理您的表格，请稍後。</p></div>
<div style="display: none" id=successful class=enrollmentform>
<p>已经成功地处理您的登记表格，请列印或存储您的表格，然後签署。</p>
<form method=get name=dummy action=#><input onclick="$('#eform').each(function() {this.submit()}); return false;" value="列印 / 存储" type=button name=print> -->
</div>

               
                    
</div></div></div></div></div></div>
                </div>
       
   


<!-- boyalife.com baidu tongji analytics -->
<script type="text/javascript">
var _bdhmprotocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3cscript src='" + _bdhmprotocol + "hm.baidu.com/h.js%3f73b8ef2157e56c7b6d0ef7c2598feff0' type='text/javascript'%3e%3c/script%3e"));
</script>
</body>
</html>
