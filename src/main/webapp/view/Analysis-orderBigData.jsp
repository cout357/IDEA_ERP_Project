<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="com.itheima.model.CustomerInfo"%>
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
				background-color: #FF9966;
			}
			.tinfo-4{
				background-color: #669933;
			}
			.tinfo-5{
				background-color: #FF6600;
			}
			.tinfo-6{
				background-color: #3399CC;
			}
			.tinfo-7{
				background-color: #6666CC;
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
						<div class="text-icon head-icon icon"><span class="icon-text">分</span></div>
						<span class="text">分析决策</span>
					</div>
					<ul class="select-list">
						
						<li class="select-item">
							<a href="view/Analysis-orderBigData.jsp" class="select-a  selected">
								<div class="text-icon icon"><span class="icon-text">订</span></div>
								<span class="select-text text">订单大数据分析</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Analysis-partsConsumption.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">零</span></div>
								<span class="select-text text">零件用量需求大数据分析</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Analysis-customerValue.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">客</span></div>
								<span class="select-text text">客户价值趋势分析</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Analysis-manufacturing.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">生</span></div>
								<span class="select-text text">生产制造能力改进分析</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Analysis-supplyChainImprovement.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">供</span></div>
								<span class="select-text text">供应链改进需求分析</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Analysis-productionImprovement.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">《</span></div>
								<span class="select-text text">《生产改进计划》与执行管理</span>
								
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
							<a class="mainlink" href="OrdersAndJournalCT/limitQuery">物控管理</a>
							<div class="dropdown-content">
								<ul class="droplist">
                                    
									<li class="dropitem">
										<a class="droplink" href="OrdersAndJournalCT/limitQuery">成品库存标准及库存动态</a>
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
									<th class="hor val tinfo-1" colspan="1">122</th>
									<th class="hor val tinfo-2" colspan="2">版本更新日期</th>
									<th class="hor val tinfo-2" colspan="2">4月10日</th>
									<th class="hor val tinfo-2" colspan="2">开始运行日期</th>
									<th class="hor val tinfo-2" colspan="2">3月17日</th>
								</tr>
								<tr class="row title-tr">
									<th class="hor val tinfo-3" colspan="1">预出库数量</th>
									<th class="hor val tinfo-3" colspan="1">2E+05</th>
									<th class="hor val tinfo-5" colspan="1">库存填写报错</th>
									<th class="hor val tinfo-5" colspan="1">0</th>
									<th class="hor val tinfo-7" colspan="1">总订单需求数</th>
									<th class="hor val tinfo-7" colspan="1">1659326</th>
									<th class="hor val tinfo-7" colspan="1">总结库存数</th>
									<th class="hor val tinfo-7" colspan="1">1406845</th>
									<th class="hor val tinfo-6" colspan="1">预警欠数未发单数</th>
									<th class="hor val tinfo-6" colspan="1">842</th>
									<th class="hor val tinfo-4" colspan="1">拖期单数</th>
									<th class="hor val tinfo-4" colspan="1">787</th>
								</tr>
								<tr class="row" >
									<th class="hor val tinfo-3" colspan="1">预出库单数</th>
									<th class="hor val tinfo-3" colspan="1">613</th>
									<th class="hor val tinfo-5" colspan="1">订单填写报错</th>
									<th class="hor val tinfo-5" colspan="1">2</th>
									<th class="hor val tinfo-7" colspan="1">总入库数</th>
									<th class="hor val tinfo-7" colspan="1">2610076</th>
									<th class="hor val tinfo-7" colspan="1">总出库数</th>
									<th class="hor val tinfo-7" colspan="1">1203231</th>
									<th class="hor val tinfo-6" colspan="1">涉及欠数单次</th>
									<th class="hor val tinfo-6" colspan="1">302</th>
									<th class="hor val tinfo-4" colspan="1">拖期数量</th>
									<th class="hor val tinfo-4" colspan="1">-4E+05</th>
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
								<li class="item dropdown" id="showColMenu-dropdown">
									<!-- 显示|隐藏列 -->
									<a href="javascript:;" class="dropdownLink iconfont link" style="font-size:19px;">&#xe607;</a>
									<div class="dropdown-content">
										<ul class="droplist">
											<li class="dropitem"><input class="cheb-all cur-poi" type="checkbox" checked="checked"/><span class="text">全选</span></li>
										</ul>
									</div>
								</li>
								<li class="item">
									<form action="" class="search">
										<div class="search-group">
											<input type="search" placeholder="Search" class="search-text"/>
											<input type="submit" class="search-submit iconfont" value="&#xe618;"/>
										</div>
									</form>
								</li>
							</ul>
						</div>
						<div class="fr">
							<ul class="list">
								<li class="item"><a href="javascript:;" id="addData" class="add iconfont link">&#xe627;&nbsp;添加数据</a></li>
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
												<option value="cancel">无</option>
												<option value="=" selected>等于</option>
												<option value="!=">不等于</option>
												<option value=">">大于</option>
												<option value=">=">大于或等于</option>
												<option value="<">小于</option>
												<option value="<=">小于或等于</option>
											</select>
												<input type="text" class="numscreen-val">		<!-- 只能接收数字、小数点、百分号 -->
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
						<input type="hidden" id="colSum" value="12"/>
						<input type="hidden" id="tableName" value="CustomerInfo"/>
						<table class="datatable">
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
								<th class="colname-th "><span class="colname-text strCol">业务员</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">客户代码</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">订单占比</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">累计占比</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">月均订单</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">订单总数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">订单单数</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text numCol">订单批量</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">客户级别</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">交货周期</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">备注</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th ">操作</th>
							</tr>
							<tr class="colscreen-tr" valign="top">
								<th></th>
								<th class="colscreen-td">
									<span class="colscreen iconfont"><span class="text">&#xe83b;</span></span>
								</th>
							</tr>
							<!-- 表格数据 -->
							<c:forEach items="${customerInfos }" var="customer" varStatus="idx">
								<tr class="row">
									<th class="hor"><input type="checkbox" class="datatable-checkbox" /></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor val"></th>
									<th class="hor iconfont sep-hor">
										<a href="javascript:;" class="editData" name="${customer.id }" style="font-size:1.3rem;">&#xe612;</a>
										&emsp;
										<a href="javascript:;" class="delData" name="${customer.id}" onclick="delData(this)" style="font-size:1rem;">&#xe78d;</a>
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
				<span class="title">添加客户信息</span>
				<div class="fr">
					<a href="javascript:;" class="close" id="close-addBox">×</a>
				</div>
			</div>
			<div class="box-body">
				<div class="addTable-box">
					<table id="add-table">
						<thead>
						<tr class="colName-tr">
							<th class="colName">业务员</th>
							<th class="colName">客户代码</th>
							<th class="colName">月均订单</th>
							<th class="colName">订单总量</th>
							<th class="colName">订单单数</th>
							<th class="colName">订单批量</th>
							<th class="colName">客户级别</th>
							<th class="colName">备注</th>
							<th class=""></th>
							<th class=""></th>
						</tr>
						</thead>
						<tbody id="add-tbody">
						<tr class="data-tr">
							<td class="data"><input type="text" name="" id="" class="dataInput salesman" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput customerId" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput averageMonthlyOrder" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput totalOrders" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput orderNumber" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput orderQuantity" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput customerLevel" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput remark" value="" /></td>
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
				<span class="title">编辑客户信息</span>
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
							<td class="data"><input type="text" name="" id="" class="dataInput id" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">业务员：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput salesman" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">客户代码：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput customerId" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">订单占比：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput proportionOfOrders" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">累计占比：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput cumulativeProportion" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">月均订单：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput averageMonthlyOrder" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">订单总数：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput totalOrders" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">订单单数：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput orderNumber" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">订单批量：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput orderQuantity" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">客户级别：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput customerLevel" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">交货周期：</td>
							<td class="data"><input type="text" disabled="disabled" name="" id="" class="dataInput leadTime" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">备注：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput remark" value="" /></td>
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

		<script type="text/javascript" src="js/jquery-3.4.1.js" ></script>
		<script type="text/javascript">
			function refreshSuc(hash){
				console.log(hash);
				var customerInfos = hash.customerInfos;
				dataCount = hash.dataCount;
				pageIdx = hash.pageIdx;
				refreshDataPageLinks();
				var datatable = document.getElementsByClassName("datatable")[0];
				$('.datatable .row').remove();
				for(var i = 0;i < customerInfos.length;i++){
					var $newRow = $dataRowTemp.clone(true);
					var $vals = $newRow.children('.val');
					$vals.eq(0).html(customerInfos[i].id);
					$vals.eq(1).html(customerInfos[i].salesman);
					$vals.eq(2).html(customerInfos[i].customerId);
					$vals.eq(3).html(customerInfos[i].proportionOfOrders);
					$vals.eq(4).html(customerInfos[i].cumulativeProportion);
					$vals.eq(5).html(customerInfos[i].averageMonthlyOrder);
					$vals.eq(6).html(customerInfos[i].totalOrders);
					$vals.eq(7).html(customerInfos[i].orderNumber);
					$vals.eq(8).html(customerInfos[i].orderQuantity);
					$vals.eq(9).html(customerInfos[i].customerLevel);
					$vals.eq(10).html(customerInfos[i].leadTime);
					$vals.eq(11).html(customerInfos[i].remark);
					$newRow.find(".editData").attr("name",customerInfos[i].id);
					$newRow.find(".delData").attr("name",customerInfos[i].id);
					$('.datatable').append($newRow);
				}
				addEditEvent();
			}
			function editSuc(customerInfo) {
				var $editTbody = $('#editBox .edit-tbody');
				$editTbody.find(".id").val(customerInfo.id);
				$editTbody.find(".salesman").val(customerInfo.salesman);
				$editTbody.find(".customerId").val(customerInfo.customerId);
				$editTbody.find(".proportionOfOrders").val(customerInfo.proportionOfOrders);
				$editTbody.find(".cumulativeProportion").val(customerInfo.cumulativeProportion);
				$editTbody.find(".averageMonthlyOrder").val(customerInfo.averageMonthlyOrder);
				$editTbody.find(".totalOrders").val(customerInfo.totalOrders);
				$editTbody.find(".orderNumber").val(customerInfo.orderNumber);
				$editTbody.find(".orderQuantity").val(customerInfo.orderQuantity);
				$editTbody.find(".customerLevel").val(customerInfo.customerLevel);
				$editTbody.find(".leadTime").val(customerInfo.leadTime);
				$editTbody.find(".remark").val(customerInfo.remark);
			}
		</script>
		<script src="js/init.js"></script>
		<script src="js/funcsOfAjax.js"></script>
		<script src="js/event.js"></script>
		<script>
		</script>
	</body>
</html>