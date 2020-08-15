Array.prototype.remove = function(val) {
	var index = this.indexOf(val);
	if (index > -1) {
		this.splice(index, 1);
	}
	console.log(index+"删除元素"+val);
	
};
var datatable = document.getElementsByClassName("long")[0];
//左右调整表单显示
document.onkeydown = function(event){
	var e = event || window.event || arguments.callee.caller.arguments[0];
	var moveValue = 100;
	if(e && e.keyCode==37){//  按下左键
		move(datatable,moveValue);
	}
	if(e && e.keyCode==39){//  按下右键
		move(datatable,-1*moveValue);
	}
}

//开合导航栏相关
var leftNavIsClose = false;
var leftNav = document.getElementsByClassName("left-nav")[0];
var body = document.getElementsByClassName("body")[0];
var minWidth_leftNav = 60;
var maxWidth_leftNav = 280;
CWLN = null;
document.getElementById("close-left-nav").onclick = function(){
	if(leftNavIsClose){
		CWLN = setInterval(closeNav,10,leftNav,body,maxWidth_leftNav);
//		leftNav.style.width = 250+"px";
	}
	else{
		CWLN = setInterval(closeNav,10,leftNav,body,minWidth_leftNav);
//		leftNav.style.width = 60+"px";
	}
	leftNavIsClose = !leftNavIsClose;
}
document.getElementsByClassName("left-nav")[0].onmouseenter = function(){
	clearInterval(CWLN);
	CWLN = setInterval(closeNav,10,leftNav,body,maxWidth_leftNav);
}
document.getElementsByClassName("left-nav")[0].onmouseleave = function(){
	if(leftNavIsClose){
		clearInterval(CWLN);
		CWLN = setInterval(closeNav,10,leftNav,body,minWidth_leftNav);
	}
}
//将ele元素的left值在范围内移动moveValue
function move(ele,moveValue){
	var boxWid = document.getElementById("data-table-box").offsetWidth;
	var wid = ele.getBoundingClientRect().width;
	var min = boxWid-wid;
	var max = 0;
	var leftTarget = ele.offsetLeft + moveValue;
//	console.log(ele.offsetLeft);
	if(leftTarget<min){
		ele.style.left = min+"px";
	}
	else if(leftTarget>max){
		ele.style.left = max+"px";
	}
	else{
		ele.style.left = leftTarget+"px";
	}
}
/*线性改变元素宽度和高度*/
function toSize(ele,eleTargetWidth,eleTargetHeight){
	var thisTargetWidth = ele.getBoundingClientRect().width + (eleTargetWidth - ele.getBoundingClientRect().width)*0.1;	//这次目标宽度
	var thisTargetHeight = ele.getBoundingClientRect().height + (eleTargetHeight - ele.getBoundingClientRect().height)*0.1;
//	console.log("navWidth="+nav.getBoundingClientRect().width + ",tarWidth="+navTargetWidth+",thisTargetWidth="+thisTarget);
	ele.style.width = (Math.abs(thisTargetWidth-eleTargetWidth)<0.5?eleTargetWidth:thisTargetWidth) + "px";
	ele.style.height = (Math.abs(thisTargetHeight-eleTargetHeight)<0.5?eleTargetHeight:thisTargetHeight) + "px";
//	console.log(nav.style.width);
	if(ele.getBoundingClientRect().width == eleTargetWidth&&ele.getBoundingClientRect().height == eleTargetHeight){
		ele.style.width = eleTargetWidth + "px";
		ele.style.height = eleTargetHeight + "px";
		clearInterval(TS);
	}
}
TH = null;
/*线性改变元素高度*/
function toHeight(ele,eleTargetHeight,displayType){
	var thisTargetHeight = ele.getBoundingClientRect().height + (eleTargetHeight - ele.getBoundingClientRect().height)*0.1;
	ele.style.height = (Math.abs(thisTargetHeight-eleTargetHeight)<0.5?eleTargetHeight:thisTargetHeight) + "px";
	if(ele.getBoundingClientRect().height == eleTargetHeight){
		ele.style.height = eleTargetHeight + "px";
		ele.style.display = displayType;
		clearInterval(TH);
	}
}
/*关闭/打开导航*/
function closeNav(nav,body,navTargetWidth){
	var thisTarget = nav.getBoundingClientRect().width + (navTargetWidth - nav.getBoundingClientRect().width)*0.1;	//这次目标宽度
//	console.log("navWidth="+nav.getBoundingClientRect().width + ",tarWidth="+navTargetWidth+",thisTargetWidth="+thisTarget);
	nav.style.width = (Math.abs(thisTarget-navTargetWidth)<0.5?navTargetWidth:thisTarget) + "px";
	body.style.marginLeft = nav.style.width;
//	console.log(nav.style.width);
	if(nav.getBoundingClientRect().width == navTargetWidth){
		clearInterval(CWLN);
	}
}

