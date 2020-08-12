package com.itheima.controller;

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
import com.itheima.model.OrdersAndJournal;
import com.itheima.service.OrdersAndJournalService;

@Controller
@RequestMapping("OrdersAndJournalCT")
public class OrdersAndJournalController {
	@Autowired
	private OrdersAndJournalService oService;
	
	@RequestMapping("limitQuery")
	public String limitQuery(@RequestParam(defaultValue = "0")Integer pageIdx,@RequestParam(defaultValue = "30")Integer pageDataCount,Model model) {
		List<OrdersAndJournal> ordersAndJournals = oService.limitQuery(pageIdx,pageDataCount);
		model.addAttribute("ordersAndJournals", ordersAndJournals);
		model.addAttribute("pageIdx",pageIdx);
		model.addAttribute("pageDataCount",pageDataCount);
		model.addAttribute("dataCount",oService.findCount());
		return "MaterialControl-ordersAndJournal";
	}
	/*
	@RequestMapping("findById")
	@ResponseBody
	public CustomerInfo findById(Integer id) {
		CustomerInfo customer = cService.findById(id);
		return customer;
	}
	*/
	@RequestMapping("completeQuery")
	@ResponseBody
	public HashMap customerSort(@RequestBody List<String> screenInfo,@RequestParam Integer pageIdx,@RequestParam Integer pageDataCount){
		System.out.println(" pageIdx:"+pageDataCount+" pageDataCount:"+pageDataCount + "screenInfo:" + screenInfo);
		int count = oService.findScreenCount(screenInfo);
		//如果筛选后当前页大于筛选条件下的最大页，就把当前页改为最大页
		pageIdx = count>pageIdx*pageDataCount?pageIdx:(count-1)/pageDataCount;
		List<OrdersAndJournal> ordersAndJournals = oService.completeQuery(screenInfo,pageIdx,pageDataCount);
		HashMap hash = new HashMap();
		hash.put("ordersAndJournals", ordersAndJournals);
		hash.put("pageIdx",pageIdx);
		hash.put("dataCount", count);
		
		return hash;
	}

	@RequestMapping("dataColValues")
	@ResponseBody
	public List<String> dataColValue(Integer colIdx){
		System.out.println("colIdx:"+colIdx);
		return oService.findColValues(colIdx);
	}

	@RequestMapping("add")
	@ResponseBody			//要返回Integer就需要加这个注解
	public Integer add(@RequestBody List<OrdersAndJournal> datas) {
		System.out.println("要添加的数据:"+datas);
		int count = oService.adds(datas);
		return count;
	}
	@RequestMapping("del")
	@ResponseBody			//要返回Integer就需要加这个注解
	public Integer del(@RequestBody List<Integer> ids) {
		System.out.println("要删除的数据:"+ids);
		int count = oService.dels(ids);
		return count;
	}
	@RequestMapping("findById")
	@ResponseBody
	public OrdersAndJournal findById(Integer id) {
		OrdersAndJournal oaj = oService.findById(id);
		return oaj;
	}
	@RequestMapping("edit")
	@ResponseBody
	public boolean edit(@RequestBody OrdersAndJournal data) {
		data.setVersion(data.getVersion()+1);
		return oService.edit(data);
	}
}
