<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="com.itheima.model.GeneralLedger"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath %>">
	<meta charset="utf-8" />
		<title>ERPDemo</title>
		<link rel="stylesheet" href="css/style.css" />
		<link rel="stylesheet" href="css/left-nav.css" />
		<link rel="stylesheet" href="css/util.css" />
		<link rel="stylesheet" href="css/datatable.css" />
		<link rel="stylesheet" href="css/curd.css" />
		<style>
			.totalInfo .hor{
				width:90px;
			}
			.totalInfo-box  .title-tr{
				color:rgba(0,0,0,.65);
			}
			.totalInfo-box  .row{
				color:rgba(255,255,255,1);
			}
			/*.totalInfo-box  .row:hover:not(.title-tr) .val{
				background-color: #ddd;
			}*/
			.tinfo-1{
				background-color: #FF6666;
			}
			.tinfo-2{
				background-color: #FF0000;
			}
			.tinfo-3{
				background-color: #008000;
			}
			.tinfo-4{
				background-color: #6666cc;
			}
			/*.tinfo-1,.tinfo-2,.tinfo-3,.tinfo-4,.tinfo-5,.tinfo-6,.tinfo-7{}*/
		</style>
	</head>
	<body>
		<div class="left-nav">
			<!-- head -->
			<div class="title borb">
				<div class="icon iconfont">
					<img src="img/AdminLTELogo.png"/>
				</div>
				<span class="text">ERP</span>
			</div>
			<!-- 用户信息 -->
			<div class="user borb">
				<div class="user-imgdiv icon">
					<img src="img/userImg.png" /> 
				</div>
				<span class="text"><a href="">Alexander Pierce</a></span>
			</div>
			<!-- 导航 -->
			<ul class="nav-list">
				<!-- 业务表导航 -->
				<li class="nav-item">
					<div class="nav-head borb">
						<div class="text-icon head-icon icon"><span class="icon-text">物</span></div>
						<span class="text">物控管理</span>
					</div>
					<ul class="select-list">
						
						<li class="menu active">
							<a href="javascript:;" class="select-a  fa open">
								<div class="text-icon icon"><span class="icon-text">成</span></div>
								<span class="select-text text">成品库存标准及库存动态</span>
								<div class="menu-sign"><</div>
							</a>
							
							<ul class="subsublist">
								
								<li class="subsubitem">
									<a href="OrdersAndJournalCT/limitQuery" class="select-a ">
										<div class="text-icon icon"><span class="icon-text">订</span></div>
										<span class="select-text text">订单+流水账</span>
									</a>
								</li>
								
								<li class="subsubitem">
									<a href="GeneralLedgerCT/limitQuery" class="select-a  selected">
										<div class="text-icon icon"><span class="icon-text">动</span></div>
										<span class="select-text text">动态总账</span>
									</a>
								</li>
								
							</ul>
							
						</li>
						
						<li class="menu">
							<a href="javascript:;" class="select-a  fa">
								<div class="text-icon icon"><span class="icon-text">零</span></div>
								<span class="select-text text">零部件库存标准及库存动态</span>
								<div class="menu-sign"><</div>
							</a>
							
							<ul class="subsublist">
								
								<li class="subsubitem">
									<a href="view/MaterialControl-partsInventory.jsp" class="select-a ">
										<div class="text-icon icon"><span class="icon-text">零</span></div>
										<span class="select-text text">零件库存台账</span>
									</a>
								</li>
								
								<li class="subsubitem">
									<a href="view/MaterialControl-blanksAndRawMaterials.jsp" class="select-a ">
										<div class="text-icon icon"><span class="icon-text">毛</span></div>
										<span class="select-text text">毛坯/原材料库存台账</span>
									</a>
								</li>
								
								<li class="subsubitem">
									<a href="view/MaterialControl-packingMaterial.jsp" class="select-a ">
										<div class="text-icon icon"><span class="icon-text">包</span></div>
										<span class="select-text text">包材库存台账</span>
									</a>
								</li>
								
							</ul>
							
						</li>
						
						<li class="select-item">
							<a href="view/MaterialControl-matchingIngredients.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">《</span></div>
								<span class="select-text text">《配套配料/发料计划》管理</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/MaterialControl-materialPurchase.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">《</span></div>
								<span class="select-text text">《物料采购跟催预警管理》</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/MaterialControl-supplierServices.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">《</span></div>
								<span class="select-text text">《供应商服务能力考核评价》</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/MaterialControl-materialPurchaseAndBatch.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">《</span></div>
								<span class="select-text text">《物料采购周期/批次标准》</span>
								
							</a>
							
						</li>
						
					</ul>
			<div class="select">
			</div>
			
			<div class="icon iconfont"></div>
		</div>
		<div class="body">
			<div class="head">
				<div class="head-left">
					<ul class="head-list">
						<li class="head-item iconfont" id="close-left-nav"><a href="javascript:;">&#xe606;</a></li>
						<li class="head-item tablelink"><a href="index.html">主页</a></li>
                        
						<li class="head-item tablelink">
							<a class="mainlink" href="view/Basic-PMC.jsp">基础信息管理</a>
							<div class="dropdown-content">
								<ul class="droplist">
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Basic-PMC.jsp">PMC系统人员考核信息</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Basic-product.jsp">产品名称标准信息</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Basic-customer.jsp">客户信息库（含分级标准）</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Basic-supplier.jsp">供应商信息库</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Basic-department.jsp">部门基本组织架构</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Basic-user.jsp">用户权限管理</a>
									</li>
                                    
								</ul>
							</div>
						</li>
                        
						<li class="head-item tablelink">
							<a class="mainlink" href="view/ProductionPlan-weeklyScheduling.jsp">生产计划管理</a>
							<div class="dropdown-content">
								<ul class="droplist">
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionPlan-weeklyScheduling.jsp">生产主计划周滚动排程</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionPlan-BOMAndERP.jsp">BOM库&ERP运算</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionPlan-purchase.jsp">《采购需求计划及进度》</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionPlan-metalworking.jsp">《金工生产计划排程》</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionPlan-injectionMolding.jsp">《注塑生产计划排程》</a>
									</li>
                                    
								</ul>
							</div>
						</li>
                        
						<li class="head-item tablelink">
							<a class="mainlink" href="view/MaterialControl-ordersAndJournal.jsp">物控管理</a>
							<div class="dropdown-content">
								<ul class="droplist">
                                    
									<li class="dropitem">
										<a class="droplink" href="view/MaterialControl-ordersAndJournal.jsp">成品库存标准及库存动态</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/MaterialControl-partsInventory.jsp">零部件库存标准及库存动态</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/MaterialControl-matchingIngredients.jsp">《配套配料/发料计划》管理</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/MaterialControl-materialPurchase.jsp">《物料采购跟催预警管理》</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/MaterialControl-supplierServices.jsp">《供应商服务能力考核评价》</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/MaterialControl-materialPurchaseAndBatch.jsp">《物料采购周期/批次标准》</a>
									</li>
                                    
								</ul>
							</div>
						</li>
                        
						<li class="head-item tablelink">
							<a class="mainlink" href="view/ProductionScheduling-metalworkingDaily.jsp">生产排程管理</a>
							<div class="dropdown-content">
								<ul class="droplist">
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionScheduling-metalworkingDaily.jsp">金工生产计划进度/日报</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionScheduling-injectionMoldingDaily.jsp">注塑生产计划进度/日报</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionScheduling-stampingDaily.jsp">冲压生产计划进度/日报</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionScheduling-rotorDaily.jsp">《转子部装计划进度/日报》</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionScheduling-statorDaily.jsp">《定子部装计划进度/日报》</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionScheduling-finalAssemblyDaily.jsp">《总装计划进度/日报》</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/ProductionScheduling-process.jsp">《制程工序瓶颈分析改进》</a>
									</li>
                                    
								</ul>
							</div>
						</li>
                        
						<li class="head-item tablelink">
							<a class="mainlink" href="view/Analysis-orderBigData.jsp">分析决策</a>
							<div class="dropdown-content">
								<ul class="droplist">
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Analysis-orderBigData.jsp">订单大数据分析</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Analysis-partsConsumption.jsp">零件用量需求大数据分析</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Analysis-customerValue.jsp">客户价值趋势分析</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Analysis-manufacturing.jsp">生产制造能力改进分析</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Analysis-supplyChainImprovement.jsp">供应链改进需求分析</a>
									</li>
                                    
									<li class="dropitem">
										<a class="droplink" href="view/Analysis-productionImprovement.jsp">《生产改进计划》与执行管理</a>
									</li>
                                    
								</ul>
							</div>
						</li>
                        