//统计信息功能
var totalInfoLink = document.getElementById("totalInfoLink");
var totalInfoIsClose = true;		//统计信息页是否是合并的
var totalInfoTableBox = document.getElementById("totalInfoTableBox");
var fullWidth = totalInfoTableBox.getBoundingClientRect().width;
var fullHeight = totalInfoTableBox.getBoundingClientRect().height;
fullWidth = totalInfoTableBox.getBoundingClientRect().width;
fullHeight = totalInfoTableBox.getBoundingClientRect().height;
totalInfoTableBox.style.width = 0;
totalInfoTableBox.style.height = 0;
var isFirst = true;
TS = null;
$('#totalInfoLink').on('click',function(){
	var totalInfoTableBox = document.getElementById("totalInfoTableBox");
	if(totalInfoIsClose){
//		totalInfoTableBox.style.display = "block";
		clearInterval(TS);
		TS = setInterval(toSize,10,totalInfoTableBox,fullWidth,fullHeight);
		
		totalInfoLink.style.backgroundColor="#000";
		totalInfoLink.style.color = "#fff";
	}
	else{
//		totalInfoTableBox.style.display = "none";
		clearInterval(TS);
		TS = setInterval(toSize,10,totalInfoTableBox,0,0);
		totalInfoLink.style.backgroundColor="#fff";
		totalInfoLink.style.color = "#000";
	}
	totalInfoIsClose = !totalInfoIsClose;
});

totalInfoLink.onmouseenter = function(){
	if(isFirst){
		isFirst = false;
		console.log(fullWidth);console.log(fullHeight);
	}
	clearInterval(TS);
	TS = setInterval(toSize,10,totalInfoTableBox,fullWidth,fullHeight);
}

totalInfoLink.onmouseleave = function(){
	if(!totalInfoIsClose)return;		/*展开状态就不做关闭动画*/
	clearInterval(TS);
	TS = setInterval(toSize,10,totalInfoTableBox,0,0);
}





//子子模块开合功能
var navList_menu = document.getElementsByClassName("nav-list")[0].getElementsByClassName("menu");
for(var i = 0;i < navList_menu.length;i++){
	navList_menu[i].onclick = function(){
		var subsublist = this.getElementsByClassName("subsublist")[0];
		if(TH!=null)clearInterval(TH);
		console.log(subsublist);
		console.log(subsublist.style.display);
		if(subsublist.getBoundingClientRect().height>5){
			console.log("正在合并");
			this.getElementsByClassName("open")[0].classList.remove("open");
			TH = setInterval(toHeight,10,subsublist,0,"none");
			this.getElementsByClassName("menu-sign")[0].style.transform = "rotate(0)";
			
		}
		else{
			this.getElementsByClassName("menu-sign")[0].style.animation = "none";
			this.getElementsByClassName("select-a")[0].classList.add("open");
			subsublist.style.display = "block";
			subsublist.style.height = "0";
			console.log("正在展开");
			var height = 0;
			var subsubitems = subsublist.getElementsByClassName("subsubitem");
			if(subsubitems.length>0)
				height = subsubitems.length*(subsubitems[0].getBoundingClientRect().height+
					subsubitems[0].style.marginTop+subsubitems[0].style.marginBottom)+20;
			TH = setInterval(toHeight,10,subsublist,height,"block");
			this.getElementsByClassName("menu-sign")[0].style.transform = "rotate(-90deg)";
		}
	}
}
//添加数据功能
document.getElementById("addData").onclick = function(){
	document.getElementById("addBox").style.display = "block";
}

