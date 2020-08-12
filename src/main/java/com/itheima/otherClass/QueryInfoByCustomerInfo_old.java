package com.itheima.otherClass;

import java.util.ArrayList;
import java.util.List;

public class QueryInfoByCustomerInfo_old {
	
	private List<String> orderItems;
	private List<String> colValueItems;
	private Integer limitBegin;
	private Integer pageDataCount;
	private static String[] colNames = {"id","salesman","customerId","proportionOfOrders","cumulativeProportion","averageMonthlyOrder",
			"totalOrders","orderNumber","orderQuantity","customerLevel","leadTime","remark"};
	public QueryInfoByCustomerInfo_old() {}
	public QueryInfoByCustomerInfo_old(Integer limitBegin,Integer pageDataCount) {
		this.limitBegin = limitBegin;
		this.pageDataCount = pageDataCount;
	}
	//将前台传来的数组数据转为mysql排序条件语句，其中前台传来的
	public QueryInfoByCustomerInfo_old(List<String> screenInfoPackage) {
		int flag = 0;
		List<String> infos = new ArrayList<String>();
		for(String screenInfo:screenInfoPackage) {
			if(screenInfo.equals("orderItems")) {
				flag = 1;
			}
			else if(screenInfo.equals("colValueItems")) {
				setOrderItems(infos);
				infos.clear();
				flag = 2;
			}
			else {
				infos.add(screenInfo);
			}
		}
		setColValueItems(infos);
	}
	public QueryInfoByCustomerInfo_old(List<String> screenInfoPackage,int limitBegin,int pageDataCount) {
		this(screenInfoPackage);
		this.limitBegin = limitBegin;
		this.pageDataCount = pageDataCount;
	}
	public List<String> getOrderItems(){
		return orderItems;
	}
	public void setOrderItems(List<String> sortTypes) {
		orderItems = new ArrayList<String>();
		for(String sortType:sortTypes) {
			String items;
			int colNameIdx = 0;
			int i;
			for(i = 0;sortType.charAt(i)!=' ';i++)
				colNameIdx = colNameIdx*10+sortType.charAt(i)-'0';
			items = colNames[colNameIdx];
			items += sortType.charAt(i+1)=='1'?" ASC":" DESC";
			orderItems.add(items);
		}
	}
	
	public List<String> getColValueItems() {
		return colValueItems;
	}
	public void setColValueItems(List<String> colValuescreen) {
		colValueItems = new ArrayList<String>();
		for(int i = 0;i < colValuescreen.size();i++) {
			if(colValuescreen.get(i).equals(""))continue;
			String str = colValuescreen.get(i);
			String items = null;
			String sign = "";
			//获取提示符，判断该列是按什么方法筛选
			for(int si = 0;str.charAt(si)!=' ';si++)
				sign+=str.charAt(si);
			str = str.substring(sign.length()+1);
			if("&value".equals(sign)) {
				items = colNames[i] + " IN (";
				items += str.substring(0,str.length()-1);		//去掉末尾逗号
				items += ")";
			}
			else if("&number".equals(sign)) {
				items = colNames[i] + str;
			}
			else {		//程序正常不会执行
				System.out.println("colValueItem符号有误！");
			}
			colValueItems.add(items);
		}
	}

	public Integer getLimitBegin() {
		return limitBegin;
	}
	public void setLimitBegin(Integer limitBegin) {
		this.limitBegin = limitBegin;
	}
	public Integer getPageDataCount() {
		return pageDataCount;
	}
	public void setPageDataCount(Integer pageDataCount) {
		this.pageDataCount = pageDataCount;
	}
	public static String getColName(int colIdx) {
		if(colIdx<0||colIdx>=colNames.length)return null;
		return colNames[colIdx];
	}
	@Override
	public String toString() {
		return "screenInfoByCustomerInfo [orderItems=" + orderItems + ", colValueItems=" + colValueItems + "]";
	}
	
}
