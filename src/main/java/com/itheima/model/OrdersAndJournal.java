package com.itheima.model;

import java.util.Date;

public class OrdersAndJournal {
	private Integer oaj_id;
	private Integer month;
	private String orderDate;
	private String orderId;
	private String salesMan;
	private String oeId;
	private String kmId;
	private String cusLevel;
	private String cusName;
	private Integer orderDemand;
	private String req;
	private String deliveryDate;
	private String countdown;
	private Integer storageQT;
	private Integer deliveryQT;
	private String preDate;
	private Integer inventory;
	private Integer availableQT;
	private Integer orderMatchingNum;
	private Integer underCount;
	private String dyLoc;
	private String box;
	private Integer boxNum;
	private String remarks;
	private Integer version;
	
	
	public Integer getOaj_id() {
		return oaj_id;
	}
	public void setOaj_id(Integer oaj_id) {
		this.oaj_id = oaj_id;
	}
	public Integer getMonth() {
		return month;
	}
	public void setMonth(Integer month) {
		this.month = month;
	}
	public String getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(String orderDate) {
		this.orderDate = orderDate;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getSalesMan() {
		return salesMan;
	}
	public void setSalesMan(String salesMan) {
		this.salesMan = salesMan;
	}
	public String getOeId() {
		return oeId;
	}
	public void setOeId(String oEId) {
		oeId = oEId;
	}
	public String getKmId() {
		return kmId;
	}
	public void setKmId(String kMId) {
		kmId = kMId;
	}
	public String getCusLevel() {
		return cusLevel;
	}
	public void setCusLevel(String cusLevel) {
		this.cusLevel = cusLevel;
	}
	public String getCusName() {
		return cusName;
	}
	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	public Integer getOrderDemand() {
		return orderDemand;
	}
	public void setOrderDemand(Integer orderDemand) {
		this.orderDemand = orderDemand;
	}
	public String getReq() {
		return req;
	}
	public void setReq(String req) {
		this.req = req;
	}
	public String getDeliveryDate() {
		return deliveryDate;
	}
	public void setDeliveryDate(String deliveryDate) {
		this.deliveryDate = deliveryDate;
	}
	public String getCountdown() {
		return countdown;
	}
	public void setCountdown(String countdown) {
		this.countdown = countdown;
	}
	public Integer getStorageQT() {
		return storageQT;
	}
	public void setStorageQT(Integer storageQT) {
		this.storageQT = storageQT;
	}
	public Integer getDeliveryQT() {
		return deliveryQT;
	}
	public void setDeliveryQT(Integer deliveryQT) {
		this.deliveryQT = deliveryQT;
	}
	public String getPreDate() {
		return preDate;
	}
	public void setPreDate(String preDate) {
		this.preDate = preDate;
	}
	public Integer getInventory() {
		return inventory;
	}
	public void setInventory(Integer inventory) {
		this.inventory = inventory;
	}
	public Integer getAvailableQT() {
		return availableQT;
	}
	public void setAvailableQT(Integer availableQT) {
		this.availableQT = availableQT;
	}
	public Integer getOrderMatchingNum() {
		return orderMatchingNum;
	}
	public void setOrderMatchingNum(Integer orderMatchingNum) {
		this.orderMatchingNum = orderMatchingNum;
	}
	public Integer getUnderCount() {
		return underCount;
	}
	public void setUnderCount(Integer underCount) {
		this.underCount = underCount;
	}
	public String getDyLoc() {
		return dyLoc;
	}
	public void setDyLoc(String dyLoc) {
		this.dyLoc = dyLoc;
	}
	public String getBox() {
		return box;
	}
	public void setBox(String box) {
		this.box = box;
	}
	public Integer getBoxNum() {
		return boxNum;
	}
	public void setBoxNum(Integer boxNum) {
		this.boxNum = boxNum;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String explain) {
		this.remarks = explain;
	}
	
	public Integer getVersion() {
		return version;
	}
	public void setVersion(Integer version) {
		this.version = version;
	}
	@Override
	public String toString() {
		return "OrdersAndJournal [oaj_id=" + oaj_id + ", month=" + month + ", orderDate=" + orderDate + ", orderId="
				+ orderId + ", salesMan=" + salesMan + ", OEId=" + oeId + ", KMId=" + kmId + ", cusLevel=" + cusLevel
				+ ", cusName=" + cusName + ", orderDemand=" + orderDemand + ", req=" + req + ", deliveryDate="
				+ deliveryDate + ", countdown=" + countdown + ", storageQT=" + storageQT + ", deliveryQT=" + deliveryQT
				+ ", preDate=" + preDate + ", inventory=" + inventory + ", availableQT=" + availableQT
				+ ", orderMatchingNum=" + orderMatchingNum + ", underCount=" + underCount + ", dyLoc=" + dyLoc
				+ ", box=" + box + ", boxNum=" + boxNum + ", remarks=" + remarks + "]";
	}
	
}
