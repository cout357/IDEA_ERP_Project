package com.itheima.model;

public class CustomerInfo {
	private Integer id;							//序号
	private String salesman;					//业务员
	private String customerId;					//客户代码
	private String proportionOfOrders;			//订单占比
	private String cumulativeProportion;		//累计占比
	private Integer averageMonthlyOrder;		//月均订单
	private Integer totalOrders;				//订单总数
	private Integer orderNumber;				//订单单数
	private Integer orderQuantity;				//订单批量
	private String customerLevel;				//客户级别
	private String leadTime;					//交货周期
	private String remark;						//备注
	private static String[] colNames = {"id","salesman","customerId","proportionOfOrders","cumulativeProportion","averageMonthlyOrder",
			"totalOrders","orderNumber","orderQuantity","customerLevel","leadTime","remark"};
	
	public CustomerInfo() {}
	public CustomerInfo(Integer id, String salesman, String customerId, String proportionOfOrders,
			String cumulativeProprotion, Integer averageMonthlyOrder, Integer totalOrders, Integer orderNumber,
			Integer orderQuantity, String customerLevel, String leadTime, String remark) {
		super();
		this.id = id;
		this.salesman = salesman;
		this.customerId = customerId;
		this.proportionOfOrders = proportionOfOrders;
		this.cumulativeProportion = cumulativeProportion;
		this.averageMonthlyOrder = averageMonthlyOrder;
		this.totalOrders = totalOrders;
		this.orderNumber = orderNumber;
		this.orderQuantity = orderQuantity;
		this.customerLevel = customerLevel;
		this.leadTime = leadTime;
		this.remark = remark;
	}
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getSalesman() {
		return salesman;
	}
	public void setSalesman(String salesman) {
		this.salesman = salesman;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public String getProportionOfOrders() {
		return proportionOfOrders;
	}
	public void setProportionOfOrders(String proportionOfOrders) {
		this.proportionOfOrders = proportionOfOrders;
	}
	public String getCumulativeProportion() {
		return cumulativeProportion;
	}
	public void setCumulativeProportion(String cumulativeProportion) {
		this.cumulativeProportion = cumulativeProportion;
	}
	public Integer getAverageMonthlyOrder() {
		return averageMonthlyOrder;
	}
	public void setAverageMonthlyOrder(Integer averageMonthlyOrder) {
		this.averageMonthlyOrder = averageMonthlyOrder;
	}
	public Integer getTotalOrders() {
		return totalOrders;
	}
	public void setTotalOrders(Integer totalOrders) {
		this.totalOrders = totalOrders;
	}
	public Integer getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}
	public Integer getOrderQuantity() {
		return orderQuantity;
	}
	public void setOrderQuantity(Integer orderQuantity) {
		this.orderQuantity = orderQuantity;
	}
	public String getCustomerLevel() {
		return customerLevel;
	}
	public void setCustomerLevel(String customerLevel) {
		this.customerLevel = customerLevel;
	}
	public String getLeadTime() {
		return leadTime;
	}
	public void setLeadTime(String leadTime) {
		this.leadTime = leadTime;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public static String getColName(int colIdx) {
		if(colIdx<0||colIdx>=colNames.length)return null;
		return colNames[colIdx];
	}
	@Override
	public String toString() {
		return "CustomerInfo [id=" + id + ", salesman=" + salesman + ", customerId=" + customerId
				+ ", proportionOfOrders=" + proportionOfOrders + ", cumulativeProportion=" + cumulativeProportion
				+ ", averageMonthlyOrder=" + averageMonthlyOrder + ", totalOrders=" + totalOrders + ", orderNumber="
				+ orderNumber + ", orderQuantity=" + orderQuantity + ", customerLevel=" + customerLevel + ", leadTime="
				+ leadTime + ", remark=" + remark + "]";
	}
	
	
}
