package com.itheima.controller;

import java.io.IOException;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itheima.model.OrdersAndJournalTotalInfo;
import com.itheima.otherClass.UtilFunc;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itheima.model.CustomerInfo;
import com.itheima.model.GeneralLedger;
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
		OrdersAndJournalTotalInfo totalInfo = oService.queryTotalInfo();
		
		model.addAttribute("ordersAndJournals", ordersAndJournals);
		model.addAttribute("pageIdx",pageIdx);
		model.addAttribute("pageDataCount",pageDataCount);
		model.addAttribute("dataCount",oService.findCount());
		model.addAttribute("totalInfo", totalInfo);
		model.addAttribute("totalInfoRefreshTime", UtilFunc.getTime());
		return "MaterialControl-ordersAndJournal";
	}
	
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
	
	//返回统计信息
	@RequestMapping("totalInfo")
	@ResponseBody
	public HashMap totalInfo() {
		HashMap hash = new HashMap();
		OrdersAndJournalTotalInfo totalInfo = oService.queryTotalInfo();
		hash.put("totalInfo", totalInfo);
		hash.put("refreshTime", UtilFunc.getTime());
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
		//在获取最大id后到插入表中期间，如果有新数据添加进表，可能会出现重复订单编号的情况
		//如果用时间+随机数的方式生成订单编号可以避免这一问题
		Integer maxId = oService.findMaxId();
		maxId = maxId==null?0:maxId;
		for(OrdersAndJournal data:datas) {
			data.setOrderId("KM"+(++maxId));
		}
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
	@RequestMapping("export")
	@ResponseBody
	public HashMap export(@RequestBody List<String> screenInfo,Integer putDataCount){
		List<OrdersAndJournal> datas = oService.completeQuery(screenInfo,0,putDataCount);
		String url ="http://" +UtilFunc.getRealIP() + ":5000/OrderCurrentAccount?";

		for (int i=0; i<datas.size();i++){
			if (i==0){
				url=url+ "id="+String.valueOf(datas.get(i).getOaj_id());
			}else {
				url = url + "&id=" + String.valueOf(datas.get(i).getOaj_id());
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
        List<OrdersAndJournal> datas = oService.completeQuery(screenInfo,0,putDataCount);

        HashMap hash = new HashMap();
        hash.put("title",title);
        hash.put("colNames",colNames);
        hash.put("datas",datas);

        return hash;
    }

}