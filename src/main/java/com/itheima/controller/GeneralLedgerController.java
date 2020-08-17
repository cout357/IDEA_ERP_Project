package com.itheima.controller;

import java.lang.reflect.Field;
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
import com.itheima.model.GeneralLedger;
import com.itheima.model.GeneralLedgerTotalInfo;
import com.itheima.model.OrdersAndJournalTotalInfo;
import com.itheima.otherClass.UtilFunc;
import com.itheima.service.GeneralLedgerService;
import com.itheima.service.OrdersAndJournalService;

@Controller
@RequestMapping("GeneralLedgerCT")
public class GeneralLedgerController {
	@Autowired
	private GeneralLedgerService gService;
	
	@RequestMapping("limitQuery")
	public String limitQuery(@RequestParam(defaultValue = "0")Integer pageIdx,@RequestParam(defaultValue = "30")Integer pageDataCount,Model model) {
		List<GeneralLedger> generalLedgers = gService.limitQuery(pageIdx,pageDataCount);
		GeneralLedgerTotalInfo totalInfo = gService.queryTotalInfo();
		model.addAttribute("generalLedgers", generalLedgers);
		model.addAttribute("pageIdx",pageIdx);
		model.addAttribute("pageDataCount",pageDataCount);
		model.addAttribute("dataCount",gService.findCount());
		model.addAttribute("totalInfo",totalInfo);
		model.addAttribute("totalInfoRefreshTime", UtilFunc.getTime());
		System.out.println("limitQuery_gl:"+generalLedgers);
		return "MaterialControl-DynamicGeneralLedger";
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
		int count = gService.findScreenCount(screenInfo);
		//如果筛选后当前页大于筛选条件下的最大页，就把当前页改为最大页
		pageIdx = count>pageIdx*pageDataCount?pageIdx:(count-1)/pageDataCount;
		List<GeneralLedger> generalLedgers = gService.completeQuery(screenInfo,pageIdx,pageDataCount);
		HashMap hash = new HashMap();
		hash.put("generalLedgers", generalLedgers);
		hash.put("pageIdx",pageIdx);
		hash.put("dataCount", count);
		return hash;
	}
	
	//返回统计信息
	@RequestMapping("totalInfo")
	@ResponseBody
	public HashMap totalInfo() {
		HashMap hash = new HashMap();
		GeneralLedgerTotalInfo totalInfo = gService.queryTotalInfo();
		hash.put("totalInfo", totalInfo);
		hash.put("refreshTime", UtilFunc.getTime());
		return hash;
	}
	
	@RequestMapping("dataColValues")
	@ResponseBody
	public List<String> dataColValue(Integer colIdx){
		System.out.println("colIdx:"+colIdx);
		return gService.findColValues(colIdx);
	}

	@RequestMapping("add")
	@ResponseBody			//要返回Integer就需要加这个注解
	public Integer add(@RequestBody List<GeneralLedger> datas) {
		System.out.println("要添加的数据:"+datas);
		int count = gService.adds(datas);
		return count;
	}
	@RequestMapping("del")
	@ResponseBody			//要返回Integer就需要加这个注解
	public Integer del(@RequestBody List<Integer> ids) {
		System.out.println("要删除的数据:"+ids);
		int count = gService.dels(ids);
		return count;
	}
	@RequestMapping("findById")
	@ResponseBody
	public GeneralLedger findById(Integer id) {
		GeneralLedger gl = gService.findById(id);
		return gl;
	}
	@RequestMapping("edit")
	@ResponseBody
	public boolean edit(@RequestBody GeneralLedger data) {
//		data.setVersion(data.getVersion()+1);
		return gService.edit(data);
	}
	
	@RequestMapping("export")
	@ResponseBody
	public HashMap export(@RequestBody List<String> screenInfo) {
		List<GeneralLedger> generalLedgers = gService.completeQuery(screenInfo);
		System.out.println(generalLedgers);

		String url ="http://192.168.1.142:5000/DynamicBill?";

		for (int i=0; i<generalLedgers.size();i++){
			if (i==0){
				url=url+ "id="+String.valueOf(generalLedgers.get(i).getGl_id());
			}else {
				url = url + "&id=" + String.valueOf(generalLedgers.get(i).getGl_id());
			}
		}

		System.out.println("url = "+ url);

		System.out.println("--------------------------");
		HashMap hash = new HashMap();
		hash.put("url",url);
		return hash;
	}
}