var closeAddBox = function(){
	var addTbody = $('#add-tbody');
	var lines = addTbody.children();
	console.log(lines.length);
	for(var i = 0;i < lines.length-1;i++){
		lines[i].remove();
	}
	$('#addBox .dataInput').val("");
	document.getElementById("addBox").style.display = "none";
}
var addBox = document.getElementById("addBox");
addBox.getElementsByClassName("close")[0].onclick = closeAddBox;
addBox.getElementsByClassName("close")[1].onclick = closeAddBox;
$('#submit-addAll').click(function(){
	addAjax(tableName,getAddDatas());
	closeAddBox();
});

//编辑数据功能

function addDataTableEvent(){
	//添加编辑按钮事件
	var closeEditBox = function(){
		$('#editBox .dataInput').val("");
		document.getElementById("editBox").style.display = "none";
	}
	var editData = document.getElementsByClassName("editData");
	var editBox = document.getElementById("editBox");
	for(var i = 0;i < editData.length;i++){
		editData[i].onclick = function(){
			var $this = $(this);
			getEditDataAjax(tableName,$this.attr("name"));
			editBox.style.display = "block";
		}
	}
	//提交编辑内容
	document.getElementById("submit-edit").onclick = function(){
		editDataAjax(tableName,getEditData());
		closeEditBox();
	};
	editBox.getElementsByClassName("close")[0].onclick = closeEditBox;
	editBox.getElementsByClassName("close")[1].onclick = closeEditBox;
	//添加完全显示事件
	/*点击显示完整数据事件*/
	$('.datatable .val').on('click',function(){
		$this = $(this);
		console.log("显示完整信息");
		$('.completeValBox').css("display","block");
		$('.completeValBox .cont .text').text($this.text());
	});
	//添加选择cheb事件
	$('.datatable .row .dataCheb').on("click",dataChebClick);
}
addDataTableEvent();

$('.table-top .fl .dropdownLink').on('click',function(){
	var $this = $(this);
	var isPress = $this.siblings(' .dropdown-content').css("display")=="none"?true:false;
	$this.siblings(' .dropdown-content').css("display",isPress?"block":"none");
	$this.css("background-color",isPress?"#48545c":"rgba(0,0,0,0)");
	$this.css("color",isPress?"#fff":"#444");
});
/*显示|隐藏列功能*/
//$('#showColMenu-dropdown .dropdownLink').on('click',function(){
//	var isPress = $('#showColMenu-dropdown .dropdown-content').css("display")=="none"?true:false;
//	$('#showColMenu-dropdown .dropdown-content').css("display",isPress?"block":"none");
//	$('#showColMenu-dropdown .dropdownLink ').css("background-color",isPress?"#48545c":"rgba(0,0,0,0)");
//	$('#showColMenu-dropdown .dropdownLink ').css("color",isPress?"#fff":"#444");
//});
var showColMenu = document.getElementById("showColMenu-dropdown");
var showColMenu_cheb = showColMenu.getElementsByClassName('cheb');
showColMenu.getElementsByClassName("cheb-all")[0].onclick = function(){
	for(var i = 0;i < showColMenu_cheb.length;i++){
		showColMenu_cheb[i].checked = this.checked;
		showColMenu_cheb[i].onclick();
	}
}
// var showColSum = showColMenu_cheb.length+2;
for(var i = 0;i < showColMenu_cheb.length;i++){
	showColMenu_cheb[i].index = i;
	showColMenu_cheb[i].onclick = function(){
		console.log("点击了显示列选项");
		var datatable = document.getElementsByClassName('datatable')[0];
		var trs = datatable.getElementsByTagName('tr');
		var isShow = this.checked;		//当前显示多少列
		if(isShow==false)showColMenu.getElementsByClassName("cheb-all")[0].checked = false;
		if(!isShow&&$.inArray($('.colname-text').eq(this.index).text(),hiddenCols)==-1)
			hiddenCols.push($('.colname-text').eq(this.index).text());
		else if(isShow)
			hiddenCols.remove($('.colname-text').eq(this.index).text());
		for(var j = 0;j < trs.length;j++){
				trs[j].children[this.index+1].style.display = isShow?"table-cell":"none";
		}
//		console.log("隐藏的列:");
//		console.log(hiddenCols);
		var colNames = trs[0].children;
		var showColSum = 0;
		for(var i = 0;i < colNames.length;i++)
			if(colNames[i].style.display!="none")showColSum++;
		datatable.style.width = (100*showColSum<$('#data-table-box').width()?$('#data-table-box').width():100*showColSum) + "px";
		
	}
}

