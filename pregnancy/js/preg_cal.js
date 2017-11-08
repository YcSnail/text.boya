function set_value(divobj,valueObj,value){
	document.getElementById(valueObj).value=value;
	document.getElementById(divobj).style.display='none';
}
function showsetdiv(div){
	if(document.getElementById(div).style.display=='none')
		document.getElementById(div).style.display='';
	else
		document.getElementById(div).style.display='none';
}
 function Datejudgment()
{
	var health=document.getElementById("health");
	var nowdate=new Date();
	if (health.set_year.value=="" || health.set_month.value=="" || health.set_day.value ==""){
		alert_msg("请填写完整年月日!");
		return false;
	}
	if (health.set_year.value>2050 || health.set_year.value<1990){
		alert_msg("请填写正确年份!");
		health.set_year.focus();
		return false;
	}
	if (health.set_year.value > nowdate.getFullYear()){
		alert_msg("输入的的年份可能过大，请重新输入!");
		health.set_year.focus();
		return false;
	}
	if (health.set_year.value<nowdate.getFullYear()-1){
		alert_msg("输入的的年份可能过小，请重新输入!");
		health.set_year.focus();
		return false;
	}
	if (health.set_month.value>12 || health.set_month.value<1){
		alert_msg("请填写正确月份!");
		health.set_month.focus();
		return false;
	}
	if (health.set_day.value>31 || health.set_day.value<1){
		alert_msg("请填写正确日子!");
		health.set_day.focus();
		return false;
	}
	if (!isDate(health.set_year.value ,health.set_month.value ,health.set_day.value)){
		alert_msg("年月日组合有错,请重新填写!");
		return false;
	}
	var cycle = health.set_cycle.value;
	var true_number=280;
	var zise=new Date(health.set_year.value+"/"+health.set_month.value+"/"+health.set_day.value);
	if (cycle<28 && cycle>19){
		true_number=280-(28-cycle);
		var miaoshu=280*1000*3600*24-(28-cycle)*1000*3600*24;
	}
	else if (cycle>28 &&cycle<41){
		true_number=280+(cycle-28);
		var miaoshu=280*1000*3600*24+(cycle-28)*1000*3600*24;
	}
	else if (cycle==28){
		true_number=280;
		var miaoshu=280*1000*3600*24;
	}
	else{
		alert_msg("对不起，您输入的月经周期与实际不符，请重新输入！");	
		health.set_cycle.focus();
		return false;
	}
	if ((nowdate.getTime()-zise.getTime())>miaoshu){
		alert_msg("对不起，您输入的日期可能过早，请重新输入！");
		health.set_year.focus();
		return false;
	}
	if ((nowdate.getTime()-zise.getTime())<0){
		alert_msg("对不起，您输入的时间还没有到来，请重新输入！");
		health.set_year.focus();
		return false;
	}
	for (var i=0; i<=12; i++){
		if(health.set_year.value==nowdate.getFullYear() && health.set_month.value==nowdate.getMonth()+1 && health.set_day.value==nowdate.getDate()-i && health.set_cycle.value>28+i && health.set_cycle.value>20 && health.set_cycle.value<41){
			alert_msg("末次月经周期与日期组合有误，请重新输入！");
			health.set_cycle.focus();
			return false;
		}
	}
	function isDate (year, month, day)
	{
		// month argument must be in the range 1 - 12
		month = month - 1;  // javascript month range : 0- 11
		var tempDate = new Date(year,month,day);
		if ( (year2k(tempDate.getFullYear()) == year) && (month == tempDate.getMonth()) && (day == tempDate.getDate()) ){    
			return true;
		}
		else{
			return false;
		}
	}
	function year2k(d) 
	{ 
		return (d < 1000) ? d + 1900 : d;
	}
	var stime = new Date();
	stime.setFullYear(health.set_year.value, health.set_month.value-1, health.set_day.value);
	if (health.set_cycle.value!=''){
		var temptime=stime.getTime();
		stime.setTime((stime.getTime()+ true_number*24*3600*1000));
		yuchan = stime.getFullYear()+"/"+(stime.getMonth()+1)+"/"+stime.getDate();
		document.health.born_year.value=stime.getFullYear();
		document.health.born_month.value=stime.getMonth()+1;
		document.health.born_day.value=stime.getDate();
		var nowt = new Date();
		if(cycle==20) var hong=nowt.getTime()+(1000*60*60*24)*8;
		if(cycle==21) var hong=nowt.getTime()+(1000*60*60*24)*7;
		if(cycle==22) var hong=nowt.getTime()+(1000*60*60*24)*6;
		if(cycle==23) var hong=nowt.getTime()+(1000*60*60*24)*5;
		if(cycle==24) var hong=nowt.getTime()+(1000*60*60*24)*4;
		if(cycle==25) var hong=nowt.getTime()+(1000*60*60*24)*3;
		if(cycle==26) var hong=nowt.getTime()+(1000*60*60*24)*2;
		if(cycle==27) var hong=nowt.getTime()+(1000*60*60*24);
		if(cycle==28) var hong=nowt.getTime();
		if(cycle==29) var hong=nowt.getTime()-(1000*60*60*24);
		if(cycle==30) var hong=nowt.getTime()-(1000*60*60*24)*2;
		if(cycle==31) var hong=nowt.getTime()-(1000*60*60*24)*3;
		if(cycle==32) var hong=nowt.getTime()-(1000*60*60*24)*4;
		if(cycle==33) var hong=nowt.getTime()-(1000*60*60*24)*5;
		if(cycle==34) var hong=nowt.getTime()-(1000*60*60*24)*6;
		if(cycle==35) var hong=nowt.getTime()-(1000*60*60*24)*7;
		if(cycle==36) var hong=nowt.getTime()-(1000*60*60*24)*8;
		if(cycle==37) var hong=nowt.getTime()-(1000*60*60*24)*9;
		if(cycle==38) var hong=nowt.getTime()-(1000*60*60*24)*10;
		if(cycle==39) var hong=nowt.getTime()-(1000*60*60*24)*11;
		if(cycle==40) var hong=nowt.getTime()-(1000*60*60*24)*12;
		var chatime =hong-temptime;
		var chaweek = Math.floor((chatime)/(1000*60*60*24*7));
		var chaweek_1 = Math.floor((chatime)/(1000*60*60*24));
		document.getElementById("weeks").innerHTML = chaweek;
		var online=new Date(yuchan);
		var now=new Date();
		var leave=online.getTime()-now.getTime();
		var day=Math.floor(leave/(1000*60*60*24))+1;
		if(day.toString().length == 1) day="00"+day;
		if(day.toString().length == 2) day="0"+day;
		document.health.born_days.value=day+" 天";
	}
	document.getElementById("soucs").style.display='';
}
function alert_msg(str){
	alert(str);
}