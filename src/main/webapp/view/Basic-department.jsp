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
						<div class="text-icon head-icon icon"><span class="icon-text">基</span></div>
						<span class="text">基础信息管理</span>
					</div>
					<ul class="select-list">
						
						<li class="select-item">
							<a href="view/Basic-PMC.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">PM</span></div>
								<span class="select-text text">PMC系统人员考核信息</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Basic-product.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">产</span></div>
								<span class="select-text text">产品名称标准信息</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Basic-customer.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">客</span></div>
								<span class="select-text text">客户信息库（含分级标准）</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Basic-supplier.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">供</span></div>
								<span class="select-text text">供应商信息库</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Basic-department.jsp" class="select-a  selected">
								<div class="text-icon icon"><span class="icon-text">部</span></div>
								<span class="select-text text">部门基本组织架构</span>
								
							</a>
							
						</li>
						
						<li class="select-item">
							<a href="view/Basic-user.jsp" class="select-a ">
								<div class="text-icon icon"><span class="icon-text">用</span></div>
								<span class="select-text text">用户权限管理</span>
								
							</a>
							
						</li>
						
					</ul>
				</li>
			</ul>
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
							<a class="mainlink" href="view/MaterialControl-benchmarkData.jsp">物控管理</a>
							<div class="dropdown-content">
								<ul class="droplist">
                                    
									<li class="dropitem">
										<a class="droplink" href="view/MaterialControl-benchmarkData.jsp">成品库存标准及库存动态</a>
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
						<span>用户权限管理</span>
					</div>
<!-- 统计信息 -->
					<div class="totalInfo-box">
						<a class="dropdownLink" id="totalInfoLink" href="javascript:;">统计信息</a>
						<div class="table-box" id="totalInfoTableBox">
							<div class="totalInfo-menu">
								<span class="refreshTimeText">上次更新于<span class="totalInfoRefreshTime">${totalInfoRefreshTime }</span></span>
								<button class="updateTotalInfoBT cur-poi">更新</button>
							</div>
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
						<div class="tablename">用户权限</div>
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
						<input type="hidden" id="colSum" value="6"/>
						<input type="hidden" id="tableName" value="Account"/>
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
								<th class="colname-th "><span class="colname-text strCol">姓名</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">用户密码</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">用户名/邮箱</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">权限</span>
									<div class="menu">
										<span class="sortSign iconfont">&#xe660;</span><br/>
										<span class="sort-cancel iconfont">一</span><br/>
									</div>
								</th>
								<th class="colname-th "><span class="colname-text strCol">状态</span>
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
							<c:forEach items="${datas }" var="data" varStatus="idx">
								<tr class="row">
									<th class="hor"><input type="checkbox" class="dataCheb" value="${data.id}" /></th>
									<th class="hor val">${data.id}</th>
									<th class="hor val">${data.name}</th>
									<th class="hor val">${data.password}</th>
									<th class="hor val">${data.user}</th>
									<th class="hor val">${data.role}</th>
									<th class="hor val">${data.state}</th>
									<th class="hor iconfont sep-hor">
										<a href="javascript:;" class="editData" name="${data.id }" style="font-size:1.3rem;">&#xe612;</a>
										&emsp;
										<a href="javascript:;" class="delData" name="${data.id }" onclick="delData(this)" style="font-size:1rem;">&#xe78d;</a>
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
				<span class="title">添加账户</span>
				<div class="fr">
					<a href="javascript:;" class="close" id="close-addBox">×</a>
				</div>
			</div>
			<div class="box-body">
				<div class="addTable-box">
					<table id="add-table">
						<thead>
						<tr class="colName-tr">
							<th class="colName">姓名</th>
							<th class="colName">用户密码</th>
							<th class="colName">用户名/邮箱</th>
							<th class="colName">权限</th>
							<th class="colName">状态</th>
							<th class=""></th>
							<th class=""></th>
						</tr>
						</thead>
						<tbody id="add-tbody">
						<tr class="data-tr">
							<td class="data"><input type="text" name="" id="" class="dataInput name" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput password" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput user" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput role" value="" /></td>
							<td class="data"><input type="text" name="" id="" class="dataInput state" value="" /></td>
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
				<span class="title">编辑账户</span>
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
							<td class="data"><input type="text" name="" id="" disabled class="dataInput id" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">姓名：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput name" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">用户密码：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput password" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">用户名/邮箱：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput user" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">权限：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput role" value="" /></td>
						</tr>
						<tr class="line">
							<td class="colName">状态：</td>
							<td class="data"><input type="text" name="" id="" class="dataInput state" value="" /></td>
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
<!-- 显示完整数据-对话框 -->
		<div class="completeValBox">
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
						name:				$data.find('.name').val(),
						password:				$data.find('.password').val(),
						user:				$data.find('.user').val(),
						role:				$data.find('.role').val(),
						state:				$data.find('.state').val()
					};
				}
				return datas;
			}
			//将编辑后的数据封装进data中提交给ajax
			function getEditData(){
				var $editTbody = $('#editBox .edit-tbody');
				//接收时全部接收，修改哪些取决于后台mapper语句
				var data = {
					id:             $editTbody.find(".roleId").val(),
					name:             $editTbody.find(".name").val(),
					password:              $editTbody.find(".password").val(),
					user:              $editTbody.find(".user").val(),
					role:              $editTbody.find(".role").val(),
					state:              $editTbody.find(".state").val()
				};
				return data;
			}
			function refreshSuc(hash){
				console.log(hash);
				var datas = hash.datas;
				dataCount = hash.dataCount;
				pageIdx = hash.pageIdx;
				refreshDataPageLinks();
				var datatable = document.getElementsByClassName("datatable")[0];
				$('.datatable .row').remove();
				for(var i = 0;i < datas.length;i++){
					var $newRow = $dataRowTemp.clone(true);
					var $vals = $newRow.children('.val');
					$vals.eq(0).html(datas[i].id);
					$vals.eq(1).html(datas[i].name);
					$vals.eq(2).html(datas[i].password);
					$vals.eq(2).html(datas[i].user);
					$vals.eq(2).html(datas[i].role);
					$vals.eq(2).html(datas[i].state);
					$newRow.find(".dataCheb").val(datas[i].id);
					$newRow.find(".editData").attr("name",datas[i].id);
					$newRow.find(".delData").attr("name",datas[i].id);
					$('.datatable').append($newRow);
				}
			}
			function editSuc(data) {
				var $editTbody = $('#editBox .edit-tbody');
				$editTbody.find(".id").val(data.roleId);
				$editTbody.find(".name").val(data.roleUser);
				$editTbody.find(".password").val(data.strRole);
				$editTbody.find(".user").val(data.strRole);
				$editTbody.find(".role").val(data.strRole);
				$editTbody.find(".state").val(data.strRole);
			}
			
			function refreshTotalInfoSuc(hash){
				var totalInfo = hash.totalInfo;
				var refreshTime = hash.refreshTime;
				//填入统计信息
				if(totalInfo!=undefined&&totalInfo!=null){
					$('.tardinessSingular').text(totalInfo.tardinessSingular);
					$('.tardinessNumber').text(totalInfo.tardinessNumber);
					$('.inventoryError').text(totalInfo.inventoryError);
				}
				console.log($('.totalInfoRefreshTime'));
				$('.totalInfoRefreshTime').text(refreshTime);
			}
			//隐藏列表
			var hiddenCols = null;
		</script>
		<script src="js/init.js"></script>
		<script src="js/funcsOfAjax.js"></script>
		<script src="js/event.js"></script>
		<script charset="UTF-8" src="js/endInit.js"></script>
	</body>
</html>