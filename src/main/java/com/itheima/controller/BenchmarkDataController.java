package com.itheima.controller;

import com.itheima.mapper.BenchmarkDataMapper;
import com.itheima.model.BenchmarkData;
import com.itheima.model.BenchmarkDataTotalInfo;
import com.itheima.model.CustomerInfo;
import com.itheima.model.GeneralLedger;
import com.itheima.model.GeneralLedgerTotalInfo;
import com.itheima.otherClass.UtilFunc;
import com.itheima.service.BenchmarkDataService;
import com.itheima.service.GeneralLedgerService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.security.RolesAllowed;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("BenchmarkDataCT")
public class BenchmarkDataController {

    @Autowired
    private BenchmarkDataService benchmarkDataService;
	@Autowired
	private GeneralLedgerService gService;

    @RequestMapping("limitQuery")
    public String limitQuery(@RequestParam(defaultValue = "0")Integer pageIdx, @RequestParam(defaultValue = "30")Integer pageDataCount, Model model) {
        List<BenchmarkData> datas = benchmarkDataService.limitQuery(pageIdx,pageDataCount);
        HashMap hash = totalInfo();
        model.addAttribute("datas", datas);
        model.addAttribute("pageIdx",pageIdx);
        model.addAttribute("pageDataCount",pageDataCount);
        model.addAttribute("dataCount",benchmarkDataService.findCount());
        model.addAttribute("totalInfo", hash.get("totalInfo"));
        model.addAttribute("refreshTime", hash.get("refreshTime"));
        return "MaterialControl-benchmarkData";
    }
    @RequestMapping("findById")
    @ResponseBody
    public BenchmarkData findById(Integer id) {
        BenchmarkData customer = benchmarkDataService.findById(id);
        return customer;
    }
    @RequestMapping("completeQuery")
    @ResponseBody
    public HashMap customerSort(@RequestBody List<String> screenInfo, @RequestParam Integer pageIdx, @RequestParam Integer pageDataCount){
        System.out.println(" pageIdx:"+pageDataCount+" pageDataCount:"+pageDataCount + "screenInfo:" + screenInfo);
        int count = benchmarkDataService.findScreenCount(screenInfo);
        //如果筛选后当前页大于筛选条件下的最大页，就把当前页改为最大页
        pageIdx = count>pageIdx*pageDataCount?pageIdx:(count-1)/pageDataCount;
        List<BenchmarkData> datas = benchmarkDataService.completeQuery(screenInfo,pageIdx,pageDataCount);
        HashMap hash = new HashMap();
        hash.put("datas", datas);
        hash.put("pageIdx",pageIdx);
        hash.put("dataCount", count);

        return hash;
    }
    
	
	//返回统计信息
	@RequestMapping("totalInfo")
	@ResponseBody
	public HashMap totalInfo() {
		HashMap hash = new HashMap();
		BenchmarkDataTotalInfo totalInfo = benchmarkDataService.queryTotalInfo();
		hash.put("totalInfo", totalInfo);
		hash.put("refreshTime", UtilFunc.getTime());
		return hash;
	}
    @RequestMapping("dataColValues")
    @ResponseBody
    public List<String> dataColValue(Integer colIdx){
        System.out.println("colIdx:"+colIdx);
        return benchmarkDataService.findColValues(colIdx);
    }

    @RequestMapping("queryKMId")
    @ResponseBody
    public List<String> queryKMId(){
        List<String> vals = benchmarkDataService.queryKMId();
        return vals;
    }
    @RequestMapping("add")
    @RolesAllowed({"ROLE_SUPER","ROLE_ROOT"})
    @ResponseBody			//要返回Integer就需要加这个注解
    public Integer add(@RequestBody List<BenchmarkData> datas) {
        System.out.println("要添加的数据:"+datas);
        int count = benchmarkDataService.adds(datas);
        //基准资料中每添加一条，动态总帐中也需要添加一条
        List<GeneralLedger> gls = new ArrayList<GeneralLedger>();
        GeneralLedger gl;
        for(BenchmarkData bk:datas) {
            gl = new GeneralLedger();
            gl.setKmId(bk.getKangMingId());
        	gls.add(gl);
        }
        gService.adds(gls);
        return count;
    }
    @RequestMapping("del")
    @RolesAllowed({"ROLE_SUPER","ROLE_ROOT"})
    @ResponseBody			//要返回Integer就需要加这个注解
    public Integer del(@RequestBody List<Integer> ids) {
        System.out.println("要删除的数据:"+ids);
        int count = benchmarkDataService.dels(ids);
        return count;
    }

    @RequestMapping("edit")
    @RolesAllowed({"ROLE_SUPER","ROLE_ROOT"})
    @ResponseBody
    public Integer edit(@RequestBody BenchmarkData data) {
        return benchmarkDataService.edit(data);
    }

    @RequestMapping("export")
    @ResponseBody
    public HashMap export(@RequestBody List<String> screenInfo,Integer putDataCount) {
        List<BenchmarkData> datas = benchmarkDataService.completeQuery(screenInfo,0,putDataCount);
        String url ="http://" +UtilFunc.getRealIP() + ":5000/OrderCurrentAccount?";

        for (int i=0; i<datas.size();i++){
            if (i==0){
                url=url+ "id="+String.valueOf(datas.get(i).getId());
            }else {
                url = url + "&id=" + String.valueOf(datas.get(i).getId());
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
        List<BenchmarkData> datas = benchmarkDataService.completeQuery(screenInfo,0,putDataCount);

        HashMap hash = new HashMap();
        hash.put("title",title);
        hash.put("colNames",colNames);
        hash.put("datas",datas);

        return hash;
    }


}
