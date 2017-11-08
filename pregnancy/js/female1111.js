String.prototype.toNumber = function(){
	return Number(this.replace(/px/gi,""));
}
var helper = {
	$ : function(tagId){return document.getElementById(tagId);},
	$c : function(tagName){return document.createElement(tagName);},
	bind : function(eventObj,eventType,eventMethod){
		if(window.attachEvent){
			eventObj.attachEvent("on" + eventType,eventMethod);
		}else{
			eventObj.addEventListener(eventType,eventMethod,false);
		}
	},
	position : function(parentObj){
		var parentTop = parentObj.offsetTop;
		var parentLeft = parentObj.offsetLeft;
		while(parentObj = parentObj.offsetParent){
			parentTop += parentObj.offsetTop;
			parentLeft += parentObj.offsetLeft;
		}
		return {
			top : parentTop,
			left : parentLeft
		}
	},
	browser : function(){
		var navor = {};
		var agent = navigator.userAgent.toLowerCase();
		try{
			window.ActiveXObject ? navor.ie = agent.match(/msie ([\d.]+)/)[1] :
			document.getBoxObjectFor ? navor.firefox = agent.match(/firefox\/([\d.]+)/)[1] :
			window.MessageEvent && !document.getBoxObjectFor ? navor.chrome = agent.match(/chrome\/([\d.]+)/)[1] :
			window.opera ? navor.opera = agent.match(/opera.([\d.]+)/)[1] :
			window.openDatabase ? navor.safari = agent.match(/version\/([\d.]+)/)[1] : 0;
		}catch(e){}
		return navor;
	}
}
var calendar = {
	args : {
		year : 0,
		month : 0,
		day : 0,
		dayArray : [31,28,31,30,31,30,31,31,30,31,30,31],
		target : null,
		clickDay : null
	},
	initYear : function(year){
		var leftYear = helper.$("leftYear");
		var yearLayer = helper.$c("DIV");
		yearLayer.id = "yearLayer";
		yearLayer.className = "yearLayerCss";
		var yearList = helper.$c("UL");
		var yearItems = [helper.$c("LI"),helper.$c("LI"),helper.$c("LI")];
		yearItems[0].innerHTML = year - 1 + "年";
		yearItems[1].innerHTML = year + "年";
		yearItems[2].innerHTML = year + 1 + "年";
		for(var i=0;i<3;i++){
			helper.bind(yearItems[i],"mouseover",function(evt){
				var evnt = evt || window.event;
				var target = evnt.srcElement || evnt.target;
				target.style.backgroundColor = "#eaeaea";
				helper.bind(target,"mouseout",function(evt0){
					var evnt0 = evt0 || window.event;
					var target0 = evnt0.srcElement || evnt0.target;
					target0.style.backgroundColor = "#FFF";
				});
			});
			helper.bind(yearItems[i],"click",function(evt){
				var evnt = evt || window.event;
				var target = evnt.srcElement || evnt.target;
				target.style.backgroundColor = "#EEE";
				calendar.show(parseInt(target.innerHTML.replace(/年/,"")),parseInt(helper.$("leftMonth").innerHTML)-1);
				helper.$("leftYear").innerHTML = target.innerHTML.replace(/年/,"");
				if(parseInt(helper.$("leftMonth").innerHTML) >= 12){
					helper.$("rightYear").innerHTML = parseInt(target.innerHTML.replace(/年/,""))+ 1;
				}else{
					helper.$("rightYear").innerHTML = target.innerHTML.replace(/年/,"");
				}
				calendar.clear();
			});
		}
		yearList.appendChild(yearItems[0]);
		yearList.appendChild(yearItems[1]);
		yearList.appendChild(yearItems[2]);
		yearLayer.appendChild(yearList);
		document.body.appendChild(yearLayer);
		helper.bind(helper.$("yearLink"),"mouseover",function(){
			//document.getElementById("nowElement").value = "yearLink";
			try{
				document.body.removeChild(helper.$("monthLayer"));
			}catch(e){}
			calendar.showLayer(helper.$("yearLayer"),helper.$("yearLink"));
			calendar.args.target = helper.$("yearLink");
		});
/*		helper.bind(helper.$("rYearLink"),"mouseover",function(){
			//document.getElementById("nowElement").value = "rYearLink";
			try{
				document.body.removeChild(helper.$("monthLayer"));
			}catch(e){}
			calendar.showLayer(helper.$("yearLayer"),helper.$("rYearLink"));
			calendar.args.target = helper.$("rYearLink");
		});*/
		helper.bind(document,"click",function(evt){
			var evnt = evt || window.event;
			var target = evnt.srcElement || evnt.target;
			if(target.tagName.toLowerCase() != "a"){
				helper.$("yearLayer").style.display = "none";
				try{
					document.body.removeChild(helper.$("monthLayer"));
				}catch(e){}
			}
		});
	},
	initMonth : function(month){
		var year = new Date().getFullYear();
		var selYear = helper.$("leftYear").innerHTML;
		var maxMonthCount = 12;

		var monthLayer = helper.$c("DIV");
		monthLayer.id = "monthLayer";
		monthLayer.className = "monthLayerCss";
		var monthList = helper.$c("UL");
		for(var i=0;i<maxMonthCount;i++){
			var monthItem = helper.$c("LI");
			monthItem.innerHTML = i+1 + "月";
			helper.bind(monthItem,"mouseover",function(evt){
				var evnt = evt || window.event;
				var target = evnt.srcElement || evnt.target;
				target.style.backgroundColor = "#eaeaea";
				helper.bind(target,"mouseout",function(evt0){
					var evnt0 = evt0 || window.event;
					var target0 = evnt0.srcElement || evnt0.target;
					target0.style.backgroundColor = "#FFF";
				});
			});
			helper.bind(monthItem,"click",function(evt){
				var evnt = evt || window.event;
				var target = evnt.srcElement || evnt.target;
				target.style.backgroundColor = "#EEE";
				calendar.show(parseInt(helper.$("leftYear").innerHTML),parseInt(target.innerHTML)-1);
				var selMonth = parseInt(target.innerHTML.replace(/月/,""));
				var nowElement = document.getElementById("nowElement").value;
				if(nowElement.toLowerCase() == "rmonthlink"){
					helper.$("rightMonth").innerHTML = selMonth;
					if((selMonth - 1) - 1 < 0){
						helper.$("leftYear").innerHTML = parseInt(helper.$("rightYear").innerHTML) - 1;
						helper.$("leftMonth").innerHTML = 12;
					}else{
						helper.$("leftMonth").innerHTML = selMonth - 1;
					}
				}else{
					if((selMonth - 1) + 1 > 11){
						helper.$("rightYear").innerHTML = parseInt(helper.$("leftYear").innerHTML) + 1;
						helper.$("rightMonth").innerHTML = 1;
					}else{
						helper.$("rightMonth").innerHTML = selMonth + 1;
					}
				}
				calendar.clear();
			});
			monthList.appendChild(monthItem);
		}
		monthLayer.appendChild(monthList);
		document.body.appendChild(monthLayer);
	},
	init : function(year,month){
		calendar.initYear(year);
		helper.bind(helper.$("monthLink"),"mouseover",function(){
			document.getElementById("nowElement").value = "monthLink";
			helper.$("yearLayer").style.display = "none";
			calendar.initMonth();
			calendar.showLayer(helper.$("monthLayer"),helper.$("monthLink"));
			calendar.args.target = helper.$("monthLink");
		});
	},
	showLayer : function(layer,target){
		target = target || calendar.args.target;
		layer.style.display = "block";
		var pos = helper.position(target);
		layer.style.left = pos.left - layer.clientWidth + 19 + "px";
		layer.style.top = pos.top + 20 + "px";
	},
	show : function(year,month,day){
		calendar.args.dayArray[1] = (calendar.isLeapYear(year) ? 29 : 28);
		var firstDayOfLeftMonth = new Date(year,month,1).getDay();
		var maxDayOfLeftMonth = calendar.args.dayArray[month];
		helper.$("leftYear").innerHTML = year;
		helper.$("leftMonth").innerHTML = month + 1;
		
		var nextMonth = ((month + 1 > 11) ? 0 : (month + 1));
		var nextYear = ((month + 1 > 11) ? year+1 : year );
		calendar.args.dayArray[1] = (calendar.isLeapYear(nextYear) ? 29 : 28);
		var firstDayOfRightMonth = new Date(nextYear,nextMonth,1).getDay();
		var maxDayOfRightMonth = calendar.args.dayArray[nextMonth];
		
		helper.$("rightYear").innerHTML = nextYear;
		helper.$("rightMonth").innerHTML = nextMonth + 1;
		
		calendar.fill(helper.$("leftTable"),firstDayOfLeftMonth,maxDayOfLeftMonth);
		calendar.fill(helper.$("rightTable"),firstDayOfRightMonth,maxDayOfRightMonth);
	},
	fill : function(calendarTable,dayCount,maxDay){
		var now = new Date().getTime();
		var minDay = 1;
		for(var i=1;i<7;i++){
			for(var j=0;j<7;j++){
				if(dayCount > 0 || minDay > maxDay){
					calendarTable.rows[i].cells[j].innerHTML = "&nbsp;";
					dayCount--;
				}else{
					calendarTable.rows[i].cells[j].innerHTML = minDay;
					calendarTable.rows[i].cells[j].table = calendarTable.id;
					calendarTable.rows[i].cells[j].onclick = function(){
						var ret = female.check(this);
						if(ret){
							calendar.args.clickDay = this;
							female.args.day = parseInt(this.innerHTML);
							document.getElementById("popCss").style.display = "none";
							document.getElementById("yearDiv").style.display = "none";
							document.getElementById("monthDiv").style.display = "none";
							document.getElementById("resetDiv").style.visibility = "visible";
							document.getElementById("leftContainerDiv").style.marginLeft = "35%";
							female.calculate();
							female.clearClick(document.getElementById("leftTable"));
							female.clearClick(document.getElementById("rightTable"));
							this.style.color = "#000000";
							this.style.fontWeight = "bold";
							this.style.background = "url(images/now.gif) no-repeat center center";
							calendar.trans();
						}
					}
					minDay++;
				}
			}
		}
	},
	trans : function(){
		var leftCal = helper.$("leftCal");
		var rightCal = helper.$("rightCal");
		if(leftCal.style.marginLeft.toNumber() >= 130 || leftCal.style.marginLeft == ""){
			leftCal.style.marginLeft = "130px";
			rightCal.style.marginLeft = "10px";
			var itv = setInterval(function(){
				if(leftCal.style.marginLeft.toNumber() <= 15){
					clearInterval(itv);
					leftCal.style.marginLeft = "15px";
					rightCal.style.display = "block";
					var itv2 = setInterval(function(){
						if(rightCal.style.marginLeft.toNumber() >= 270){
							clearInterval(itv2);
							rightCal.style.marginLeft = "270px";
						}else{
							rightCal.style.marginLeft = rightCal.style.marginLeft.toNumber() + 10 + "px";
						}
					},10);
				}else{
					leftCal.style.marginLeft = leftCal.style.marginLeft.toNumber() - 8 + "px";
				}
			},10);
		}
	},
	backTrans : function(){
		var leftCal = helper.$("leftCal");
		var rightCal = helper.$("rightCal");
		rightCal.style.display = "none";
		if(leftCal.style.marginLeft == ""){return false;}
		if(leftCal.style.marginLeft.toNumber() <= 15){
			leftCal.style.marginLeft = "15px";
			var itv = setInterval(function(){
				if(leftCal.style.marginLeft.toNumber() >= 130){
					clearInterval(itv);
					leftCal.style.marginLeft = "130px";
				}else{
					leftCal.style.marginLeft = leftCal.style.marginLeft.toNumber() + 8 + "px";
				}
			},10);
		}
		helper.$("popCss").style.display = "block";
		calendar.args.clickDay = null;
	},
	clear : function(flag){
		var leftTable = helper.$("leftTable");
		var rightTable = helper.$("rightTable");
		for(var i=1;i<7;i++){
			for(var j=0;j<7;j++){
				leftTable.rows[i].cells[j].style.background = rightTable.rows[i].cells[j].style.background = "#FFF";
				leftTable.rows[i].cells[j].style.backgroundImage = rightTable.rows[i].cells[j].style.backgroundImage = "none";
				leftTable.rows[i].cells[j].style.color = rightTable.rows[i].cells[j].style.color = "#333";
				leftTable.rows[i].cells[j].style.fontWeight = rightTable.rows[i].cells[j].style.fontWeight = "normal";
				leftTable.rows[i].cells[j].style.cursor = rightTable.rows[i].cells[j].style.cursor = "default";
				if(!flag){leftTable.rows[i].cells[j].style.cursor = rightTable.rows[i].cells[j].style.cursor = "pointer";}
				leftTable.rows[i].cells[j].onmouseover = rightTable.rows[i].cells[j].onmouseover = function(){return false;}
			}
		}
	},
	isLeapYear : function(year){
		if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
			return true;
		}
		return false;
	}
}
var female = {
	args : {
		day : 0
	},
	clearClick : function(table){
		for(var i=1;i<7;i++){
			for(var j=0;j<7;j++){
				var calDayItem = table.rows[i].cells[j];
				calDayItem.clickFoo = calDayItem.onclick;
				calDayItem.onclick = function(){return false;}
			}
		}
	},
	setClick : function(table){
		for(var i=1;i<7;i++){
			for(var j=0;j<7;j++){
				var calDayItem = table.rows[i].cells[j];
				calDayItem.style.cursor = "pointer";
				if(calDayItem.clickFoo){
					calDayItem.onclick = calDayItem.clickFoo;
				}
			}
		}
	},
	resetThis : function(){
		document.getElementById("yearDiv").style.display = "block";
		document.getElementById("monthDiv").style.display = "block";
		document.getElementById("leftContainerDiv").style.margin = "0 auto";
		document.getElementById("leftContainerDiv").style.marginTop = "8px";
		document.getElementById("resetDiv").style.visibility = "hidden";
		female.setClick(document.getElementById("leftTable"));
		calendar.clear(false);
		calendar.backTrans();
		document.getElementById("minMensesPriod").value = 28;
		document.getElementById("titlePanel").style.display = "none";
		document.getElementById("popPanel").style.display = "none";
	},
	showPop : function(){
		var panel = document.getElementById("popPanel");
		panel.innerHTML = "正常月经周期为28~30<br>天。您的月经周期与标<br>准周期相差较大，请注<br>意调理。";
		var priod = document.getElementById("minMensesPriod");
		var xy = helper.position(priod);
		panel.style.left = xy.left - 50 + "px";
		panel.style.top = xy.top + priod.clientHeight + 2 + "px";
		panel.style.display = "block";
	},
	showIntro : function(obj,html,color,bgColor,type){
		var intro = document.getElementById("titlePanel");
		if(obj){
			var nav = helper.browser();
			var img = "green";
			switch(type){
				case 1:
					img = "mess";
				break;
				case 2:
					img = "red";
				break;
			}
			intro.style.color = color;
			if(obj.cell > 3){
				intro.style.background = "url(images/"+img+"-r.png) no-repeat 0 0";
					try{
						if(nav.ie.toString() == "6.0"){
							intro.style.background = "none";
							intro.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src=\"images/"+img+"-r.png\" ,sizingMethod=\"crop\");";
						}
					}catch(e){}
			}else{
				intro.style.background = "url(images/"+img+".png) no-repeat 0 0";
					try{
						if(nav.ie.toString() == "6.0"){
							intro.style.background = "none";
							intro.style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(src=\"images/"+img+".png\" ,sizingMethod=\"crop\");";
						}
					}catch(e){}
			}
			intro.innerHTML = html;
			//intro.style.color = "#666";
			//intro.style.background = bgColor;
			//intro.style.border = "1px solid " + color;
			var xy = helper.position(obj);
			intro.style.left = xy.left + "px";
			intro.style.top = xy.top + obj.clientHeight + 2 + "px";
			if(obj.cell > 3){
				intro.style.left = xy.left - 105 + "px";
			}
			intro.style.display = "block";
		}else{
			intro.style.display = "none";
		}
	},
	check : function(){
			var minMensesPriod = helper.$("minMensesPriod").value;
			// check priod
			if(isNaN(minMensesPriod) || (Number(minMensesPriod) > 40 || Number(minMensesPriod) < 20)){
				//alert("请输入数字并介于24与40之间");
				female.showPop();
				return false;
			}else{document.getElementById("popPanel").style.display = "none";}
			return true;
	},
	calculate : function(){
		calendar.clear();
		var minMensesPriod = helper.$("minMensesPriod").value;
		// check priod
//		if(isNaN(minMensesPriod) || (Number(minMensesPriod) > 40 || Number(minMensesPriod) < 24)){
//			alert("请输入数字并介于24与40之间");
//			return false;
//		}
		// check priod end
		var year = Number(helper.$("leftYear").innerHTML);
		var month = Number(helper.$("leftMonth").innerHTML);
		var day = female.args.day;
		var lastTime = new Date(Date.UTC(year,month-1,day)).getTime();
		female.show(helper.$("leftTable"),year,month,lastTime);
		var rightYear = Number(helper.$("rightYear").innerHTML);
		var rightMonth = Number(helper.$("rightMonth").innerHTML);
		female.show(helper.$("rightTable"),rightYear,rightMonth,lastTime);
	},
	show : function(table,year,month,lastTime){
		var minMensesPriod = helper.$("minMensesPriod").value;
		// check priod
//		if(isNaN(minMensesPriod) || (Number(minMensesPriod) > 40 || Number(minMensesPriod) < 24)){
//			alert("请输入数字并介于24与40之间");
//			return false;
//		}
		// check priod end
		// 0:red 1:green 2:orange 
		minMensesPriod = Number(minMensesPriod);
		var secondUnit = 24 * 60 * 60 * 1000;
		var k = 0;
		for(var i=1;i<7;i++){
			for(var j=0;j<7;j++){
				var calDayItem = table.rows[i].cells[j];
				(!calDayItem.innerHTML.match(/[0-9]/)) || calDayItem.innerHTML == "" || calDayItem.innerHTML == "&nbsp;" || calDayItem.innerHTML == " "
				//alert(calDayItem.innerHTML + "\n" + isNaN(calDayItem.innerHTML));
				if(isNaN(calDayItem.innerHTML)){
					continue;
				}else{
					var calDay = Number(calDayItem.innerHTML);
					var calTime = new Date(Date.UTC(year,month-1,calDay)).getTime();
					var dayDiff = Math.floor((calTime - lastTime) / secondUnit);
					var result = (dayDiff % minMensesPriod + minMensesPriod) % minMensesPriod;
					calDayItem.style.fontWeight = "bold";
					calDayItem.table = table.id;
					calDayItem.cell = j;
					calDayItem.row = i;
					if(result >= 0 && result <= 4){
						//calDayItem.style.background = "url(images/orange.gif) no-repeat 0 0";
						calDayItem.style.color = "#f8a329";
						calDayItem.code = 2;
						calDayItem.onmouseover = function(){
							female.showIntro(this,"这是月经期，要注意经期卫生哦","#f8a329","#fff5bb",1);
						}
						calDayItem.onmouseout = function(){
							female.showIntro();
						}
					}else if(result >= 5 && result <= (minMensesPriod - 20)){//20
						//calDayItem.style.background = "url(images/green.gif) no-repeat 0 0";
						calDayItem.style.color = "#85b84a";
						calDayItem.code = 1;
						calDayItem.onmouseover = function(){
							female.showIntro(this,"这是安全期，一般是不会受孕的","#85b84a","#edfced",0);
						}
						calDayItem.onmouseout = function(){
							female.showIntro();
						}
					}else if(result >= (minMensesPriod - 19) && result <= (minMensesPriod - 10)){//19 10
						//calDayItem.style.background = "url(images/red.gif) no-repeat 0 0";
						calDayItem.style.color = "#e66e6e";
						calDayItem.code = 0;
						calDayItem.onmouseover = function(){
							female.showIntro(this,"这是危险期，亦称排卵期，受孕可能性较大","#e66e6e","#fff2f2",2);
						}
						calDayItem.onmouseout = function(){
							female.showIntro();
						}
					}else if(result >= (minMensesPriod - 9) && result <= (minMensesPriod - 1)){//9 1
						//calDayItem.style.background = "url(images/green.gif) no-repeat 0 0";
						calDayItem.style.color = "#85b84a";
						calDayItem.code = 1;
						calDayItem.onmouseover = function(){
							female.showIntro(this,"这是安全期，一般是不会受孕的","#85b84a","#edfced",0);
						}
						calDayItem.onmouseout = function(){
							female.showIntro();
						}
					}
				}
			}
		}
		for(var i=1;i<7;i++){
			for(var j=0;j<7;j++){
				var calDayItem = table.rows[i].cells[j];
				if(isNaN(calDayItem.innerHTML)){
					continue;
				}else{
					female.concat(calDayItem);
				}
			}
		}
	},
	concat : function(itm){
		var cellIndex = itm.cell;
		var rowIndex = itm.row;
		var table = helper.$(itm.table);
		var prev,next,isConcat = "";
		try{prev = table.rows[rowIndex].cells[cellIndex-1];}
		catch(e){
			try{
				prev = table.rows[rowIndex - 1].cells[6];
			}catch(e){prev = null;}
		}
		try{
			next = table.rows[rowIndex].cells[cellIndex + 1];
		}catch(e){
			try{
				next = table.rows[rowIndex + 1].cells[0];
			}catch(e){
				next = null;
			}
		}
		if(prev && next){
			if(prev.code == itm.code){
				if(next.code == itm.code){isConcat = "11";}else{isConcat = "10";}
			}else{
				if(next.code == itm.code){isConcat = "01";}else{isConcat = "00";}
			}
		}else{
			if(prev){
				if(prev.code == itm.code){isConcat = "10";}else{isConcat = "00";}
			}
			if(next){
				if(next.code == itm.code){isConcat = "01";}else{isConcat = "00";}
			}
		}
		switch(itm.code){
			case 0:
				if(isConcat == "11"){itm.style.background = "url(images/red-a.gif) no-repeat 0 0";}
				if(isConcat == "10"){itm.style.background = "url(images/red-l.gif) no-repeat 0 0";}
				if(isConcat == "01"){itm.style.background = "url(images/red-r2.gif) no-repeat 0 0";}
				if(isConcat == "00"){itm.style.background = "url(images/red.gif) no-repeat 0 0";}
			break;
			case 1:
				if(isConcat == "11"){itm.style.background = "url(images/green-a.gif) no-repeat 0 0";}
				if(isConcat == "10"){itm.style.background = "url(images/green-l.gif) no-repeat 0 0";}
				if(isConcat == "01"){itm.style.background = "url(images/green-r2.gif) no-repeat 0 0";}
				if(isConcat == "00"){itm.style.background = "url(images/green.gif) no-repeat 0 0";}
			break;
			case 2:
				if(isConcat == "11"){itm.style.background = "url(images/orange-a.gif) no-repeat 0 0";}
				if(isConcat == "10"){itm.style.background = "url(images/orange-l.gif) no-repeat 0 0";}
				if(isConcat == "01"){itm.style.background = "url(images/orange-r2.gif) no-repeat 0 0";}
				if(isConcat == "00"){itm.style.background = "url(images/orange.gif) no-repeat 0 0";}
			break;
		}
	},
	increase : function(){
		var minMensesPriod = helper.$("minMensesPriod").value;
		if(parseInt(minMensesPriod) >= 40){
			return false;
		}else{
			helper.$("minMensesPriod").value = parseInt(minMensesPriod) + 1;
		}
		if(female.check() && calendar.args.clickDay){
			female.calculate();
			calendar.args.clickDay.style.color = "#c36417";
			calendar.args.clickDay.style.fontWeight = "bold";
			calendar.args.clickDay.style.background = "url(images/now.gif) no-repeat center center";
		}
	},
	fallOff : function(){
		var minMensesPriod = helper.$("minMensesPriod").value;
		if(parseInt(minMensesPriod) <= 20){
			return false;
		}else{
			helper.$("minMensesPriod").value = parseInt(minMensesPriod) - 1;
		}
		if(female.check() && calendar.args.clickDay){
			female.calculate();
			calendar.args.clickDay.style.color = "#c36417";
			calendar.args.clickDay.style.fontWeight = "bold";
			calendar.args.clickDay.style.background = "url(images/now.gif) no-repeat center center";
		}
	}
}
helper.bind(window,"load",function(){
	var nowDate = new Date();
	calendar.show(nowDate.getFullYear(),nowDate.getMonth(),nowDate.getDate());
	calendar.init(nowDate.getFullYear(),nowDate.getMonth());
	document.getElementById("minMensesPriod").onkeyup = function(){
	   this.value = this.value.replace(/[^\d.]/g,"");  //清除“数字”和“.”以外的字符 
	   this.value = this.value.replace(/^\./g,"");  //验证第一个字符是数字而不是. 
	   this.value = this.value.replace(/\.{2,}/g,"."); //只保留第一个. 清除多余的. 
	   this.value = this.value.replace(".","$#$").replace(/\./g,"").replace("$#$","."); 
		if(female.check() && calendar.args.clickDay){
			female.calculate();
			calendar.args.clickDay.style.color = "#c36417";
			calendar.args.clickDay.style.fontWeight = "bold";
			calendar.args.clickDay.style.background = "url(images/now.gif) no-repeat center center";
		}
	}
});
helper.bind(window,"resize",function(){
	var yl = helper.$("yearLayer");
	var ml = helper.$("monthLayer");
	if(yl){
		if(yl.style.display == "block"){calendar.showLayer(yl);}
	}
	if(ml){
		if(ml.style.display == "block"){
			calendar.showLayer(ml);
			ml.style.left = ml.style.left.toNumber() - 155 + "px"
		}
	}
});