(function(){
	var $colname = $('.colname-text');
//	console.log("默认隐藏的列:");
//	console.log(hiddenCols);
	for(var i = $colname.length-1;i >= 0;i--){
		if($.inArray($colname.eq(i).text(),hiddenCols)!=-1){
			showColMenu_cheb[i].click();
		}
	}

})();
//隐藏不显示的列
function hiddenCol(){
	var $colname = $('.colname-text');
	var $chebs = $('#showColMenu-dropdown .droplist .cheb');
	var trs = document.getElementsByClassName("datatable")[0].getElementsByTagName('tr');
	for(var i = $colname.length-1;i >= 0;i--){
		if($.inArray($colname.eq(i).text(),hiddenCols)!=-1){
			for(var j = 0;j < trs.length;j++){
					trs[j].children[i+1].style.display = "none";
			}
		}
	}
}
hiddenCol();


/*筛选模块*/
signsort = new Array();		//排序列先后顺序
var colValuescreen = new Array();		//筛选条件
for(var i = 0;i < colSum;i++)
	colValuescreen[i] = "";
//按列排序
(function(){
	var datatable = document.getElementsByClassName("datatable")[0];
	var colname_ths = datatable.getElementsByClassName("colname-th");
	var sortSigns = document.getElementsByClassName("sortSign");
	if(colname_ths.length==0)return;		//如果没有数据，就不处理
	for(var i = 0;i < sortSigns.length;i++){
		sortSigns[i].index = i;
		var sortCancel = colname_ths[i+1].getElementsByClassName("sort-cancel")[0];
		sortSigns[i].onclick = function(){
			console.log("进入dataTable_sort");
			if(this.classList.contains('sort-down')){
				this.classList.remove('sort-down');
				this.classList.add('sort-up');
				this.innerHTML = "&#xe737;";
			}
			else{
				this.classList.remove('sort-up');
				this.classList.add('sort-down');
				this.innerHTML = "&#xe738;";
			}
			var tmp = new Array();
			for(var i = 0;i < signsort.length;i++)
				if(signsort[i]==this)continue;
				else tmp.push(signsort[i]);
			tmp.push(this);
			signsort.length = 0;
			signsort = tmp;
			refreshDataAjax();
		}
		sortCancel.onclick = function(){
			var thisSortSign = this.parentNode.getElementsByClassName("sortSign")[0];
			var tmp = new Array();
			//从排序列中删除该节点
			for(var i = 0;i < signsort.length;i++){
				if(signsort[i]==this)continue;
				tmp.push(signsort[i]);
			}
			signsort = tmp;
			thisSortSign.classList.remove('sort-up');
			thisSortSign.classList.remove('sort-down');
			thisSortSign.innerHTML = "&#xe660;";
			refreshDataAjax();
		}
	}
	$('#sort-cancel-all').on('click',function(){
		var $sortSigns = $('.sortSign');
		$sortSigns.removeClass('sort-up sort-down');
		for(var i = 0;i < $sortSigns.length;i++){
			$sortSigns.eq(i).html("&#xe660;");
		}
		signsort.length = 0;
		refreshDataAjax();
	});
})();



