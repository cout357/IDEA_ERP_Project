package com.itheima.controller;

import java.io.IOException;
import java.lang.reflect.Field;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import com.itheima.model.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		return "MaterialControl-dynamicGeneralLedger";
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
		//??????????????????????????????????????????????????????????????????????????????????????????
		pageIdx = count>pageIdx*pageDataCount?pageIdx:(count-1)/pageDataCount;
		List<GeneralLedger> generalLedgers = gService.completeQuery(screenInfo,pageIdx,pageDataCount);
		HashMap hash = new HashMap();
		hash.put("generalLedgers", generalLedgers);
		hash.put("pageIdx",pageIdx);
		hash.put("dataCount", count);
		return hash;
	}
	
	//??????????????????
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
	@ResponseBody			//?????????Integer????????????????????????
	public Integer add(@RequestBody List<GeneralLedger> datas) {
		System.out.println("??????????????????:"+datas);
		int count = gService.adds(datas);
		return count;
	}
	@RequestMapping("del")
	@ResponseBody			//?????????Integer????????????????????????
	public Integer del(@RequestBody List<Integer> ids) {
		System.out.println("??????????????????:"+ids);
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
	public HashMap export(@RequestBody List<String> screenInfo,Integer putDataCount) {
		List<GeneralLedger> datas = gService.completeQuery(screenInfo,0,putDataCount);
		String url ="http://" +UtilFunc.getRealIP() + ":5000/OrderCurrentAccount?";

		for (int i=0; i<datas.size();i++){
			if (i==0){
				url=url+ "id="+String.valueOf(datas.get(i).getGl_id());
			}else {
				url = url + "&id=" + String.valueOf(datas.get(i).getGl_id());
			}
		}

		System.out.println("url ==========" +url);
		System.out.println("--------------------------");
		HashMap hash = new HashMap();
		hash.put("url",url);
		return hash;
	}

	@RequestMapping("printing")
	@ResponseBody
	public HashMap printing(@RequestBody List<String> infoPackage,String title,Integer putDataCount,Model model){
		List<String> colNames = new ArrayList<String>();
		List<String> screenInfo;
		infoPackage.remove(0);
		for(int i = 0;i < infoPackage.size();) {
			if("orderItems".equals(infoPackage.get(i)))break;
			colNames.add(infoPackage.get(i));
			infoPackage.remove(i);
		}
		screenInfo = infoPackage;
		List<GeneralLedger> datas = gService.completeQuery(screenInfo,0,putDataCount);

		HashMap hash = new HashMap();
		hash.put("title",title);
		hash.put("colNames",colNames);
		hash.put("datas",datas);

		return hash;
	}

}
