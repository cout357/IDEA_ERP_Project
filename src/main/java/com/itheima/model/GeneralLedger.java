package com.itheima.model;

import java.io.Serializable;
import java.math.BigInteger;
import java.util.Date;

public class GeneralLedger implements Serializable {
    private Integer gl_id;            			//  序号  ------------
    private String kmId;            		//  产品编号   ------------
    private String deposit;   				//  固定存放库位    ------------
    private String productClassification;   //  产品分类     ------------
    private String salesMan;          	 	 //  业务员    ------------
    private String dataTime;        		 //  盘点数据确认日期     ------------
    private Integer orderNeedSum;        		 //  订单总需求数
    private Integer storageSum;          		 //  入库累计数
    private Integer checkoutSum;          		//  实际出库累计数
    private Integer stockSum;         			//  当前可用库存数量
    private Integer stockCaseSum;           	//  当前库存箱数 ***   ------------
    private Integer needStage;               	  //  需求匹配状态
    private Integer preExportNumber;         	 //   备货数量
    private Integer availableNumber;          //  备货后可用库存
    private String beforeYear;             //  19年标准库存
    private Integer averageMouth2020;           //   2020月均用量
    private double averageMouth;            //   月均单数
    private Integer orderNumber;             //  订单张数
    private Integer storageNumber;              //  入库频数
    private Integer checkoutNumber;               //  出库频数
    private Integer lowMiniNeed;             //  低于最低库存预警款数   ------------
    private Integer outHighNeed;                //  高于最大库存总款数    ------------
    private Integer proposalNumber;           //  建议投产数量
    
	
	public Integer getGl_id() {
		return gl_id;
	}
	public void setGl_id(Integer gl_id) {
		this.gl_id = gl_id;
	}
	public String getKmId() {
		return kmId;
	}
	public void setKmId(String kmId) {
		this.kmId = kmId;
	}
	public String getDeposit() {
		return deposit;
	}
	public void setDeposit(String deposit) {
		this.deposit = deposit;
	}
	public String getProductClassification() {
		return productClassification;
	}
	public void setProductClassification(String productClassification) {
		this.productClassification = productClassification;
	}
	public String getSalesMan() {
		return salesMan;
	}
	public void setSalesMan(String salesMan) {
		this.salesMan = salesMan;
	}
	public String getDataTime() {
		return dataTime;
	}
	public void setDataTime(String dataTime) {
		this.dataTime = dataTime;
	}
	public Integer getOrderNeedSum() {
		return orderNeedSum;
	}
	public void setOrderNeedSum(Integer orderNeedSum) {
		this.orderNeedSum = orderNeedSum;
	}
	public Integer getStorageSum() {
		return storageSum;
	}
	public void setStorageSum(Integer storageSum) {
		this.storageSum = storageSum;
	}
	public Integer getCheckoutSum() {
		return checkoutSum;
	}
	public void setCheckoutSum(Integer checkoutSum) {
		this.checkoutSum = checkoutSum;
	}
	public Integer getStockSum() {
		return stockSum;
	}
	public void setStockSum(Integer stockSum) {
		this.stockSum = stockSum;
	}
	public Integer getStockCaseSum() {
		return stockCaseSum;
	}
	public void setStockCaseSum(Integer stockCaseSum) {
		this.stockCaseSum = stockCaseSum;
	}
	public Integer getNeedStage() {
		return needStage;
	}
	public void setNeedStage(Integer needStage) {
		this.needStage = needStage;
	}
	public Integer getPreExportNumber() {
		return preExportNumber;
	}
	public void setPreExportNumber(Integer preExportNumber) {
		this.preExportNumber = preExportNumber;
	}
	public Integer getAvailableNumber() {
		return availableNumber;
	}
	public void setAvailableNumber(Integer availableNumber) {
		this.availableNumber = availableNumber;
	}
	public String getBeforeYear() {
		return beforeYear;
	}
	public void setBeforeYear(String beforeYear) {
		this.beforeYear = beforeYear;
	}
	public Integer getAverageMouth2020() {
		return averageMouth2020;
	}
	public void setAverageMouth2020(Integer averageMouth2020) {
		this.averageMouth2020 = averageMouth2020;
	}
	public double getAverageMouth() {
		return averageMouth;
	}
	public void setAverageMouth(double averageMouth) {
		this.averageMouth = averageMouth;
	}
	public Integer getOrderNumber() {
		return orderNumber;
	}
	public void setOrderNumber(Integer orderNumber) {
		this.orderNumber = orderNumber;
	}
	public Integer getStorageNumber() {
		return storageNumber;
	}
	public void setStorageNumber(Integer storageNumber) {
		this.storageNumber = storageNumber;
	}
	public Integer getCheckoutNumber() {
		return checkoutNumber;
	}
	public void setCheckoutNumber(Integer checkoutNumber) {
		this.checkoutNumber = checkoutNumber;
	}
	
	public Integer getLowMiniNeed() {
		return lowMiniNeed;
	}
	public void setLowMiniNeed(Integer lowMiniNeed) {
		this.lowMiniNeed = lowMiniNeed;
	}
	public Integer getOutHighNeed() {
		return outHighNeed;
	}
	public void setOutHighNeed(Integer outHighNeed) {
		this.outHighNeed = outHighNeed;
	}
	public Integer getProposalNumber() {
		return proposalNumber;
	}
	public void setProposalNumber(Integer proposalNumber) {
		this.proposalNumber = proposalNumber;
	}
	@Override
	public String toString() {
		return "GeneralLedger [gl_id=" + gl_id + ", kmId=" + kmId + ", deposit=" + deposit + ", productClassification="
				+ productClassification + ", salesMan=" + salesMan + ", dataTime=" + dataTime + ", orderNeedSum="
				+ orderNeedSum + ", storageSum=" + storageSum + ", checkoutSum=" + checkoutSum + ", stockSum="
				+ stockSum + ", stockCaseSum=" + stockCaseSum + ", needStage=" + needStage + ", preExportNumber="
				+ preExportNumber + ", availableNumber=" + availableNumber + ", beforeYear=" + beforeYear
				+ ", averageMouth2020=" + averageMouth2020 + ", averageMouth=" + averageMouth + ", orderNumber="
				+ orderNumber + ", storageNumber=" + storageNumber + ", checkoutNumber=" + checkoutNumber
				+ ", lowMiniNeed=" + lowMiniNeed + ", outHighNeed=" + outHighNeed + ", proposalNumber=" + proposalNumber
				+ "]";
	}
    
    
}

