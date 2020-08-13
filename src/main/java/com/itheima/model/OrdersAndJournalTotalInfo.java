package com.itheima.model;

public class OrdersAndJournalTotalInfo {
	private Integer tardinessSingular;
	private Integer tardinessNumber    ;
	private Integer inventoryError       ;
	private Integer orderError           ;
	private String startData        ;
	private Integer startDay         ;
	private Integer advanceDeliveryNumber    ;
	private Integer advanceDeliverySingular   ;
	private Integer sumOrderNeed    ;
	private Integer totalNumberIncoming    ;
	private Integer sumDelivery    ;
	private Integer readyForDelivery   ;
	private Integer totalNumberOutbound    ;
	private Integer storageNumber     ;
	private Integer unitsWithoutEarlyWarningNumberIssued    ;
	private Integer aUnitOfDebtIsInvolved    ;
	public Integer getTardinessSingular() {
		return tardinessSingular;
	}
	public void setTardinessSingular(Integer tardinessSingular) {
		this.tardinessSingular = tardinessSingular;
	}
	public Integer getTardinessNumber() {
		return tardinessNumber;
	}
	public void setTardinessNumber(Integer tardinessNumber) {
		this.tardinessNumber = tardinessNumber;
	}
	public Integer getInventoryError() {
		return inventoryError;
	}
	public void setInventoryError(Integer inventoryError) {
		this.inventoryError = inventoryError;
	}
	public Integer getOrderError() {
		return orderError;
	}
	public void setOrderError(Integer orderError) {
		this.orderError = orderError;
	}
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
	public Integer getAdvanceDeliveryNumber() {
		return advanceDeliveryNumber;
	}
	public void setAdvanceDeliveryNumber(Integer advanceDeliveryNumber) {
		this.advanceDeliveryNumber = advanceDeliveryNumber;
	}
	public Integer getAdvanceDeliverySingular() {
		return advanceDeliverySingular;
	}
	public void setAdvanceDeliverySingular(Integer advanceDeliverySingular) {
		this.advanceDeliverySingular = advanceDeliverySingular;
	}
	public Integer getSumOrderNeed() {
		return sumOrderNeed;
	}
	public void setSumOrderNeed(Integer sumOrderNeed) {
		this.sumOrderNeed = sumOrderNeed;
	}
	public Integer getTotalNumberIncoming() {
		return totalNumberIncoming;
	}
	public void setTotalNumberIncoming(Integer totalNumberIncoming) {
		this.totalNumberIncoming = totalNumberIncoming;
	}
	public Integer getSumDelivery() {
		return sumDelivery;
	}
	public void setSumDelivery(Integer sumDelivery) {
		this.sumDelivery = sumDelivery;
	}
	public Integer getReadyForDelivery() {
		return readyForDelivery;
	}
	public void setReadyForDelivery(Integer readyForDelivery) {
		this.readyForDelivery = readyForDelivery;
	}
	public Integer getTotalNumberOutbound() {
		return totalNumberOutbound;
	}
	public void setTotalNumberOutbound(Integer totalNumberOutbound) {
		this.totalNumberOutbound = totalNumberOutbound;
	}
	public Integer getStorageNumber() {
		return storageNumber;
	}
	public void setStorageNumber(Integer storageNumber) {
		this.storageNumber = storageNumber;
	}
	public Integer getUnitsWithoutEarlyWarningNumberIssued() {
		return unitsWithoutEarlyWarningNumberIssued;
	}
	public void setUnitsWithoutEarlyWarningNumberIssued(Integer unitsWithoutEarlyWarningNumberIssued) {
		this.unitsWithoutEarlyWarningNumberIssued = unitsWithoutEarlyWarningNumberIssued;
	}
	public Integer getaUnitOfDebtIsInvolved() {
		return aUnitOfDebtIsInvolved;
	}
	public void setaUnitOfDebtIsInvolved(Integer aUnitOfDebtIsInvolved) {
		this.aUnitOfDebtIsInvolved = aUnitOfDebtIsInvolved;
	}
	@Override
	public String toString() {
		return "OrdersAndJournalTotalInfo [tardinessSingular=" + tardinessSingular + ", tardinessNumber="
				+ tardinessNumber + ", inventoryError=" + inventoryError + ", orderError=" + orderError + ", startData="
				+ startData + ", startDay=" + startDay + ", advanceDeliveryNumber=" + advanceDeliveryNumber
				+ ", advanceDeliverySingular=" + advanceDeliverySingular + ", sumOrderNeed=" + sumOrderNeed
				+ ", totalNumberIncoming=" + totalNumberIncoming + ", sumDelivery=" + sumDelivery
				+ ", readyForDelivery=" + readyForDelivery + ", totalNumberOutbound=" + totalNumberOutbound
				+ ", storageNumber=" + storageNumber + ", unitsWithoutEarlyWarningNumberIssued="
				+ unitsWithoutEarlyWarningNumberIssued + ", aUnitOfDebtIsInvolved=" + aUnitOfDebtIsInvolved + "]";
	}
	
	
}