//筛选列功能
var colscreens = document.getElementsByClassName("colscreen");
var colscreen_dropdowns = document.getElementsByClassName("colscreen-dropdown");
var CSDIsCloses = new Array();
var screen_colIdx;
function recoveryColValue(){}
recoveryColValue.$valuescreenClone = null;
recoveryColValue.valueIsChange = false;
recoveryColValue.valueIsSubmit = false;
recoveryColValue.recover = function(){

	console.log("valueIsChange:"+recoveryColValue.valueIsChange+",valueIsSubmit:"+recoveryColValue.valueIsSubmit);
	//进入方法
	//只有打开了值选项且没有提交，才做恢复
	if(recoveryColValue.valueIsChange==true&&recoveryColValue.valueIsSubmit==false){
		console.log("正在恢复");
		document.getElementsByClassName("valuescreen-item")[screen_colIdx].getElementsByClassName("sub-dropdown")[0].remove();
		$('.valuescreen-item .dropitem').eq(screen_colIdx).append(recoveryColValue.$valuescreenClone);
		
	}
	recoveryColValue.valueIsChange = false;
	recoveryColValue.valueIsSubmit = false;
	recoveryColValue.valuescreenClone = null;
}
//显示提示(提示列的下标，提示文本)
function showScreenReminder(colIdx,reminder){
	console.log("显示提示");
	reminder = reminder.length<10?reminder:reminder.substring(0,10)+"...";
	$('.colscreen-td').eq(colIdx).children('.colscreen').addClass('filtered');
	$('.colscreen-td').eq(colIdx).children().children('.text').html(reminder);
	console.log($('.colscreen-td').eq(colIdx).children().children('.text'));
}
//关闭提示
function closeScreenReminder(colIdx){
	$('.colscreen-td').eq(colIdx).children('.colscreen').removeClass('filtered');
	$('.colscreen-td').eq(colIdx).children().children('.text').html("&#xe83b;");
}
//隐藏与展开筛选下拉框
function closeColscreenDropdown(){
	colscreen_dropdowns[this.index].style.display = "none";
	CSDIsCloses[this.index] = true;
	recoveryColValue.recover();		//如果没有提交筛选条件的修改，就恢复
}
function openColscreenDropdown(){
	for(var i = 0;i < CSDIsCloses.length;i++)
		CSDIsCloses[i] = true;
	screen_colIdx = this.index;
	var colscreen_dropdown = colscreen_dropdowns[this.index];
	colscreen_dropdown.style.display = "block";
	colscreen_dropdown.style.animation = "dropdown 0.3s";
	colscreen_dropdown.style.animationFillMode = "forwards";
	CSDIsCloses[this.index] = false;
	//this.appendChild(colscreen_dropdown);
	
	var left = document.documentElement.clientWidth;
	//console.log("colwidth = " + colscreen_dropdown.getBoundingClientRect().width);
	//如果浏览器的宽度减去colscreen_dropdown的y坐标小于colscreen_dropdown的宽度（右边不能完全显示该元素）,就在左边显示
//	if(document.documentElement.clientWidth-colscreen_dropdown.getBoundingClientRect().left < colscreen_dropdown.getBoundingClientRect().width + 10){
//		console.log("太右了");
//		colscreen_dropdown.style.left = -1*colscreen_dropdown.getBoundingClientRect().width + "px";
//		
//	}
//	console.log("浏览器宽度 = " + left + ",colDropdown.left = " + colscreen_dropdown.getBoundingClientRect().left);
}
//元素的坐标+元素宽度是否大于浏览器宽度
function isTooRight(ele){
	if(document.documentElement.clientWidth-ele.getBoundingClientRect().left < ele.getBoundingClientRect().width + 10){
		return true;
	}
	return false;
}
function fixLeft(ele){
	if(isTooRight(ele)){
		ele.style.left = -1*ele.getBoundingClientRect().width+"px";
		console.log("不能完全显示，改为左边显示");
	}
}
for(var i = 0;i < colscreens.length;i++){
	CSDIsCloses[i] = true;
	colscreens[i].index = i;
//	colscreens[i].onclick = closeColscreenDropdown;
	colscreens[i].onmouseenter = openColscreenDropdown;
	colscreens[i].onmouseleave = closeColscreenDropdown;
}
//数据筛选
//按值筛选
var valuescreen_items = document.getElementsByClassName("valuescreen-item");
for(var i = 0;i < valuescreen_items.length;i++){
	//靠近按值筛选选项
	valuescreen_items[i].onmouseenter = function(){
		fixLeft(this.getElementsByClassName('sub-dropdown')[0]);
		//console.log("screen_colIdx = " + screen_colIdx);
		recoveryColValue.$valuescreenClone = $('.valuescreen-item .sub-dropdown').eq(screen_colIdx).clone(true);
		console.log(document.getElementsByClassName('valuescreen-all-checkbox-box-list')[screen_colIdx].children.length);
		if(document.getElementsByClassName('valuescreen-all-checkbox-box-list')[screen_colIdx].children.length>0)return;	//有子节点
		valuescreenFindValuesAjax(tableName,screen_colIdx);
	}
}
/*按值筛选-全选*/
//var valuescreenAllCheckbox = document.getElementById("valuescreen-all-checkbox");

