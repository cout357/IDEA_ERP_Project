package com.itheima.model;

public class GeneralLedgerTotalInfo {
	private String startData;
	private Integer startDay;
	private Integer noOrderAmount    ;
	private Integer noOrderInventory   ;
	private Integer errorDataItem         ;
	private Integer totalNumber        ;
	private Integer totalNumberIncoming    ;
	private Integer actualNumberWarehouses    ;
	private Integer prepareQuantity   ;
	private Integer conclusionDepositNumber   ;
	private Integer totalStorageFrequency   ;
	private Integer totalOutboundFrequency    ;
	private Integer warehousingSpecies    ;
	private Integer outboundSpecies   ;
	private Integer totalOrderDemand       ;
	private Integer lackOfLoans       ;
	private Integer lackOfCreditNumber       ;
	public String getStartData() {
		return startData;
	}
	public void setStartData(String startData) {
		this.startData = startData;
	}
	public Integer getStartDay() {
		return startDay;
	}
	public void setStartDay(Integer startDay) {
		this.startDay = startDay;
	}
	public Integer getNoOrderAmount() {
		return noOrderAmount;
	}
	public void setNoOrderAmount(Integer noOrderAmount) {
		this.noOrderAmount = noOrderAmount;
	}
	public Integer getNoOrderInventory() {
		return noOrderInventory;
	}
	public void setNoOrderInventory(Integer noOrderInventory) {
		this.noOrderInventory = noOrderInventory;
	}
	public Integer getErrorDataItem() {
		return errorDataItem;
	}
	public void setErrorDataItem(Integer errorDataItem) {
		this.errorDataItem = errorDataItem;
	}
	public Integer getTotalNumber() {
		return totalNumber;
	}
	public void setTotalNumber(Integer totalNumber) {
		this.totalNumber = totalNumber;
	}
	public Integer getTotalNumberIncoming() {
		return totalNumberIncoming;
	}
	public void setTotalNumberIncoming(Integer totalNumberIncoming) {
		this.totalNumberIncoming = totalNumberIncoming;
	}
	public Integer getActualNumberWarehouses() {
		return actualNumberWarehouses;
	}
	public void setActualNumberWarehouses(Integer actualNumberWarehouses) {
		this.actualNumberWarehouses = actualNumberWarehouses;
	}
	public Integer getPrepareQuantity() {
		return prepareQuantity;
	}
	public void setPrepareQuantity(Integer prepareQuantity) {
		this.prepareQuantity = prepareQuantity;
	}
	public Integer getConclusionDepositNumber() {
		return conclusionDepositNumber;
	}
	public void setConclusionDepositNumber(Integer conclusionDepositNumber) {
		this.conclusionDepositNumber = conclusionDepositNumber;
	}
	public Integer getTotalStorageFrequency() {
		return totalStorageFrequency;
	}
	public void setTotalStorageFrequency(Integer totalStorageFrequency) {
		this.totalStorageFrequency = totalStorageFrequency;
	}
	public Integer getTotalOutboundFrequency() {
		return totalOutboundFrequency;
	}
	public void setTotalOutboundFrequency(Integer totalOutboundFrequency) {
		this.totalOutboundFrequency = totalOutboundFrequency;
	}
	public Integer getWarehousingSpecies() {
		return warehousingSpecies;
	}
	public void setWarehousingSpecies(Integer warehousingSpecies) {
		this.warehousingSpecies = warehousingSpecies;
	}
	public Integer getOutboundSpecies() {
		return outboundSpecies;
	}
	public void setOutboundSpecies(Integer outboundSpecies) {
		this.outboundSpecies = outboundSpecies;
	}
	public Integer getTotalOrderDemand() {
		return totalOrderDemand;
	}
	public void setTotalOrderDemand(Integer totalOrderDemand) {
		this.totalOrderDemand = totalOrderDemand;
	}
	public Integer getLackOfLoans() {
		return lackOfLoans;
	}
	public void setLackOfLoans(Integer lackOfLoans) {
		this.lackOfLoans = lackOfLoans;
	}
	public Integer getLackOfCreditNumber() {
		return lackOfCreditNumber;
	}
	public void setLackOfCreditNumber(Integer lackOfCreditNumber) {
		this.lackOfCreditNumber = lackOfCreditNumber;
	}
	@Override
	public String toString() {
		return "GeneralLedgerControllerTotalInfo [startData=" + startData + ", startDay=" + startDay
				+ ", noOrderAmount=" + noOrderAmount + ", noOrderInventory=" + noOrderInventory + ", errorDataItem="
				+ errorDataItem + ", totalNumber=" + totalNumber + ", totalNumberIncoming=" + totalNumberIncoming
				+ ", actualNumberWarehouses=" + actualNumberWarehouses + ", prepareQuantity=" + prepareQuantity
				+ ", conclusionDepositNumber=" + conclusionDepositNumber + ", totalStorageFrequency="
				+ totalStorageFrequency + ", totalOutboundFrequency=" + totalOutboundFrequency + ", warehousingSpecies="
				+ warehousingSpecies + ", outboundSpecies=" + outboundSpecies + ", totalOrderDemand=" + totalOrderDemand
				+ ", lackOfLoans=" + lackOfLoans + ", lackOfCreditNumber=" + lackOfCreditNumber + "]";
	}
	
	
}
