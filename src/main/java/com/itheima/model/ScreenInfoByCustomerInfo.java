package com.itheima.model;

import java.util.ArrayList;
import java.util.List;

public class ScreenInfoByCustomerInfo {
	
	private List<String> orderItems;
	private List<String> colValueItems;
	private static String[] colNames = {"id","salesman","customerId","proportionOfOrders","cumulativeProportion","averageMonthlyOrder",
			"totalOrders","orderNumber","orderQuantity","customerLevel","leadTime","remark"};
	//将前台传来的数组数据转为mysql排序条件语句，其中前台传来的
	public ScreenInfoByCustomerInfo(List<String> screenInfoPackage) {
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
			String items;
			items = colNames[i] + " IN (";
			items += colValuescreen.get(i).substring(0,colValuescreen.get(i).length()-1);		//去掉末尾逗号
			items += ")";
			colValueItems.add(items);
		}
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