$('.valuescreen-all-checkbox').on('click',function(){
	recoveryColValue.valueIsChange = true;
	var list = document.getElementsByClassName("valuescreen-all-checkbox-box-list")[screen_colIdx];
	var items = list.getElementsByClassName("cheb");
	for(var i = 0;i < items.length;i++){
		items[i].checked = this.checked;
	}
});
$('.valuescreen-all-checkbox-box-list').on('click','.cheb',function(){
	console.log("修改了值筛选选项");
	var isAllChecked = true;
	recoveryColValue.valueIsChange = true;
	var list = document.getElementsByClassName("valuescreen-all-checkbox-box-list")[screen_colIdx];
	var items = list.getElementsByClassName("cheb");
	for(var i = 0;i < items.length;i++)
		if(items[i].checked==false){
			isAllChecked = false;
			break;
		}
	document.getElementsByClassName('valuescreen-all-checkbox')[screen_colIdx].checked = isAllChecked;
	//$('.valuescreen-all-checkbox').eq(screen_colIdx).prop('checked',isAllChecked);
});
//提交查询
function submitQuery(reminder){
	if(colValuescreen[screen_colIdx] == "")
		closeScreenReminder(screen_colIdx);
	else
		showScreenReminder(screen_colIdx,reminder);
	refreshDataAjax();
	document.getElementsByClassName("colscreen-dropdown")[screen_colIdx].style.display="none";
}
//提交值筛选
$('.valuescreen-all-submit').on('click',function(){
	recoveryColValue.valueIsSubmit = true;
	var str = "";
	var reminder = "";
	document.getElementsByClassName("colscreen-dropdown")[screen_colIdx].style.display="none";
	/*可优化选项：选中的少就提交选中的给后台，选中的多就提交没选中的给后台*/
	if($('.valuescreen-all-checkbox').eq(screen_colIdx).prop('checked')==false){		//如果没有全选
		str = "&value ";		//告诉后台，按值筛选
		var chebs = document.getElementsByClassName('valuescreen-all-checkbox-box-list')[screen_colIdx].
			getElementsByClassName('cheb');
		var texts = document.getElementsByClassName('valuescreen-all-checkbox-box-list')[screen_colIdx].
			getElementsByClassName('text');
		for(var i = 0;i < chebs.length;i++){
			if(chebs[i].checked==true){
				str+="'"+texts[i].innerHTML+"'" + ",";
				if(reminder.length==0)reminder += texts[i].innerHTML;
				else reminder += ","+texts[i].innerHTML;
			}
		}
		//如果一个都没选
		if(str=="&value "){
			reminder = "全不显示";
			$('.datatable .row').remove();
			str = "$none";
			colValuescreen[screen_colIdx] = "";
			showScreenReminder(screen_colIdx,"全不显示");
			return;
		}		
	}
	colValuescreen[screen_colIdx] = str;
	submitQuery(reminder);
});

//搜索值
$('.colValueSearch-text').bind('input propertychange',function(){
	recoveryColValue.valueIsChange = true;
	var str = this.value;
	var reg = eval("/[\\s\\S]*" + str.replace(/ /g,"[\\s\\S]*") + "[\\s\\S]*/i");
	var $items = $('.valuescreen-all-checkbox-box-list').eq(screen_colIdx).children('.item');
	for(var i = 0;i < $items.length;i++){
		var itemStr = $items.eq(i).children('.text').html();
		if(reg.exec(itemStr)){
			$items.eq(i).css({display:'block'});
		}
		else{
			$items.eq(i).css({display:'none'});
		}
	}
	console.log(reg);
	
});

//按数字筛选

var numscreen_items = document.getElementsByClassName("numscreen-item");
$('.numscreen-item').mouseenter(function(){
	fixLeft(this.getElementsByClassName('sub-dropdown')[0]);
});
//提交数字筛选
$('.numscreen-all-submit').click(function(){
	var sign = $('.numscreen-select').eq(screen_colIdx).val();
	var num = $('.numscreen-val').eq(screen_colIdx).val();
	colValuescreen[screen_colIdx] = "&number "+sign+num;
	console.log(colValuescreen[screen_colIdx]);
	submitQuery(sign+num);
});

