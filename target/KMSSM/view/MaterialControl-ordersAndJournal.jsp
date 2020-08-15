<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList"  %>
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
				background-color: #FF9933;
			}
			.tinfo-3{
				background-color:#3399CC;;
			}
			.tinfo-4{
				background-color: #669933;
			}
			.tinfo-5{
				background-color: red;
			}
			.tinfo-6{
				background-color: #CECE0F;
				/* background-color: #3399CC; */
			}
			.tinfo-7{
				background-color: #6666CC;
			}
			.tinfo-8{
				background-color:#FF9966;
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
									<a href="OrdersAndJournalCT/limitQuery" class="select-a  selected">
										<div class="text-icon icon"><span class="icon-text">订</span></div>
										<span class="select-text text">订单+流水账</span>
									</a>
								</li>
								
								<li class="subsubitem">
									<a href="GeneralLedgerCT/limitQuery" class="select-a ">
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
									<th class="hor val tinfo-1" colspan="1">仓管员</th>
									<th class="hor val tinfo-1" colspan="1">陈燕</th>
									<th class="hor val tinfo-1" colspan="1">运行天数</th>
									<th class="hor val tinfo-1 startDay" colspan="1">${totalInfo.startDay}</th>
									<th class="hor val tinfo-2" colspan="1">版本更新日期</th>
									<th class="hor val tinfo-2" colspan="1">4月10日</th>
									<th class="hor val tinfo-2" colspan="1">开始运行日期</th>
									<th class="hor val tinfo-2 startData" colspan="1">${totalInfo.startData}</th>
									<th class="hor val tinfo-5" colspan="1">库存填写报错</th>
									<th class="hor val tinfo-5 inventoryError" colspan="1">${totalInfo.inventoryError}</th>
									<th class="hor val tinfo-5" colspan="1">订单填写报错</th>
									<th class="hor val tinfo-5 orderError" colspan="1">${totalInfo.orderError}</th>
								</tr>
								<tr class="row title-tr">
									<th class="hor val tinfo-3" colspan="1">预出库数量</th>
									<th class="hor val tinfo-3 advanceDeliveryNumber" colspan="1">${totalInfo.advanceDeliveryNumber}</th>
									<th class="hor val tinfo-6" colspan="1">预警欠数未发单数</th>
									<th class="hor val tinfo-6 unitsWithoutEarlyWarningNumberIssued" colspan="1">${totalInfo.unitsWithoutEarlyWarningNumberIssued}</th>
									<th class="hor val tinfo-7" colspan="1">总订单需求数</th>
									<th class="hor val tinfo-7 sumOrderNeed" colspan="1">${totalInfo.sumOrderNeed}</th>
									<th class="hor val tinfo-7" colspan="1">总结库存数</th>
									<th class="hor val tinfo-7 storageNumber" colspan="1">${totalInfo.storageNumber}</th>
									<th class="hor val tinfo-4" colspan="1">拖期单数</th>
									<th class="hor val tinfo-4 tardinessSingular" colspan="1">${totalInfo.tardinessSingular}</th>
									<th class="hor val tinfo-8" colspan="1">发货出库数</th>
									<th class="hor val tinfo-8 sumDelivery" colspan="1">${totalInfo.sumDelivery}</th>
								</tr>
								<tr class="row" >
									<th class="hor val tinfo-3" colspan="1">预出库单数</th>
									<th class="hor val tinfo-3 advanceDeliverySingular" colspan="1">${totalInfo.advanceDeliverySingular}</th>
									<th class="hor val tinfo-6" colspan="1">涉及欠数单次</th>
									<th class="hor val tinfo-6 aUnitOfDebtIsInvolved" colspan="1">${totalInfo.aUnitOfDebtIsInvolved}</th>
									<th class="hor val tinfo-7" colspan="1">总入库数</th>
									<th class="hor val tinfo-7 totalNumberIncoming" colspan="1">${totalInfo.totalNumberIncoming}</th>
									<th class="hor val tinfo-7" colspan="1">总出库数</th>
									<th class="hor val tinfo-7 totalNumberOutbound" colspan="1">${totalInfo.totalNumberOutbound}</th>
									<th class="hor val tinfo-4" colspan="1">拖期数量</th>
									<th class="hor val tinfo-4 tardinessNumber" colspan="1">${totalInfo.tardinessNumber}</th>
									<th class="hor val tinfo-8" colspan="1">备货出库数</th>
									<th class="hor val tinfo-8 readyForDelivery" colspan="1">${totalInfo.readyForDelivery}</th>
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
						<div class="tablename">订单+流水账表</div>
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
												<input type="text"  class="numscreen-val"  />		<!-- 只能接收数字、小数点、百分号 -->
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
						<input type="hidden" id="colSum" value="24"/>
						<input type="hidden" id="tableName" value="OrdersAndJournal"/>
						<table class="datatable long">
							<tr class="colname-tr">
								<th class="colname-th">
									<span>选择</span>
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
								<th class="colname-th "><span class="colname-text numCol">月份</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">订单下达日期</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">订单编号</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">业务员</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">OE编号</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">康明编号</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">客户等级</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">客户名称</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">订单需求数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol hid">要求</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">交货日期</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">倒计时管理</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">成品入库数量</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">出库数量</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">预出库/备货</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">当前动态库存数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">可用量</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">订单匹配状态</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">欠数未发完</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">动态存放库位</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">卡板/箱</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">现有箱数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol hid">说明</span>
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
							<c:forEach items="${ordersAndJournals }" var="oaj" varStatus="idx">
								<tr class="row">
									<th class="hor"><input type="checkbox" class="dataCheb" value="${oaj.oaj_id }" /></th>
									<th class="hor val">${oaj.oaj_id }</th>
									<th class="hor val">${oaj.month }</th>
									<th class="hor val">${oaj.orderDate }</th>
									<th class="hor val">${oaj.orderId }</th>
									<th class="hor val">${oaj.salesMan }</th>
									<th class="hor val">${oaj.oeId }</th>
									<th class="hor val">${oaj.kmId }</th>
									<th class="hor val">${oaj.cusLevel }</th>
									<th class="hor val">${oaj.cusName }</th>
									<th class="hor val">${oaj.orderDemand }</th>
									<th class="hor val">${oaj.req }</th>
									<th class="hor val">${oaj.deliveryDate }</th>
									<th class="hor val">${oaj.countdown }</th>
									<th class="hor val">${oaj.storageQT }</th>
									<th class="hor val">${oaj.deliveryQT }</th>
									<th class="hor val">${oaj.preDate }</th>
									<th class="hor val">${oaj.inventory }</th>
									<th class="hor val">${oaj.availableQT }</th>
									<th class="hor val">${oaj.orderMatchingNum }</th>
									<th class="hor val">${oaj.underCount }</th>
									<th class="hor val">${oaj.dyLoc }</th>
									<th class="hor val">${oaj.box }</th>
									<th class="hor val">${oaj.boxNum }</th>
									<th class="hor val">${oaj.remarks }</th>
									<th class="hor iconfont sep-hor">
										<a href="javascript:;" class="editData sec" name="${oaj.oaj_id }" style="font-size:1.3rem;">&#xe612;</a>
										<a href="javascript:;" class="delData sec" name="${oaj.oaj_id }" onclick="delData(this)" style="font-size:1rem;">&#xe78d;</a>
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
		<div id="addBox" class="dialog">
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
							<th class="colName">订单下达日期</th>
							<th class="colName">订单编号</th>
							<th class="colName">业务员</th>
							<th class="colName">OE编号</th>
							<th class="colName">康明编号</th>
							<th class="colName">客户等级</th>
							<th class="colName">客户名称</th>
							<th class="colName">订单需求数</th>
							<th class="colName">要求</th>
							<th class="colName">交货日期</th>
							<th class="colName">倒计时管理</th>
							<th class="colName">成品入库数量</th>
							<th class="colName">出库数量</th>
							<th class="colName">预出库/备货</th>
							<th class="colName">动态存放库存位</th>
							<th class="colName">卡板/箱</th>
							<th class="colName">现有箱数</th>
							<th class="colName">说明</th>
							<th class=""></th>
							<th class=""></th>
						</tr>
						</thead>
						<tbody id="add-tbody">
						<tr class="data-tr">
							<td class="data"><input type="text" name="" id="" class="dataInput orderDate" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput orderId" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput salesMan" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput OEId" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput KMId" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput cusLevel" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput cusName" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput orderDemand" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput req" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput deliveryDate" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput countdown" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput storageQT" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput deliveryQT" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput preDate" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput dyLoc" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput box" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput boxNum" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput remarks" /></td>
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
		<div id="editBox" class="dialog">
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
							<td class="data"><input type="text" name="" disabled  class="dataInput oaj_id" /></td>
						</tr>
						<tr class="line">
							<td class="colName">订单下达日期：</td>
							<td class="data"><input type="text" name=""  class="dataInput orderDate" /></td>
						</tr>
						<tr class="line">
							<td class="colName">订单编号：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput orderId" /></td>
						</tr>
						<tr class="line">
							<td class="colName">业务员：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput salesMan" /></td>
						</tr>
						<tr class="line">
							<td class="colName">OE编号：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput OEId" /></td>
						</tr>
						<tr class="line">
							<td class="colName">康明编号：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput KMId" /></td>
						</tr>
						<tr class="line">
							<td class="colName">客户等级：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput cusLevel" /></td>
						</tr>
						<tr class="line">
							<td class="colName">客户名称：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput cusName" /></td>
						</tr>
						<tr class="line">
							<td class="colName">订单需求数：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput orderDemand" /></td>
						</tr>
						<tr class="line">
							<td class="colName">要求：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput req" /></td>
						</tr>
						<tr class="line">
							<td class="colName">交货日期：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput deliveryDate" /></td>
						</tr>
						<tr class="line">
							<td class="colName">倒计时管理：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput countdown" /></td>
						</tr>
						<tr class="line">
							<td class="colName">成品入库数量：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput storageQT" /></td>
						</tr>
						<tr class="line">
							<td class="colName">出库数量：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput deliveryQT" /></td>
						</tr>
						<tr class="line">
							<td class="colName">预出库/备货：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput preDate" /></td>
						</tr>
						<tr class="line">
							<td class="colName">动态存放库位：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput dyLoc" /></td>
						</tr>
						<tr class="line">
							<td class="colName">卡板/箱：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput box" /></td>
						</tr>
						<tr class="line">
							<td class="colName">现有箱数：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput boxNum" /></td>
						</tr>
						<tr class="line">
							<td class="colName">说明：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput remarks" /></td>
						</tr>
						<input type="hidden" class="version" value="" />
						</tbody>
					</table>
				</div>
				<div class="box-foot">
					<ul class="footBT-list">
						<li class="footBT-item"><input type="button" class="footBT cur-poi" id="submit-edit" value="提交" /></li>
						<li class="footBT-item"><input type="button" class="footBT cur-poi close" value="取消" /></li>
					</ul>
				</div>
			</div>
		</div>
<!-- 显示完整数据-对话框 -->
	    <div class="completeValBox">
	    	<div class="head-box"></div>
	        <div class="cont">
	            <span class="text"></span>
	            <div class="iconfont close">×</div>
	        </div>
	    </div>
<!-- 导入数据的选择文件-对话框 -->
	    <div class="export-chooseFileBox dialog" >
	    	<form action="http://192.168.1.142:5000/Uploader" method="POST" enctype="multipart/form-data">
				<div class="box-head">
					<span class="title">导入数据</span>
					<div class="fr">
						<a href="javascript:;" class="close" id="close-box">×</a>
					</div>
				</div>
		    	<div class="box-body">
			    		<input type="file" name="file" />
		    	</div>
				<div class="box-foot">
					<ul class="footBT-list">
						<li class="footBT-item"><input type="submit" class="footBT cur-poi" id="submit-edit" value="导入" /></li>
						<li class="footBT-item"><input type="button" class="footBT cur-poi close" value="取消" /></li>
					</ul>
				</div>
	    	</form>
	    </div>
	    
		<script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
		<script type="text/javascript">
			function getAddDatas(){
				var $dataTrs = $('#addBox .data-tr');
				var datas = new Array();
				for(var i = 0;i < $dataTrs.length;i++){
					var $data = $dataTrs.eq(i);		//单行数据
					datas[i] = {
							orderDate:				$data.find('.orderDate').val(),
							orderId:				$data.find('.orderId').val(),
							salesMan:				$data.find('.salesMan').val(),
							oeId:			$data.find('.OEId').val(),
							kmId:			$data.find('.KMId').val(),
							cusLevel:			$data.find('.cusLevel').val(),
							cusName:			$data.find('.cusName').val(),
							orderDemand:					$data.find('.orderDemand').val(),
							req:					$data.find('.req').val(),
							deliveryDate:					$data.find('.deliveryDate').val(),
							countdown:					$data.find('.countdown').val(),
							storageQT:					$data.find('.storageQT').val(),
							deliveryQT:					$data.find('.deliveryQT').val(),
							preDate:					$data.find('.preDate').val(),
							dyLoc:					$data.find('.dyLoc').val(),
							box:					$data.find('.box').val(),
							boxNum:					$data.find('.boxNum').val(),
							remarks:					$data.find('.remarks').val()
					};
				}
				return datas;
			}
			//将编辑后的数据封装进data中提交给ajax
			function getEditData(){
				var $editTbody = $('#editBox .edit-tbody');
				//接收时全部接收，修改哪些取决于后台mapper语句
				var data = {
						oaj_id:             $editTbody.find(".oaj_id").val(),
						month:              $editTbody.find(".month").val(),
						orderDate:          $editTbody.find(".orderDate").val(),
						orderId:            $editTbody.find(".orderId").val(),
						salesMan:           $editTbody.find(".salesMan").val(),
						oeId:               $editTbody.find(".OEId").val(),
						kmId:               $editTbody.find(".KMId").val(),
						cusLevel:           $editTbody.find(".cusLevel").val(),
						cusName:            $editTbody.find(".cusName").val(),
						orderDemand:        $editTbody.find(".orderDemand").val(),
						req:                $editTbody.find(".req").val(),
						deliveryDate:       $editTbody.find(".deliveryDate").val(),
						countdown:          $editTbody.find(".countdown").val(),
						storageQT:          $editTbody.find(".storageQT").val(),
						deliveryQT:         $editTbody.find(".deliveryQT").val(),
						preDate:            $editTbody.find(".preDate").val(),
						inventory:          $editTbody.find(".inventory").val(),
						availableQT:        $editTbody.find(".availableQT").val(),
						orderMatchingNum:   $editTbody.find(".orderMatchingNum").val(),
						underCount:         $editTbody.find(".underCount").val(),
						dyLoc:              $editTbody.find(".dyLoc").val(),
						box:                $editTbody.find(".box").val(),
						boxNum:             $editTbody.find(".boxNum").val(),
						remarks:            $editTbody.find(".remarks").val(),
						version:            $editTbody.find(".version").val()
				};
				return data;
			}
			function refreshSuc(hash){
				console.log(hash);
				var oajs = hash.ordersAndJournals;
				var totalInfo = hash.totalInfo;
				dataCount = hash.dataCount;
				pageIdx = hash.pageIdx;
				refreshDataPageLinks();
				var datatable = document.getElementsByClassName("datatable")[0];
				$('.datatable .row').remove();
				//填入表格数据
				for(var i = 0;i < oajs.length;i++){
					var $newRow = $dataRowTemp.clone(true);
					var $vals = $newRow.children('.val');
					$vals.eq(0).html(oajs[i].oaj_id);
					$vals.eq(1).html(oajs[i].month);
					$vals.eq(2).html(oajs[i].orderDate);
					$vals.eq(3).html(oajs[i].orderId);
					$vals.eq(4).html(oajs[i].salesMan);
					$vals.eq(5).html(oajs[i].oeId);
					$vals.eq(6).html(oajs[i].kmId);
					$vals.eq(7).html(oajs[i].cusLevel);
					$vals.eq(8).html(oajs[i].cusName);
					$vals.eq(9).html(oajs[i].orderDemand);
					$vals.eq(10).html(oajs[i].req);
					$vals.eq(11).html(oajs[i].deliveryDate);
					$vals.eq(12).html(oajs[i].countdown);
					$vals.eq(13).html(oajs[i].storageQT);
					$vals.eq(14).html(oajs[i].deliveryQT);
					$vals.eq(15).html(oajs[i].preDate);
					$vals.eq(16).html(oajs[i].inventory);
					$vals.eq(17).html(oajs[i].availableQT);
					$vals.eq(18).html(oajs[i].orderMatchingNum);
					$vals.eq(19).html(oajs[i].underCount);
					$vals.eq(20).html(oajs[i].dyLoc);
					$vals.eq(21).html(oajs[i].box);
					$vals.eq(22).html(oajs[i].boxNum);
					$vals.eq(23).html(oajs[i].remarks);
					$newRow.find(".dataCheb").val(oajs[i].oaj_id);
					$newRow.find(".editData").attr("name",oajs[i].oaj_id);
					$newRow.find(".delData").attr("name",oajs[i].oaj_id);
					$('.datatable').append($newRow);
				}
				//填入统计信息
				if(totalInfo!=undefined&&totalInfo!=null){
					$('.tardinessSingular').text(totalInfo.tardinessSingular);
					$('.tardinessNumber').text(totalInfo.tardinessNumber);
					$('.inventoryError').text(totalInfo.inventoryError);
					$('.orderError').text(totalInfo.orderError);
					$('.startData').text(totalInfo.startData);
					$('.startDay').text(totalInfo.startDay);
					$('.advanceDeliveryNumber').text(totalInfo.advanceDeliveryNumber);
					$('.advanceDeliverySingular').text(totalInfo.advanceDeliverySingular);
					$('.sumOrderNeed').text(totalInfo.sumOrderNeed);
					$('.totalNumberIncoming').text(totalInfo.totalNumberIncoming);
					$('.sumDelivery').text(totalInfo.sumDelivery);
					$('.readyForDelivery').text(totalInfo.readyForDelivery);
					$('.totalNumberOutbound').text(totalInfo.totalNumberOutbound);
					$('.storageNumber').text(totalInfo.storageNumber);
					$('.unitsWithoutEarlyWarningNumberIssued').text(totalInfo.unitsWithoutEarlyWarningNumberIssued);
					$('.aUnitOfDebtIsInvolved').text(totalInfo.aUnitOfDebtIsInvolved);
				}
			}
			function editSuc(data) {
				var $editTbody = $('#editBox .edit-tbody');
				$editTbody.find(".oaj_id").val(data.oaj_id);
				$editTbody.find(".month").val(data.month);
				$editTbody.find(".orderDate").val(data.orderDate);
				$editTbody.find(".orderId").val(data.orderId);
				$editTbody.find(".salesMan").val(data.salesMan);
				$editTbody.find(".OEId").val(data.oeId);
				$editTbody.find(".KMId").val(data.kmId);
				$editTbody.find(".cusLevel").val(data.cusLevel);
				$editTbody.find(".cusName").val(data.cusName);
				$editTbody.find(".orderDemand").val(data.orderDemand);
				$editTbody.find(".req").val(data.req);
				$editTbody.find(".deliveryDate").val(data.deliveryDate);
				$editTbody.find(".countdown").val(data.countdown);
				$editTbody.find(".storageQT").val(data.storageQT);
				$editTbody.find(".deliveryQT").val(data.deliveryQT);
				$editTbody.find(".preDate").val(data.preDate);
				$editTbody.find(".inventory").val(data.inventory);
				$editTbody.find(".availableQT").val(data.availableQT);
				$editTbody.find(".orderMatchingNum").val(data.orderMatchingNum);
				$editTbody.find(".underCount").val(data.underCount);
				$editTbody.find(".dyLoc").val(data.dyLoc);
				$editTbody.find(".box").val(data.box);
				$editTbody.find(".boxNum").val(data.boxNum);
				$editTbody.find(".remarks").val(data.remarks);
				$editTbody.find(".version").val(data.version);
			}
			//隐藏列表
			var hiddenCols = ['要求','说明'];
		</script>
		<script src="js/init.js"></script>
		<script src="js/funcsOfAjax.js"></script>
		<script src="js/event.js"></script>
		<script charset="UTF-8" src="js/endInit.js"></script>
	</body>
</html>