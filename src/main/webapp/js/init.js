var title = "ERPDemo"
/*数据表初始化*/
//添加筛选按钮和筛选下拉框（并给筛选下拉框添加相应的类）
var $colscreen_tdTemp = $('.colscreen-td').clone(true);
$('.colscreen-td').remove();
var colSum = $('#colSum').attr("value");
var tableName = $('#tableName').attr("value");
var $colscreen_dropdownTemp = $('.colscreen-dropdown');
var $colname_texts = $('.colname-text');
for(var i = 0;i < colSum;i++){
    var $colscreen_td = $colscreen_tdTemp.clone(true);
    $colscreen_td.index = i;
    var $colscreen_dropdown = $colscreen_dropdownTemp.clone();
    //添加类，判断是否能按日期|数字|字符串筛选
    if($colname_texts.eq(i).hasClass('numCol')){		//如果该列是数值类型
    	$colscreen_dropdown.find('.list .datescreen-item .dropitem').addClass('disable');
    }
    else if($colname_texts.eq(i).hasClass('strCol')){		//如果该列是字符类型
    	$colscreen_dropdown.find('.list .datescreen-item .dropitem').addClass('disable');
    	$colscreen_dropdown.find('.list .numscreen-item .dropitem').addClass('disable');
    }
    else if($colname_texts.eq(i).hasClass('dateCol')){		//如果该列是日期类型
    	$colscreen_dropdown.find('.list .valuescreen-item .dropitem').addClass('disable');
    	$colscreen_dropdown.find('.list .numscreen-item .dropitem').addClass('disable');
    }
    var $colscreen = $colscreen_td.children(".colscreen");
    $colscreen.append($colscreen_dropdown);
    $('.colscreen-tr').append($colscreen_td);
}
$colscreen_dropdownTemp.remove();

//添加显示|隐藏列的选项
(function(){
	var $colname = $('.datatable .colname-text');
	var $itemTemp = $("<li class='dropitem'><input class='cheb cur-poi' type='checkbox' checked='checked'/><span class='text'>none</span></li>");
	var $list = $('#showColMenu-dropdown .droplist');
	for(var i = 0;i < $colname.length;i++){
		var $item = $itemTemp.clone();
		$item.children('.text').html($colname.eq(i).html());
		$list.append($item);
	}
})();



/*添加页数跳转导航*/

//分页信息
var pageIdx = parseInt($("#pageIdx").val());					//第几页 初始值		下标从0开始
var dataCount = parseInt($("#dataCount").val());				//共有多少行数据 初始值
var roundCount = 10;											//当前页周围链接个数
var pageDataCount = parseInt($("#pageDataCount").val());		//每页显示数量
console.log(pageIdx);
console.log(dataCount);
function appendItem(text,value,valueClassName = "val"){
	var $list = $('.pageLink-box .list');
	var $itemTemp = $('<li class="item"><span class="sp">null</span></li>');
	var $item = $itemTemp.clone(true);
	$item.children('.sp').html(text);
	$item.children('.sp').addClass(valueClassName);
	$item.children('.sp').val(value);
	if($item.children('.sp').hasClass('val'))$item.children('.sp').addClass('cur-poi');
	$list.append($item);
}

function refreshDataPageLinks(){
	$('.pageLink-box .list').empty();
	var maxPageIdx = Math.floor((dataCount-1)/pageDataCount);
	if(pageIdx!=0){appendItem("<",pageIdx-1,"val");}
	if(pageIdx-roundCount>0){
		appendItem(1,0,"val");
		appendItem("...",0,"other");
	}
	for(var i = (pageIdx-roundCount>0?pageIdx-roundCount:0);i <= pageIdx+roundCount && i <= maxPageIdx;i++){
		if(i==pageIdx)
			appendItem(i+1,i,"thisVal");
		else
			appendItem(i+1,i,"val");
	}
	if(pageIdx+roundCount<maxPageIdx){
		appendItem("...",0,"other");
		appendItem(maxPageIdx+1,maxPageIdx,"val");
	}
	if(pageIdx!=maxPageIdx){appendItem(">",pageIdx+1,"val");}
	//添加点击事件
	$('.pageLink-box .list .item .val').click(function(){
		$this = $(this);
		console.log("跳转到第"+$this.val()+"页");
		pageIdx = parseInt($this.val());		//访问后台后，如果筛选后页数小于它，会改为筛选后尾页
		refreshDataAjax();
	});
};
refreshDataPageLinks();

//设置添加页面位置和宽度(根据addBox中colname数量设置)
var $addBoxTemp;
function initAddBox(){
	var addColSum = $('#addBox .colName').length;
	var maxWidth = addColSum*150+2*31+40;
	maxWidth = maxWidth>1800?1800:maxWidth;		//最宽为1800px
	$('#addBox').width(maxWidth+"px");
	$('#addBox').css("margin-left",-1*maxWidth/2+"px");
	$('#addBox .box-body .addTable-box').width(maxWidth-20+"px");
	$('#add-table').width(maxWidth-45+"px");
	
	//添加事件
	var tbody = $("#add-tbody");
    var line = $("#add-tbody .data-tr");
    trNode = line.clone(true);
    tbody.on("click", " #addBT", function () {
    	//$('.addTable-box').scrollLeft(0);
    	var $trN = trNode.clone(true);
    	var dateInput = $trN.find('.dateInput')[0];
    	if(dateInput!=null)
    		dateInput.valueAsDate = new Date();
        tbody.append($trN);
        $trN.find('.data')[0].focus();
		getKmIdListAjax($trN.find('.getValue-box-kmid .list'));
    });

    tbody.on("click","#delBT",function () {
       var num = $("tr",tbody).length;
       if( num === 1){
           alert("最后一行不能删除");
           return false;
       }
       $(this).parent().parent().remove();
    });
   	$addBoxTemp = $('#addBox').clone(true);
}
initAddBox();

//日期类型input默认设为今天
function initDateInput(){
	var dateInputs = document.getElementsByClassName("dateInput");
	for(var i = 0;i < dateInputs.length;i++)
		dateInputs[i].valueAsDate = new Date();
}
initDateInput();

//修改第一个sortSign，默认按编号降序排序
(function initSortSign(){
	var $sortSigns = $('.sortSign');
	$sortSigns.eq(0).addClass("sort-down");
	$sortSigns.eq(0).html("&#xe738;");
})();

//初始化打印div的colname
function initPrintingTable(){
	var $colNameTexts = $('.datatable .colname-text');
	var $datatableP = $('.datatable-printing');
	var colNameTemp = $('<th class="colname-th hor "><span class="colname-text">colName</span></th>');
	var tr = $('<tr class="colname-tr hidTrs"></tr>');
	for(var i = 0;i < $colNameTexts.length;i++){
		var colName = colNameTemp.clone(true);
		colName.find('.colname-text').text($colNameTexts.eq(i).text());
		tr.append(colName);
	}
	$datatableP.append(tr);
}
initPrintingTable();