<!--foot-->
					</ul>
				</div>
				<div class="head-right">
					<ul class="head-list">
						<li class="head-item iconfont"><a href="">&#xe607;</a></li>
						<li class="head-item iconfont"><a href="">&#xe638;</a></li>
						<li class="head-item iconfont"><a href="" style="font-size:1.3rem;">&#xe624;</a></li>
						<form action="" class="search">
							<div class="search-group">
								<input type="search" placeholder="Search" class="search-text"/>
								<input type="submit" class="search-submit iconfont" value="&#xe618;"/>
							</div>
						</form>
					</ul>
				</div>
			</div>
			<div class="content">
				<div class="content-head">
					<div class="head-left">
						<h2>康明订单</h2>
					</div>
					<div class="head-right">
						<a href="index.html">Home</a>
						<span class="sep">/</span>
						<span>康明订单</span>
						<span class="sep">/</span>
						<span>订单+流水账</span>
					</div>
					<div class="totalInfo-box">
						<a class="dropdownLink" id="totalInfoLink" href="javascript:;">统计信息</a>
						<div class="table-box" id="totalInfoTableBox">
							<table class="totalInfo">
								<tr class="row">
									<th class="hor val tinfo-1" colspan="1">开始运行日期</th>
									<th class="hor val tinfo-1 startData" colspan="1">${totalInfo.startData }</th>
									<th class="hor val tinfo-1" colspan="1">运行天数</th>
									<th class="hor val tinfo-1 startDay" colspan="1">${totalInfo.startDay }</th>
									<th class="hor val tinfo-2" colspan="1">无订单款数</th>
									<th class="hor val tinfo-2 noOrderAmount" colspan="1">${totalInfo.noOrderAmount }</th>
									<th class="hor val tinfo-2" colspan="1">无订单库存</th>
									<th class="hor val tinfo-2 noOrderInventory" colspan="1">${totalInfo.noOrderInventory }</th>
									<th class="hor val tinfo-2" colspan="1">错误数据项</th>
									<th class="hor val tinfo-2 errorDataItem" colspan="1">${totalInfo.errorDataItem }</th>
									<th class="hor val tinfo-3" colspan="2">总结存数</th>
								</tr>
								<tr class="row title-tr">
									<th class="hor val tinfo-4" colspan="1">入库种数</th>
									<th class="hor val tinfo-4 warehousingSpecies" colspan="1">${totalInfo.warehousingSpecies }</th>
									<th class="hor val tinfo-4 " colspan="1">出库种数</th>
									<th class="hor val tinfo-4 outboundSpecies" colspan="1">${totalInfo.outboundSpecies }</th>
									<th class="hor val tinfo-4" colspan="1">订单总需求</th>
									<th class="hor val tinfo-4 totalOrderDemand" colspan="1">${totalInfo.totalOrderDemand }</th>
									<th class="hor val tinfo-4" colspan="1">缺货款数</th>
									<th class="hor val tinfo-4 lackOfLoans" colspan="1">${totalInfo.lackOfLoans }</th>
									<th class="hor val tinfo-4" colspan="1">缺货数量</th>
									<th class="hor val tinfo-4 lackOfCreditNumber" colspan="1">${totalInfo.lackOfCreditNumber }</th>
									<th class="hor val tinfo-3 conclusionDepositNumber" colspan="2">${totalInfo.conclusionDepositNumber }</th>
								</tr>
								<tr class="row" >
									<th class="hor val tinfo-3" colspan="1">总款数</th>
									<th class="hor val tinfo-3 totalNumber" colspan="1">${totalInfo.totalNumber }</th>
									<th class="hor val tinfo-3" colspan="1">总入库数</th>
									<th class="hor val tinfo-3 totalNumberIncoming" colspan="1">${totalInfo.totalNumberIncoming }</th>
									<th class="hor val tinfo-3" colspan="1">实际出库数</th>
									<th class="hor val tinfo-3 actualNumberWarehouses" colspan="1">${totalInfo.actualNumberWarehouses }</th>
									<th class="hor val tinfo-3" colspan="1">备货预出库数</th>
									<th class="hor val tinfo-3 prepareQuantity" colspan="1">${totalInfo.prepareQuantity }</th>
									<th class="hor val tinfo-3" colspan="1">总入库频次数</th>
									<th class="hor val tinfo-3 totalStorageFrequency" colspan="1">${totalInfo.totalStorageFrequency }</th>
									<th class="hor val tinfo-3" colspan="1">总出库频次数</th>
									<th class="hor val tinfo-3 totalOutboundFrequency" colspan="1">${totalInfo.totalOutboundFrequency }</th>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<!-- 数据表格 -->
				<div class="content-body">
					<div class="table-top">
						<!--<div class="checkbox-menu">
							<input type="checkbox" name="" id="" value="" />
						</div>-->
						<div class="fl">
							<ul class="list">
								<li class="item dropdown" id="dataCheckedMenu-dropdown">
									<input type="checkbox" id="data-allCheb" />
									<a href="javascript:;" class="dropdownLink iconfont link">
										选中项&#xe63b;
									</a>
									<div class="dropdown-content">
										<ul class="droplist">
											<li class="dropitem"><a href="javascript:;" class="text">删除</a></li>
											<li class="dropitem"><a href="javascript:;" class="text exportData">导出</a></li>
										</ul>
									</div>
								</li>
								<li class="item dropdown" id="showColMenu-dropdown">
									<!-- 显示|隐藏列 -->
									<a href="javascript:;" class="dropdownLink iconfont link">隐藏列&#xe63b;</a>
									<div class="dropdown-content">
										<ul class="droplist">
											<li class="dropitem"><input class="cheb-all cur-poi" type="checkbox" checked="checked"/><span class="text">全选</span></li>
										</ul>
									</div>
								</li>
							</ul>
						</div>
						<div class="fr">
							<ul class="list">
								<li class="item"><a href="javascript:;"  class="importData iconfont link">&#xe648;&nbsp;导入数据</a></li>
								<li class="item"><a href="javascript:;"  class="exportData iconfont link">&#xe649;&nbsp;导出数据</a></li>
								<li class="item"><a href="javascript:;"  class="addData iconfont link">&#xe627;&nbsp;添加数据</a></li>
							</ul>
						</div>
						<div class="tablename">动态总账表</div>
					</div>
					<div class="table-box" id="data-table-box">
						<!-- 列筛选 -->
						<div class="colscreen-dropdown cur-def">
							<ul class="list">
								<li class="item datescreen-item">
									<span class="dropitem vec" >日期筛选<span class="fr">></span></span>
									<div class="sub-dropdown"></div>
								</li>
								<li class="item numscreen-item">
									<span class="dropitem vec" >
										数字筛选<span class="fr">></span>
										<div class="sub-dropdown">
											<select class="numscreen-select">
												<option value="=" selected>等于</option>
												<option value="!=">不等于</option>
												<option value=">">大于</option>
												<option value=">=">大于或等于</option>
												<option value="<">小于</option>
												<option value="<=">小于或等于</option>
											</select>
												<input type="text" οnkeyup="value=value.replace(/[^\d{1,}\.\d{1,}|\d{1,}]/g,'')" class="numscreen-val">		<!-- 只能接收数字、小数点、百分号 -->
												<input type="submit" class="numscreen-all-submit cur-poi"  value="确定"/>
											<div class="bottom"></div>
										</div>
									</span>

								</li>
								<li class="item valuescreen-item">
									<span class="dropitem vec" >
										值筛选<span class="fr">></span>
										<div class="sub-dropdown">
											<form action="javascript:;" class="search">
												<div class="search-group">
													<input type="search" placeholder="Search" class="search-text colValueSearch-text" />
													<input type="submit" class="search-submit colValueSearch iconfont cur-poi colValueSearch-submit" value="&#xe618;"/>
												</div>
											</form>
											<div class="valuescreen">
												<div class="valuescreen-all-checkbox-box"><input class="valuescreen-all-checkbox" class="cur-poi" type="checkbox" checked='true' />全选</div>
												<!-- <form action="" method="post"> -->
													<input type="button" class="valuescreen-all-submit cur-poi" value="确定"/>
													<ul class="list valuescreen-all-checkbox-box-list">

													</ul>
												<!-- </form> -->
											</div>
										</div>
									</span>
								</li>
								<li class="item cancelscreen-item">
									<a class="dropitem vec cancelscreen-link" >取消筛选</a>
								</li>
							</ul>
						</div>
						<input type="hidden" id="colSum" value="23"/>
						<input type="hidden" id="tableName" value="GeneralLedger"/>
						<table class="datatable long">
							<tr class="colname-tr">
								<th class="colname-th">选择
									<div class="menu">
										<span class=" iconfont" id="sort-cancel-all">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">序号</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text strCol">产品编号/名称</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text strCol hid">固定存放库位</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text strCol hid">产品分类</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text strCol hid">业务员</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text dateCol hid">盘点数据确认日期</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">订单总需求数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">入库累计数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">实际出库累计数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">当前可用库存数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">当前库存箱数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">需求匹配状态</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">备货数量</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">备货后可用库存数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol hid">19年标准库存</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">20年月均用量</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">月均单数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">订单张数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">入库频次</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">出库频次</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol hid">低于最低库存预警款数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol hid">高于最大库存总款数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th"><span class="colname-text numCol">建议投产数量</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th ">操作</th>
							</tr>
							<tr class="colscreen-tr" valign="top">
								<th class="replenishDataCheb-th">
									<input type="checkbox" class="replenishDataCheb">
									所有页
								</th>
								<th class="colscreen-td">
									<span class="colscreen iconfont"><span class="text">&#xe83b;</span></span>
								</th>
							</tr>
							<!-- 表格数据 -->
							<c:forEach items="${generalLedgers }" var="db" varStatus="idx">
								<tr class="row">
									<th class="hor"><input type="checkbox" class="dataCheb" value="${db.gl_id }"/></th>
									<th class="hor val">${db.gl_id }</th>
									<th class="hor val">${db.kmId }</th>
									<th class="hor val">${db.deposit }</th>
									<th class="hor val">${db.productClassification }</th>
									<th class="hor val">${db.salesMan }</th>
									<th class="hor val">${db.dataTime }</th>
									<th class="hor val">${db.orderNeedSum }</th>
									<th class="hor val">${db.storageSum }</th>
									<th class="hor val">${db.checkoutSum }</th>
									<th class="hor val">${db.stockSum }</th>
									<th class="hor val">${db.stockCaseSum }</th>
									<th class="hor val">${db.needStage }</th>
									<th class="hor val">${db.preExportNumber }</th>
									<th class="hor val">${db.availableNumber }</th>
									<th class="hor val">${db.beforeYear }</th>
									<th class="hor val">${db.averageMouth2020 }</th>
									<th class="hor val">${db.averageMouth }</th>
									<th class="hor val">${db.orderNumber }</th>
									<th class="hor val">${db.storageNumber }</th>
									<th class="hor val">${db.checkoutNumber }</th>
									<th class="hor val">${db.lowMiniNeed }</th>
									<th class="hor val">${db.outHighNeed }</th>
									<th class="hor val">${db.proposalNumber }</th>
									<th class="hor iconfont sep-hor">
										<a href="javascript:;" class="editData" name="${db.gl_id }" style="font-size:1.3rem;">&#xe612;</a>
										<!-- <a href="javascript:;" class="delData" name="${db.gl_id}" onclick="delData(this)" style="font-size:1rem;">&#xe78d;</a> -->
									</th>
								</tr>
							</c:forEach>
						</table>
					</div>
					<div class="pageLink-box">
						<input type="hidden" id="pageIdx" value="${pageIdx }"/>
						<input type="hidden" id="dataCount" value="${dataCount }"/>
						<input type="hidden" id="pageDataCount" value="${pageDataCount }"/>
						<!-- 数据页数导航条 -->
						<ul class="list">
						</ul>
					</div>
				</div>
			</div>
			<div class="foot">
				<span class="pull-right">xxxx系统&emsp;version: 1.3.4</span>
				<span class="pull-left">@2020 Copyright&emsp;<a class="link" href="http://www.beian.miit.gov.cn/">赣ICP备111111111号</a></span>
			</div>
		</div>

		<!--添加页面-->
		<div id="addBox">
			<div class="box-head">
				<span class="title">添加</span>
				<div class="fr">
					<a href="javascript:;" class="close" id="close-addBox">×</a>
				</div>
			</div>
			<div class="box-body">
				<div class="addTable-box">
					<table id="add-table">
						<thead>
						<tr class="colName-tr">
							<th class="colName">产品编号/名称</th>
							<th class="colName">固定存放库位</th>
							<th class="colName">产品分类</th>
							<th class="colName">业务员</th>
							<th class=""></th>
							<th class=""></th>
						</tr>
						</thead>
						<tbody id="add-tbody">
						<tr class="data-tr">
							<td class="data"><input type="text" name="" id="" class="dataInput kmId" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput deposit" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput productClassification" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput salesMan" value="" /></td>
							<td class="addBT-td"><input type="button" name=""  class="adBT" id="addBT" value="+" /></td>
							<td class="delBT-td"><input type="button" name=""  class="adBT" id="delBT" value="-" /></td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="box-foot">
				<ul class="footBT-list">
					<li class="footBT-item"><input type="button" class="footBT cur-poi" id="submit-addAll" value="批量添加" /></li>
					<li class="footBT-item"><input type="button" class="footBT cur-poi close" value="取消" /></li>
				</ul>
			</div>
		</div>

		<!--编辑页面-->
		<div id="editBox">
			<div class="box-head">
				<span class="title">编辑</span>
				<div class="fr">
					<a href="javascript:;" class="close">×</a>
				</div>
			</div>
			<div class="box-body">
				<div class="table-box">
					<table id="table">
						<tbody class="edit-tbody">
						<tr class="line">
							<td class="colName">序号：</td>
							<td class="data"><input type="text" name="" disabled id="" class="dataInput gl_id" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">产品编号：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput kmId" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">固定存放库位：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput deposit" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">产品分类：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput productClassification" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">业务员：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput salesMan" value="" /></td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
			<div class="box-foot">
				<ul class="footBT-list">
					<li class="footBT-item"><input type="button" class="footBT cur-poi" id="submit-edit" value="提交" /></li>
					<li class="footBT-item"><input type="button" class="footBT cur-poi close" value="取消" /></li>
				</ul>
			</div>
		</div>
		<div class="completeValBox">
	        <div class="cont">
	            <span class="text"></span>
	            <div class="iconfont close">×</div>
	        </div>
	    </div>
		<script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
		<script type="text/javascript">
			function getAddDatas(){
				var $dataTrs = $('#addBox .data-tr');
				var datas = new Array();
				for(var i = 0;i < $dataTrs.length;i++){
					var $data = $dataTrs.eq(i);		//单行数据
					datas[i] = {
							kmId:                    $data.find('.kmId').val(),
							deposit:                 $data.find('.deposit').val(),
							productClassification:   $data.find('.productClassification').val(),
							salesMan:                $data.find('.salesMan').val()
					};
				}
				return datas;
			}
			//将编辑后的数据封装进data中提交给ajax
			function getEditData(){
				var $editTbody = $('#editBox .edit-tbody');
				//接收时全部接收，修改哪些取决于后台mapper语句
				var data = {
						gl_id:              $editTbody.find(".gl_id").val(),
						kmId:               $editTbody.find(".kmId").val(),
						deposit:            $editTbody.find(".deposit").val(),
						productClassification:$editTbody.find(".productClassification").val(),
						salesMan:           $editTbody.find(".salesMan").val()
				};
				return data;
			}
			function refreshSuc(hash){
				console.log(hash);
				var datas = hash.generalLedgers;
				dataCount = hash.dataCount;
				pageIdx = hash.pageIdx;
				var totalInfo = hash.totalInfo;
				refreshDataPageLinks();
				var datatable = document.getElementsByClassName("datatable")[0];
				$('.datatable .row').remove();
				for(var i = 0;i < datas.length;i++){
					var $newRow = $dataRowTemp.clone(true);
					var $vals = $newRow.children('.val');
					$vals.eq(0).html(datas[i].gl_id);
					$vals.eq(1).html(datas[i].kmId);
					$vals.eq(2).html(datas[i].deposit);
					$vals.eq(3).html(datas[i].productClassification);
					$vals.eq(4).html(datas[i].salesMan);
					$vals.eq(5).html(datas[i].dataTime);
					$vals.eq(6).html(datas[i].orderNeedSum);
					$vals.eq(7).html(datas[i].storageSum);
					$vals.eq(8).html(datas[i].checkoutSum);
					$vals.eq(9).html(datas[i].stockSum);
					$vals.eq(10).html(datas[i].stockCaseSum);
					$vals.eq(11).html(datas[i].needStage);
					$vals.eq(12).html(datas[i].preExportNumber);
					$vals.eq(13).html(datas[i].availableNumber);
					$vals.eq(14).html(datas[i].beforeYear);
					$vals.eq(15).html(datas[i].averageMouth2020);
					$vals.eq(16).html(datas[i].averageMouth);
					$vals.eq(17).html(datas[i].orderNumber);
					$vals.eq(18).html(datas[i].storageNumber);
					$vals.eq(19).html(datas[i].checkoutNumber);
					$vals.eq(20).html(datas[i].lowMiniNeed);
					$vals.eq(21).html(datas[i].outHighNeed);
					$vals.eq(22).html(datas[i].proposalNumber);
					$newRow.find(".dataCheb").val(datas[i].gl_id);
					$newRow.find(".editData").attr("name",datas[i].gl_id);
					$newRow.find(".delData").attr("name",datas[i].gl_id);
					$newRow.find(".delData").remove();
					$('.datatable').append($newRow);
				}

				//填入统计信息
				if(totalInfo!=undefined&&totalInfo!=null){
					$('.startData').text(totalInfo.startData);
					$('.startDay').text(totalInfo.startDay);
					$('.noOrderAmount').text(totalInfo.noOrderAmount);
					$('.noOrderInventory').text(totalInfo.noOrderInventory);
					$('.errorDataItem').text(totalInfo.errorDataItem);
					$('.totalNumber').text(totalInfo.totalNumber);
					$('.totalNumberIncoming').text(totalInfo.totalNumberIncoming);
					$('.actualNumberWarehouses').text(totalInfo.actualNumberWarehouses);
					$('.prepareQuantity').text(totalInfo.prepareQuantity);
					$('.conclusionDepositNumber').text(totalInfo.conclusionDepositNumber);
					$('.totalStorageFrequency').text(totalInfo.totalStorageFrequency);
					$('.totalOutboundFrequency').text(totalInfo.totalOutboundFrequency);
					$('.warehousingSpecies').text(totalInfo.warehousingSpecies);
					$('.outboundSpecies').text(totalInfo.outboundSpecies);
					$('.totalOrderDemand').text(totalInfo.totalOrderDemand);
					$('.lackOfLoans').text(totalInfo.lackOfLoans);
					$('.lackOfCreditNumber').text(totalInfo.lackOfCreditNumber);
				}
			}
			function editSuc(data) {
				var $editTbody = $('#editBox .edit-tbody');
				$editTbody.find(".gl_id").val(data.gl_id);
				$editTbody.find(".kmId").val(data.kmId);
				$editTbody.find(".deposit").val(data.deposit);
				$editTbody.find(".productClassification").val(data.productClassification);
				$editTbody.find(".salesMan").val(data.salesMan);
				$editTbody.find(".dataTime").val(data.dataTime);
				$editTbody.find(".orderNeedSum").val(data.orderNeedSum);
				$editTbody.find(".storageSum").val(data.storageSum);
				$editTbody.find(".checkoutSum").val(data.checkoutSum);
				$editTbody.find(".stockSum").val(data.stockSum);
				$editTbody.find(".stockCaseSum").val(data.stockCaseSum);
				$editTbody.find(".needStage").val(data.needStage);
				$editTbody.find(".preExportNumber").val(data.preExportNumber);
				$editTbody.find(".availableNumber").val(data.availableNumber);
				$editTbody.find(".beforeYear").val(data.beforeYear);
				$editTbody.find(".averageMouth2020").val(data.averageMouth2020);
				$editTbody.find(".averageMouth").val(data.averageMouth);
				$editTbody.find(".orderNumber").val(data.orderNumber);
				$editTbody.find(".storageNumber").val(data.storageNumber);
				$editTbody.find(".checkoutNumber").val(data.checkoutNumber);
				$editTbody.find(".lowMimiNeed").val(data.lowMiniNeed);
				$editTbody.find(".outHighNeed").val(data.outHighNeed);
				$editTbody.find(".proposalNumber").val(data.proposalNumber);
			}
			//隐藏列表
			var hiddenCols = ['固定存放库位','产品分类','业务员','盘点数据确认日期','低于最低库存预警款数','高于最大库存总款数'];
		</script>
		<script src="js/init.js"></script>
		<script src="js/funcsOfAjax.js"></script>
		<script src="js/event.js"></script>
		<script charset="UTF-8" src="js/endInit.js"></script>
	</body>
</html>