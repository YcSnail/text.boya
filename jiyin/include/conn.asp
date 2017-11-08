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
if request("action")="QuickViewSave" then
	IsParent=trim(request("IsParent"))
	txtEmail=trim(request("txtEmail"))
	txtName=trim(request("txtName"))
	txtTel=trim(request("txtTel"))
	txtPost=trim(request("txtPost"))
	txtChildBirth=trim(request("txtChildBirth"))
	select case trim(request("drpSelect"))
	case 1:drpSelect="医院"
	case 2:drpSelect="网络"
	case 3:drpSelect="朋友/亲戚"
	case 4:drpSelect="产科医生"
	case 5:drpSelect="客户推荐"
	case 6:drpSelect="其他人推荐"
	case 7:drpSelect="宣传册"
	case 8:drpSelect="产前课程"
	case 9:drpSelect="报刊杂志"
	case 10:drpSelect="电视"
	case 11:drpSelect="广播"
	case 12:drpSelect="其他"
	end select
	
	
	select case trim(request("drpHospital"))
	case 1:drpHospital="无锡市妇幼保健院"
	case 2:drpHospital="无锡市人民医院"
	case 3:drpHospital="无锡市第四人民医院"
	end select
	
	txtOther=trim(request("txtOther"))
	select case trim(request("rdoChoice"))
	case 1:rdoChoice="我想将我宝宝的脐带（血）存储于私体库，用于我的家人。"
	case 2:rdoChoice="我想将我宝宝的脐带（血）捐献给公体库。"
	case 3:rdoChoice="我不确定。"
	end select 
	txtRemark=trim(request("txtRemark"))
	
	set rs=server.CreateObject("adodb.recordset")
	rs.open "select * from tb_view",conn,1,3
	rs.addnew
	rs("IsParent")=IsParent
	rs("Email")=txtEmail
	rs("Name")=txtName
	rs("Tel")=txtTel
	rs("Post")=txtPost
	rs("ChildBirth")=txtChildBirth
	rs("howknow")=drpSelect
	rs("Hospital")=drpHospital
	rs("Choice")=rdoChoice
	rs("Remark")=txtRemark
	rs("AddTime")=now()
	rs.update
	rs.close
	set rs=nothing
	alert("提交成功")
	go("QuickDefault.html")
end if

sub information(Ititle,Ilt,Ione)'显示页面内容'
set rs=server.CreateObject("ADODB.RecordSet")   
sql="select * from Information where ID>0 "
if Ititle<>"" then sql=sql&"and Title='"&Ititle&"' "
if Ilt<>"" then sql=sql&"and ID="&clng(Ilt)&" "
if Ione<>"" then sql=sql&"and OneClassID="&clng(Ione)&" "
sql=sql&"order by px desc,ID desc"
rs.Open sql,Conn,1,3
rs("Hits")=rs("Hits")+1
rs.update

strContent=rs("Content")
ContentLen=len(strContent)
CurrentPage=trim(request("page"))
if Instr(strContent,"[NextPage]")<=0 then
	strTemp=strTemp&strContent
else
	arrContent=split(strContent,"[NextPage]")
	pages=Ubound(arrContent)+1
	if CurrentPage="" then
		CurrentPage=1
	else
		CurrentPage=Cint(CurrentPage)
	end if
	if CurrentPage<1 then CurrentPage=1
	if CurrentPage>pages then CurrentPage=pages
	strTemp=strTemp&arrContent(CurrentPage-1)
	strTemp=strTemp&"<p align='center'>"
	pageObj.pageskin=4
	strTemp=strTemp&pageObj.link(pages,1,CurrentPage,"?page=","&Ilt="&rs("ID")&"&Ione="&rs("OneClassID")&"&Ititle="&rs("Title")&"")
	strTemp=strTemp&"</p>"
end if

response.write strTemp
rs.close
set rs=nothing
end sub
%>