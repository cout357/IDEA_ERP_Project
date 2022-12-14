Array.prototype.remove = function(val) {
	var index = this.indexOf(val);
	if (index > -1) {
		this.splice(index, 1);
	}
	console.log(index+"删除元素"+val);
	
};
//将ele元素的left值在范围内移动moveValue
function moveLeft(ele,moveValue){
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
var datatable = document.getElementsByClassName("datatable")[0];
//左右调整表单显示
document.onkeydown = function(event){
	var e = event || window.event || arguments.callee.caller.arguments[0];
	var moveValue = 100;
	if(e && e.keyCode==37){//  按下左键
		moveLeft(datatable,moveValue);
	}
	if(e && e.keyCode==39){//  按下右键
		moveLeft(datatable,-1*moveValue);
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
	clearInterval(CWLN);
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

/*线性改变元素宽度和高度*/
function toSize(ele,eleTargetWidth,eleTargetHeight,moveSpeed = 0.1){
	var thisTargetWidth = ele.getBoundingClientRect().width + (eleTargetWidth - ele.getBoundingClientRect().width)*moveSpeed;	//这次目标宽度
	var thisTargetHeight = ele.getBoundingClientRect().height + (eleTargetHeight - ele.getBoundingClientRect().height)*moveSpeed;
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
function toHeight(ele,eleTargetHeight,displayType="block"){
	var thisTargetHeight = ele.getBoundingClientRect().height + (eleTargetHeight - ele.getBoundingClientRect().height)*0.1;
	ele.style.height = (Math.abs(thisTargetHeight-eleTargetHeight)<0.5?eleTargetHeight:thisTargetHeight) + "px";
	if(ele.getBoundingClientRect().height == eleTargetHeight){
		ele.style.height = eleTargetHeight + "px";
		ele.style.display = displayType;
		clearInterval(TH);
	}
}
/*function toHeight($ele,eleTargetHeight,displayType="block"){
	var thisTargetHeight = $ele.height() + (eleTargetHeight - $ele.height())*0.1;
	console.log("$ele.height():"+$ele.height()+"targetHeight:"+thisTargetHeight);
	$ele.height((Math.abs(thisTargetHeight-eleTargetHeight)<0.5?eleTargetHeight:thisTargetHeight) + "px");
	if($ele.height() == eleTargetHeight){
		$ele.height(eleTargetHeight + "px");
		$ele.css(displayType);
		clearInterval(TH);
	}
}*/
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
if(totalInfoLink!=null){
	var totalInfoIsClose = true;		//统计信息页是否是合并的
	var totalInfoTableBox = document.getElementById("totalInfoTableBox");
	var fullHeight = totalInfoTableBox.getBoundingClientRect().height;
	//fullWidth = totalInfoTableBox.getBoundingClientRect().width;
	fullWidth = $('.content-head .totalInfo-box .table-box').width();
	fullHeight = totalInfoTableBox.getBoundingClientRect().height;
	totalInfoTableBox.style.width = 0;
	totalInfoTableBox.style.height = 0;
	var isFirst = true;
	var totalInfoShowSpeed = 0.2;
	TS = null;
	$('#totalInfoLink').on('click',function(){
		var totalInfoTableBox = document.getElementById("totalInfoTableBox");
		if(totalInfoIsClose){
//			totalInfoTableBox.style.display = "block";
			clearInterval(TS);
			TS = setInterval(toSize,10,totalInfoTableBox,fullWidth,fullHeight,totalInfoShowSpeed);
			
			totalInfoLink.style.backgroundColor="#000";
			totalInfoLink.style.color = "#fff";
		}
		else{
//			totalInfoTableBox.style.display = "none";
			clearInterval(TS);
			TS = setInterval(toSize,10,totalInfoTableBox,0,0,totalInfoShowSpeed);
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
		TS = setInterval(toSize,10,totalInfoTableBox,fullWidth,fullHeight,totalInfoShowSpeed);
	}

	totalInfoLink.onmouseleave = function(){
		if(!totalInfoIsClose)return;		/*展开状态就不做关闭动画*/
		clearInterval(TS);
		TS = setInterval(toSize,10,totalInfoTableBox,0,0,totalInfoShowSpeed);
	}
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
(function(){
	var addData = document.getElementsByClassName("addData")[0];
	if(addData!=null)
		addData.onclick = function(){
			initDateInput();
			document.getElementById("addBox").style.display = "block";
		}
})();

var closeAddBox = function(){
	var addTbody = $('#add-tbody');
	var lines = addTbody.children();
	console.log(lines.length);
	for(var i = 0;i < lines.length-1;i++){
		lines[i].remove();
	}
	$('#addBox .dataInput').val("");
}
var addBox = document.getElementById("addBox");
addBox.getElementsByClassName("close")[0].onclick = closeAddBox;
addBox.getElementsByClassName("close")[1].onclick = closeAddBox;
$('#addBox .submit').click(function(){
	addAjax(tableName,getAddDatas());
	closeAddBox();
});

//编辑数据功能

function addDataTableEvent(){
	//添加编辑按钮事件
	var closeEditBox = function(){
		$('#editBox .dataInput').val("");
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
	$('#editBox .submit').onclick = function(){
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
	var $colname = $('.datatable .colname-text');
//	console.log("默认隐藏的列:");
//	console.log(hiddenCols);
	for(var i = $colname.length-1;i >= 0;i--){
		if($.inArray($colname.eq(i).text(),hiddenCols)!=-1){
			showColMenu_cheb[i].click();
		}
	}

})();

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
			//排序规则：按队列容器排，如果点击已存在队列的列，则只改变该列排序方向不改变所在队列位置。
/*			var tmp = new Array();
			for(var i = 0;i < signsort.length;i++)
				if(signsort[i]==this)continue;
				else tmp.push(signsort[i]);
			tmp.push(this);*/
			
			//排序规则：同一时刻只能按一列排
			var $sortSigns = $('.sortSign');
			for(var i = 0;i < sortSigns.length;i++){		//复原其他列的排序符号
				if(sortSigns[i] != this){
					$sortSigns.eq(i).removeClass('sort-down sort-up');
					$sortSigns.eq(i).html('&#xe660;');
				}
			}
			var tmp = new Array();
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
var screen_colIdx;			//当前打开的筛选菜单的列下标
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
}
//关闭提示
function closeScreenReminder(colIdx){
	$('.colscreen-td').eq(colIdx).children('.colscreen').removeClass('filtered');
	$('.colscreen-td').eq(colIdx).children().children('.text').html("&#xe83b;");
}
//隐藏与展开筛选下拉框
function closeColscreenDropdown(){
	console.log("关闭:"+screen_colIdx);
	colscreen_dropdowns[screen_colIdx].style.display = "none";
	CSDIsCloses[screen_colIdx] = true;
	recoveryColValue.recover();		//如果没有提交筛选条件的修改，就恢复
	$(".colscreen").eq(screen_colIdx).css("animation","none");
}
function openColscreenDropdown(idx){
	screen_colIdx = idx;
	for(var i = 0;i < CSDIsCloses.length;i++){
		CSDIsCloses[i] = true;
	}
	CSDIsCloses[idx] = false;
	for(var i = 0;i < colscreen_dropdowns.length;i++)
		colscreen_dropdowns[i].style.display = "none";
	colscreen_dropdowns[idx].style.display = "block";
	var left = document.documentElement.clientWidth;
}
function turnColscreenDropdown(){
	if(event.target!=this&&event.target!=this.getElementsByClassName('text')[0])return;
	$this = $(this);
	if($this.children('.colscreen-dropdown').css('display')=='none')
		openColscreenDropdown(this.index);
	else
		closeColscreenDropdown();
	$('.colscreen-td').trigger("mouseleave");
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
	colscreens[i].onclick = turnColscreenDropdown;
}
$('.colscreen-td').on("mouseenter",function(){
	$this = $(this);
	var $colscreen = $this.find(".colscreen");
	if($colscreen.hasClass("filtered")==false){
		$colscreen.css("animation","colscreen 0.3s")
		.css("animation-fill-mode","forwards");
	}
});
$('.colscreen-td').on("mouseleave",function(){
	//如果离开时，该下拉框是打开状态就不隐藏
	if(CSDIsCloses[this.getElementsByClassName("colscreen")[0].index]==false)return;
	$this = $(this);
	$this.find(".colscreen").css("animation","none");
});
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
}
//提交值筛选
$('.valuescreen-all-submit').on('click',function(){
	recoveryColValue.valueIsSubmit = true;
	var str = "";
	var reminder = "";
	document.getElementsByClassName("colscreen-dropdown")[screen_colIdx].style.display="none";
	/*可优化选项：选中的少就提交选中的给后台，选中的多就提交没选中的给后台*/

	//如果勾了全选且搜索框为空就不进行查询
	if(!($('.valuescreen-all-checkbox').eq(screen_colIdx).prop('checked')==true
			&&$('.colValueSearch-text').eq(screen_colIdx).val().length==0)){
		str = "&value ";		//告诉后台，按值筛选
		var chebs = document.getElementsByClassName('valuescreen-all-checkbox-box-list')[screen_colIdx].
			getElementsByClassName('cheb');
		var items = document.getElementsByClassName('valuescreen-all-checkbox-box-list')[screen_colIdx].
			getElementsByClassName('item');
		var texts = document.getElementsByClassName('valuescreen-all-checkbox-box-list')[screen_colIdx].
			getElementsByClassName('text');
		for(var i = 0;i < chebs.length;i++){
			//只有满足筛选且勾选了的选项就显示
			if(chebs[i].checked==true&&items[i].style.display!="none"){
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
$('.colValueSearch-text').on('keydown',function(ev){
	if(ev.keyCode == 13){
		console.log("按下回车");
		$('.valuescreen-all-submit').eq(screen_colIdx).trigger("click");
	}
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
	if(num.length==0){
		alert("筛选条件不能为空!");
		return;
	}
	num = putNum($('.numscreen-val').eq(screen_colIdx));
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
function exportDataClick(){
	$('.export-setBox').css('display',"block");
}
$('.table-top #dataCheckedMenu-dropdown .exportData').on('click',function(){
	$('.table-top .fl #dataCheckedMenu-dropdown .dropdownLink').trigger("click");		//关闭
	exportDataClick();
});
$('.table-top .fr .exportData').on('click',exportDataClick);

//导入按钮事件
$('.table-top .importData').on('click',function(){
	$('.import-chooseFileBox').css('display',"block");
});

//打印按钮事件
$('.table-top .printingData').on("click",function(){
	setPrintingInfo();
	$('.printing-setBox').css('display',"block");
});

//dialog基础事件

$('.dialog .submit').on('click',function(){
	$this = $(this);
	$this.closest(".dialog").css("display","none");
});
$('.dialog .close').on('click',function(){
	$this = $(this);
	$this.closest(".dialog").css("display","none");
});

//更新统计信息按钮事件
$('.totalInfo-box .table-box .totalInfo-menu .updateTotalInfoBT').on('click',function(){
	refreshTotalInfoAjax(tableName);
});

//限制输入函数
//只能输入数字和小数点
function putNum($this){
	$this.val( $this.val().replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'') );
	return $this.val();
}

//键入数值筛选事件（有些不支持number input，还是需要做下检测）
$('.numscreen-val').keyup(function(){
	$this = $(this);
	putNum($this);
});


//带有提示输入的输入框 事件


function setWithValueListEvent(){
	var chooseLi;
	
	$('.dialog .withValueList').on('focus',function(){
		$this = $(this);
		chooseLi = new ChooseLi($this.siblings('.getValue-box'),$this.siblings('.getValue-box').find(' .item'),$this);
		$this.siblings('.getValue-box').css("display","block");
		var $list = $this.siblings('.getValue-box').find(".list");
		var $vals = $list.find(".val");
		var maxWidth = 0;
		for(var i = 0;i < $vals.length;i++){
			maxWidth = $vals.eq(i).outerWidth()>maxWidth?$vals.eq(i).outerWidth():maxWidth;
		}
		$list.width(maxWidth);
	});
	function withValueListBlur(_this){
		var $this = $(_this);
		console.log("blur");
		$this.siblings('.getValue-box').css("display","none");
		if(chooseLi!=null){
			chooseLi.destroy();
			chooseLi = null;
		}
	}
	$('.dialog .withValueList').on('blur',function(){
		var $this = $(this);
		console.log("blur");
		$this.siblings('.getValue-box').css("display","none");
		if(chooseLi!=null){
			chooseLi.destroy();
			chooseLi = null;
		}
	});
	$('.dialog .getValue-box .item').on("mousedown",function(){
		console.log("mousedown");
		$this = $(this);
		$this.parents('.getValue-box').siblings('.withValueList').val($this.find(".val").text());
	});
	$('.dialog .withValueList').on('keydown',function(ev){
		if(chooseLi!=null)chooseLi.keydown(ev);
		if(ev.keyCode==13){
			chooseLi = null;
			$this = $(this);
			$this.trigger("blur");
		}
	});
	$('.dialog .withValueList').bind('input propertychange',function(){
		$this = $(this);
		chooseLi.matchValue();
	})
}
function ChooseLi($listBox,$lis,$input){
	this.$listBox = $listBox;
	this.index = -1;			//在所有li中的下标
	this.showIndex = -1;		//在显示的li中的下标
	this.$items = $lis;
	this.itemsLen = this.$items.length;
	this.showLen = this.$items.length;
	this.$input = $input;
	
	this.setItemsColor = function(){
		for(var i = 0;i < this.$items.length;i++){
			if(i==this.index)
				this.$items.eq(i).addClass('keySelected');
			else
				this.$items.eq(i).removeClass('keySelected');
		}
	}
	this.changeIndex = function(move){
		if(this.showLen==0){
			this.index = -1;
			this.showIndex = -1;
			return;
		}
		//设置showIndex
		this.showIndex = this.showIndex+move;
		if(this.showIndex<0)this.showIndex = this.showLen-1;
		if(this.showIndex>=this.showLen)this.showIndex = 0;
		//设置index
		do{
			this.index = this.index+move;
			if(this.index<0)this.index = this.itemsLen-1;
			if(this.index>=this.itemsLen)this.index = 0;
		}while(this.$items.eq(this.index).hasClass('show')==false);
		console.log("index:"+this.index+",showIndex:"+this.showIndex);
	}
	this.move = function(move){
		this.changeIndex(move);
		this.setItemsColor();
		this.setScrollTop_auto();
	}
	this.keydown = function(ev){
		switch(ev.keyCode){
			case 13:
				$input.val(this.$items.eq(this.index).find('.val').text());
				this.destroy();
				return;
			case 38:this.move(-1);break;		//上键
			case 40:this.move(1);break;		//下键
		}
		
	}
	//结束，还原
	this.destroy = function(){
		for(var i = 0;i < this.$items.length;i++){
			this.$items.eq(i).removeClass('keySelected');
			this.$items.eq(i).addClass('show');
		}
	}
	//并不是直接把index设置为i,而是把index设为显示的item中第i个的index
	this.toIndex = function(i){
		this.index = -1;
		this.showIndex = -1;
		this.changeIndex(1);
		for(var t = 0;t < i;t--)
			this.changeIndex(1);
		this.setItemsColor();
	}
	//input值改变，只显示值正则匹配的items
	this.matchValue = function(){
		var val = this.$input.val();
		console.log("匹配值:"+val);
		var reg = eval("/[\\s\\S]*" + val.replace(/ /g,"[\\s\\S]*") + "[\\s\\S]*/i");
		this.showLen = 0;
		for(var i = 0;i < this.itemsLen;i++){
			var itemStr = this.$items.eq(i).find('.val').text();
			if(reg.exec(itemStr)){
				this.$items.eq(i).addClass("show");
				this.showLen++;
			}
			else{
				this.$items.eq(i).removeClass("show");
			}
			if(i == this.index){
				this.showIndex = this.showLen-1;
			}
		}
		this.toIndex(0);
		this.$listBox.scrollTop(0);
	}
	this.setScrollTop_auto = function(){
		if(this.showLen==0)return;
		let boxHeight = this.$listBox.height();
		let itemHeight = this.$items.eq(this.index).height();
		var boxShowSum = boxHeight/itemHeight;
		console.log("boxHeight:"+boxHeight+",itemHeight:"+itemHeight+",boxShowSum:"+boxShowSum+",showIndex:"+this.showIndex);
		var scrollTop = (this.showIndex-Math.floor(boxShowSum/2))*itemHeight;
		if(scrollTop<0)scrollTop = 0;
		this.$listBox.scrollTop(scrollTop);
		console.log("boxScrollTop="+this.$listBox.scrollTop());
	}
}
$('.colscreen-td .submit').on("click",function(){
	closeColscreenDropdown();
});

//提交打印事件
$('.printing-setBox .box-foot .submit').on('click',function(){
	var title = $('.printing-setBox .box-body .title').val();
	var colNames = getPrintingColNames();
	var haveTotalInfo = $('.printing-setBox .box-body .haveTotalInfo').prop("checked");
	var haveBorder = $('.printing-setBox .box-body .haveBorder').prop("checked");
	var putRowFamily = $('.printing-setBox .box-body .printingRow-td input[name="put-row"]:checked').val();
	var printingDataCount;
	printingAjax(tableName,title,colNames,haveTotalInfo,haveBorder,putRowFamily);
	
});

//切换打印行类别
$(".put-row").on('change',function(){
	var $this = $(this);
	if($this.val()=='custom')
		$this.parent().siblings('.customBox').css('display','block');
	else
		$this.parent().siblings('.customBox').css('display','none');
});

//导出事件
$('.export-setBox .box-foot .submit').on('click',function(){
	var putRowFamily = $('.export-setBox .box-body .putRow-td .put-row:checked').val();
	exportAjax(tableName,putRowFamily);
});