
function haveDataChecked(){
	var haveChecked = false;
	var $dataChebs = $('.datatable .row .dataCheb');
	for(var i = 0;i < $dataChebs.length;i++){
		if($dataChebs.eq(i).prop("checked")==true){
			haveChecked = true;
			break;
		}
	}
	if(haveChecked==false){
		alert("请至少勾选一条数据");
	}
	return haveChecked;
}

//设置打印设置面板信息
function setPrintingInfo(){
	$('.printing-setBox .title').val($('.tablename').text());
	
	//初始化显示列
	var $colNames = $('.datatable .colname-text');
	var $printingColTemp = $('<div class="dataBox printingCol-box"><input type="checkbox" checked class="cheb" /><span class="text">统计信息</span></div>');
	var $printingColTd = $('.printing-setBox .printingCol-td');
	$printingColTd.empty();
	for(var i = 0;i < $colNames.length;i++){
		var $printingCol = $printingColTemp.clone(true);
		$printingCol.find('.text').text($colNames.eq(i).text());
		//如果hiddenCols数组中有该列，则该列默认不显示
		if($.inArray($colNames.eq(i).text(),hiddenCols)>=0){
			$printingCol.find('.cheb').prop('checked',false);
		}
		$printingColTd.append($printingCol);
	}
	//初始化打印列
	$('.printing-setBox .box-body .table .customBox .rowNum').val(dataCount>=pageDataCount?pageDataCount:dataCount);
	$('.printing-setBox .box-body .table .customBox .reminder').text('共有'+dataCount+"条数据");
}

/*
//获取所有显示的列名(数组)
function getCheckedColNames(){
	var colNames = new Array();
	var $items = $('.table-top #showColMenu-dropdown .dropdown-content .droplist .dropitem');
	for(var i = 0;i < $items.length;i++){
		if($items.eq(i).find('.cheb').prop('checked')==true){
			colNames.push($items.eq(i).find('.text').text());
		}
	}
	return colNames;
}*/

//获取需要打印的列名数组
function getPrintingColNames(){
	var colNames = new Array();
	var $items = $('.printing-setBox .table .printingCol-box ');
	for(var i = 0;i < $items.length;i++){
		if($items.eq(i).find('.cheb').prop('checked')==true){
			colNames.push($items.eq(i).find('.text').text());
		}
	}
	return colNames;
}

//隐藏|显示列
function hiddenCol(){
	var $colnames = $('.datatable .colname-text');
	var $chebs = $('#showColMenu-dropdown .droplist .cheb');
	var trs = document.getElementsByClassName("datatable")[0].getElementsByClassName('hidTrs');
	for(var i = $colnames.length-1;i >= 0;i--){
		var isShow = true;		//当前列是否显示
		if($.inArray($colnames.eq(i).text(),hiddenCols)!=-1)
			isShow = false;
		for(var j = 0;j < trs.length;j++){
			if(trs[j]!=null)
				trs[j].children[i+1].style.display = isShow?"table-cell":"none";
		}
	}
}

//隐藏|显示打印列
function hiddenPrintingCol(showColNames){
	var $colNames = $('.datatable .colname-text');
	var datatableP = document.getElementsByClassName('datatable-printing')[0];
	var trsP = datatableP.getElementsByClassName('hidTrs');
	for(var i = $colNames.length-1;i >= 0;i--){
		var isShow = true;		//当前列是否显示
		if($.inArray($colNames.eq(i).text(),showColNames)==-1)
			isShow = false;
		for(var j = 0;j < trsP.length;j++){
			trsP[j].children[i].style.display = isShow?"table-cell":"none";
		}
	}
}

//获取数据行模板
function getDataRowTemp(colSum,haveBT=true){
	var $row = $('<tr class="row hidTrs"></tr>');
	if(haveBT)
		$row.append($('<th class="hor"><input type="checkbox" checked class="dataCheb" /></th>'));
	for(var i = 0; i < colSum;i++)
		$row.append($('<th class="hor val"></th>'));
	if(haveBT)
		$row.append($('<th class="hor iconfont sep-hor"><a href="javascript:;" class="editData" style="font-size:1.3rem;">&#xe612;</a>&emsp;<a href="javascript:;" class="delData" onclick="delData(this)" style="font-size:1rem;">&#xe78d;</a></th>'));
	
	return $row;
}
//获取筛选后的信息
function getScreenInfo(){
	var screenInfo = new Array();
	screenInfo.push("orderItems");
	screenInfo = screenInfo.concat(getSortTypes());
	screenInfo.push("colValueItems");
	screenInfo = screenInfo.concat(colValuescreen);
	return screenInfo;
}
//获取勾选+筛选后选出的信息
function getTickScreenInfo(){
	var screenInfo = new Array();
	//按照排序顺序导出
	screenInfo.push("orderItems");
	screenInfo = screenInfo.concat(getSortTypes());
	screenInfo.push("colValueItems");
	//如果没有勾选全部页,则只导出当前页勾选了的数据
	if($('.datatable .replenishDataCheb-th .replenishDataCheb').prop("checked")==false){
		var myColValuescreen = new Array();		//筛选条件
		for(var i = 0;i < colSum;i++)
			myColValuescreen[i] = "";
		var $dataChebs = $('.datatable .row .dataCheb');
		myColValuescreen[0] = "&value ";
		for(var i = 0;i < $dataChebs.length;i++)
			if($dataChebs.eq(i).prop("checked")==true)
				myColValuescreen[0] += "'"+$dataChebs.eq(i).val()+"'" + ",";
		screenInfo = screenInfo.concat(myColValuescreen);
	}
	else		//否则直接根据筛选条件导出符合的所有数据
		screenInfo = screenInfo.concat(colValuescreen);
	return screenInfo;
}