package com.itheima.otherClass;

import com.itheima.model.CustomerInfo;

public class CustomerInfoPageRet {
	private CustomerInfo customerInfos;
	private Integer pageIdx;
	public CustomerInfo getCustomerInfos() {
		return customerInfos;
	}
	public void setCustomerInfos(CustomerInfo customerInfos) {
		this.customerInfos = customerInfos;
	}
	public Integer getPageIdx() {
		return pageIdx;
	}
	public void setPageIdx(Integer pageIdx) {
		this.pageIdx = pageIdx;
	}
	public CustomerInfoPageRet(CustomerInfo customerInfos, Integer pageIdx) {
		super();
		this.customerInfos = customerInfos;
		this.pageIdx = pageIdx;
	}
	
}
