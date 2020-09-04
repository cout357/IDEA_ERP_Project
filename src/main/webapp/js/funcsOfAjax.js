
function getSortTypes(){
	var sortTypes = new Array();			//排序列符号
	for(var i = 0;i < signsort.length;i++){
		if(signsort[i].classList.contains('sort-up'))
			sortTypes.push(signsort[i].index + " " + 1);
		else if(signsort[i].classList.contains('sort-down'))
			sortTypes.push(signsort[i].index + " " + -1);
	}
	return sortTypes;
}


var $dataRowTemp = getDataRowTemp(colSum);
//根据排序信息和筛选信息重新查询数据
function refreshDataAjax(){
	var screenInfo = getScreenInfo();
	console.log(screenInfo);
	console.log(pageIdx);
	console.log(pageDataCount);
	$.ajax({
		type: "post",//注意不能用get
		dataType: 'json',
		url: tableName+"CT/completeQuery?pageIdx="+pageIdx+"&pageDataCount="+pageDataCount,
		contentType: 'application/json;charset=utf-8',//这个必须是这个格式
		data: JSON.stringify(screenInfo),//前台要封装成json格式
		traditional: true,
		success: function (hash) {
			refreshSuc(hash);
			addDataTableEvent();
			hiddenCol();
		}
	});
}

function valuescreenFindValuesAjax(tableName,colIdx){
	console.log("刷新列"+colIdx+"的值");
    $.ajax({
        type: "post",//注意不能用get
        dataType: 'json',
        url: tableName+"CT/dataColValues",
        data:{"colIdx":colIdx},
        contentType : "application/x-www-form-urlencoded; charset=UTF-8",
        success: function (colValues) {
        	console.log(colValues);
            var $colValueList = $('.valuescreen-all-checkbox-box-list');
            $colValueList.eq(colIdx).empty();
            var $itemTemp = $("<li class='item'><input class='cheb cur-poi' type='checkbox' checked='true' /><span class='text'></span></li>").clone(true);
           
            for(var i = 0;i < colValues.length;i++){
            	var $item = $itemTemp.clone();
            	$item.children(".text").html(colValues[i]);
            	$colValueList.eq(colIdx).append($item);
            }
        }
    });
}
//添加数据（向哪个表，要添加的数据数组存储1~n个对象，）
function addAjax(tabelName,datas){
	console.log("addDatas:");
	console.log(JSON.stringify(datas));
	$.ajax({
		type: "post",//注意不能用get
		dataType: 'json',
		url: tableName+"CT/add",
		contentType: 'application/json;charset=utf-8',//这个必须是这个格式
		data: JSON.stringify(datas),//前台要封装成json格式
		traditional: true,
		success: function (count) {
			console.log("成功添加"+count+"条数据");
			refreshDataAjax();
			refreshTotalInfoAjax(tableName);
		}
	});
}

//删除数据
function delAjax(tableName,ids){
	if($.isArray(ids)==false){
		var tmp = ids;
		ids = new Array();
		ids[0] = tmp;
	}
	$.ajax({
		type: "post",//注意不能用get
		dataType: 'json',
		url: tableName+"CT/del",
		contentType: 'application/json;charset=utf-8',//这个必须是这个格式
		data: JSON.stringify(ids),//前台要封装成json格式
		traditional: true,
		success: function (count) {
			console.log("成功删除"+count+"条数据");
			refreshDataAjax();
			refreshTotalInfoAjax(tableName);
		}
	});
}

//编辑数据
function getEditDataAjax(tableName,id){
	console.log("edit id:"+id);
	$.post(
		tableName+"CT/findById",
		{"id":id},
		function(data){
			console.log("要编辑的数据：");
			console.log(data);
			editSuc(data);
		}
	);
}
//提交编辑数据
function editDataAjax(tableName,data){
	console.log("编辑后的内容:");
	console.log(data);
	$.ajax({
		type: "post",//注意不能用get
		dataType: 'json',
		url: tableName+"CT/edit",
		contentType: 'application/json;charset=utf-8',//这个必须是这个格式
		data: JSON.stringify(data),//前台要封装成json格式
		traditional: true,
		success: function (isSuc) {
			if(isSuc==false){
				alert("更新失败！可能是数据已更新，请重试");
				refreshDataAjax();
			}
			else{
				refreshDataAjax();
				refreshTotalInfoAjax(tableName);
			}
		}
	});
}

function refreshTotalInfoAjax(tableName){
	console.log("刷新totalInfo");
	$.post(
		tableName+"CT/totalInfo",
		{},
		function(hash){
			console.log("刷新成功!");
			refreshTotalInfoSuc(hash);
		}
	);
}
//导出
function exportAjax(tableName,putRowFamily){
	var screenInfo;
	var putDataCount = pageDataCount;
	switch(putRowFamily){
		case "checked":screenInfo = getTickScreenInfo();break;
		case "all":screenInfo = getScreenInfo();putDataCount = dataCount;break;
		case "custom":screenInfo = getScreenInfo();
			putDataCount = $(".printing-setBox .box-body .table .printingRow-td .customBox .rowNum").val();break;
	}	
	console.log("导出信息:");
	console.log(screenInfo);
	$.ajax({
		type: "post",//注意不能用get
		dataType: 'json',
		url: tableName+"CT/export?putDataCount="+putDataCount,
		contentType: 'application/json;charset=utf-8',//这个必须是这个格式
		data: JSON.stringify(screenInfo),//前台要封装成json格式
		traditional: true,
		success: function (hash) {
			var url = hash.url;
			console.log("export-url:"+url);
			window.location.href=url;
		}
	});
}

//打印数据(表名，页眉标题，需要打印的列的列名)
function printingAjax(tableName,title,colNames,haveTotalInfo,haveBorder,putRowFamily){
	var screenInfo;
	var putDataCount = pageDataCount;
	switch(putRowFamily){
		case "checked":screenInfo = getTickScreenInfo();break;
		case "all":screenInfo = getScreenInfo();putDataCount = dataCount;break;
		case "custom":screenInfo = getScreenInfo();
			putDataCount = $(".printing-setBox .box-body .table .printingRow-td .customBox .rowNum").val();break;
	}	
	colNames.unshift("colNameItems");
	var infoPackage = colNames.concat(screenInfo);
	$.ajax({
		type: "post",//注意不能用get
		dataType: 'json',
		url: tableName+"CT/printing?title="+title+"&putDataCount="+putDataCount,
		contentType: 'application/json;charset=utf-8',//这个必须是这个格式
		data: JSON.stringify(infoPackage),//前台要封装成json格式
		traditional: true,
		success: function (hash) {
			refreshPrintingDataSuc(hash);
			hiddenPrintingCol(hash.colNames);
			if(haveBorder)
				$('.datatable-printing .hor').css('border',"2px solid #000");
			else
				$('.datatable-printing .hor').css('border',"none");
			$('.datatable-printing').print({
				prepend:(haveTotalInfo?$('.totalInfo'):null),
				title:title,
				stylesheet:"css/printing.css"
			});
			$('.datatable-printing').find("row").remove();
		}
	});
}