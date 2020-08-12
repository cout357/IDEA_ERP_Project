package com.itheima.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.model.CustomerInfo;
import com.itheima.otherClass.QueryInfo;
import com.itheima.service.CustomerInfoService;

@Controller
@RequestMapping("CustomerInfoCT")
public class CustomerInfoController {
	@Autowired
	private CustomerInfoService cService;
	
	@RequestMapping("allQuery")
	public String findAll(Model model) {
		List<CustomerInfo> customerInfos = cService.findAll();
		model.addAttribute("customerInfos", customerInfos);
		model.addAttribute("pageIdx",0);
		model.addAttribute("dataCount",cService.findCount());
		return "basic-customer";
	}
	@RequestMapping("limitQuery")
	public String limitQuery(@RequestParam(defaultValue = "0")Integer pageIdx,@RequestParam(defaultValue = "30")Integer pageDataCount,Model model) {
		List<CustomerInfo> customerInfos = cService.limitQuery(pageIdx,pageDataCount);
		model.addAttribute("customerInfos", customerInfos);
		model.addAttribute("pageIdx",pageIdx);
		model.addAttribute("pageDataCount",pageDataCount);
		model.addAttribute("dataCount",cService.findCount());
		return "Basic-customer";
	}
	@RequestMapping("findById")
	@ResponseBody
	public CustomerInfo findById(Integer id) {
		CustomerInfo customer = cService.findById(id);
		return customer;
	}
	@RequestMapping("completeQuery")
	@ResponseBody
	public HashMap customerSort(@RequestBody List<String> screenInfo,@RequestParam Integer pageIdx,@RequestParam Integer pageDataCount){
		System.out.println(" pageIdx:"+pageDataCount+" pageDataCount:"+pageDataCount + "screenInfo:" + screenInfo);
		int count = cService.findScreenCount(screenInfo);
		//如果筛选后当前页大于筛选条件下的最大页，就把当前页改为最大页
		pageIdx = count>pageIdx*pageDataCount?pageIdx:(count-1)/pageDataCount;
		List<CustomerInfo> customerInfos = cService.completeQuery(screenInfo,pageIdx,pageDataCount);
		HashMap hash = new HashMap();
		hash.put("customerInfos", customerInfos);
		hash.put("pageIdx",pageIdx);
		hash.put("dataCount", count);
		System.out.println("--------排序后---------");
		System.out.println(customerInfos);
		
		return hash;
	}
	@RequestMapping("dataColValues")
	@ResponseBody
	public List<String> dataColValue(Integer colIdx){
		System.out.println("colIdx:"+colIdx);
		return cService.findColValues(colIdx);
	}
	
	@RequestMapping("add")
	@ResponseBody			//要返回Integer就需要加这个注解
	public Integer add(@RequestBody List<CustomerInfo> datas) {
		System.out.println("要添加的数据:"+datas);
		int count = cService.adds(datas);
		return count;
	}
	@RequestMapping("del")
	@ResponseBody			//要返回Integer就需要加这个注解
	public Integer del(@RequestBody List<Integer> ids) {
		System.out.println("要删除的数据:"+ids);
		int count = cService.dels(ids);
		return count;
	}
	@RequestMapping("edit")
	@ResponseBody
	public Integer edit(@RequestBody CustomerInfo data) {
		return cService.edit(data);
	}
}