//取消筛选
$('.cancelscreen-link').click(function(){
	$('.valuescreen-all-checkbox').eq(screen_colIdx).prop('checked',true);
	var list = document.getElementsByClassName("valuescreen-all-checkbox-box-list")[screen_colIdx];
	var items = list.getElementsByClassName("cheb");
	for(var i = 0;i < items.length;i++){
		items[i].checked = true;
	}
	colValuescreen[screen_colIdx] = "";
	submitQuery();
});

//分页

//删除
function delData(ele){
	if(confirm("确定要删除吗?")){
		var $this = $(ele);
		delAjax(tableName,$this.prop("name"));
	}
}

/*点击显示完整数据事件*/
$('.datatable .val').on('click',function(){
	$this = $(this);
	console.log("显示完整信息");
	$('.completeValBox').css("display","block");
	$('.completeValBox .cont .text').text($this.text());
});

$('.completeValBox .close').click(function(){
    $('.completeValBox').css("display","none");
});


//Demo  仅用于看效果
var dropitems = document.getElementsByClassName("dropitem");
for(var i = 0;i < dropitems.length;i++){
	dropitems[i].index = i;
}
dropitems[0].onclick = tmp1;
function tmp1(){
	var sortcols = document.getElementsByClassName("sortcol");
	console.log(sortcols.length);
	for(var i = 0;i < sortcols.length;i++){
		sortcols[i].innerHTML = "&#xe83b;";
		sortcols[i].classList.remove("sortcol");
		console.log("删除sortcol成功!");
	}
	for(var i = 0;i < CSDIsCloses.length;i++){
		if(CSDIsCloses[i]==false){
			colscreens[i].classList.add("sortcol");
			colscreens[i].innerHTML = "升序";
		}
	}
}
dropitems[1].onclick = tmp2;
function tmp2(){
	var sortcols = document.getElementsByClassName("sortcol");
	console.log(sortcols.length);
	for(var i = 0;i < sortcols.length;i++){
		sortcols[i].innerHTML = "&#xe83b;";
		sortcols[i].classList.remove("sortcol");
	}
	for(var i = 0;i < CSDIsCloses.length;i++){
		if(CSDIsCloses[i]==false){
			colscreens[i].classList.add("sortcol");
			colscreens[i].innerHTML = "降序";
		}
	}
}

//限制输入函数
//只能输入数字和小数点
function putNum(_this){
	console.log(_this.value);
}

//数据选择
//当前页数据全选事件
$('.table-top #data-allCheb').on('click',function(){
	$this = $(this);
	$('.datatable .row .dataCheb').prop("checked",$this.prop("checked"));
	if($this.prop("checked")==false)
		$('.datatable .replenishDataCheb-th .replenishDataCheb').prop("checked",false);
});
//子选择点击事件
function dataIsAllChecked(){
	$dataChebs = $(".datatable .row .dataCheb");
	for(var i = 0;i < $dataChebs.length;i++){
		if($dataChebs.eq(i).prop("checked")==false){
			return false;
		}
	}
	return true;
}
function dataChebClick(){
	$this = $(this);
	if($this.prop("checked")==false)
		$('.table-top #data-allCheb').prop("checked",false);
	else if(dataIsAllChecked())
		$('.table-top #data-allCheb').prop("checked",true);
}
$('.datatable .row .dataCheb').on("click",dataChebClick);
//勾选所有页，当前页所有数据自动全部勾选。而取消勾选所有页，不影响数据勾选
$('.datatable .replenishDataCheb-th .replenishDataCheb').on("click",function(){
	$this = $(this);
	if($this.prop("checked")==true)
		$('.datatable .row .dataCheb').prop("checked",true);
	dataChebClick();
});

//导出按钮事件
$('.dataExport').on('click',function(){
	console.log($('.table-top .fl #dataCheckedMenu-dropdown .dropdownLink'));
	$('.table-top .fl #dataCheckedMenu-dropdown .dropdownLink').trigger("click");
	exportAjax(tableName);
});