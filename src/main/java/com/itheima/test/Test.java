package com.itheima.test;

import java.lang.reflect.Field;

import com.itheima.model.GeneralLedger;
import com.itheima.model.OrdersAndJournal;
import com.itheima.otherClass.QueryInfo;

public class Test {
	private static String[] dbName = {"序号","产品编号/名称","固定存放库位","产品分类","业务员","盘点数据确认日期",
			"订单总需求数","入库累计数","实际出库累计数","当前可用库存数","当前库存箱数","需求匹配状态","备货数量",
			"备货后可用库存数","19年标准库存","20年月均用量","月均单数","订单张数","入库频次","出库频次","低于最低库存预警款数",
			"高于最大库存总款数","建议投产数量"};
	public static void test1() {
		QueryInfo qbc = new QueryInfo();
		Field[] fs = QueryInfo.class.getDeclaredFields();
		for(int i = 0;i < fs.length;i++) {
			System.out.println(fs[i].getName());
		}
	}
	public static void test2() {
		Field[] fs = GeneralLedger.class.getDeclaredFields();
		for(int i = 0;i < fs.length;i++) {
//			System.out.printf("%s=#{%s},\n",fs[i].getName(),fs[i].getName());
//			System.out.printf("%s='${%s}',\n",fs[i].getName(),fs[i].getName());
//			System.out.printf("$vals.eq(%d).html(datas[i].%s);\n",i,fs[i].getName());
			System.out.printf("%-20s$editTbody.find(\".%s\").val(),\n",fs[i].getName()+":",fs[i].getName());
//			System.out.printf("$editTbody.find(\".%s\").val(data.%s);\n",fs[i].getName(),fs[i].getName());
//			System.out.printf("									<th class=\"hor val\">${db.%s }</th>\n",fs[i].getName());
//			System.out.printf("%-25s$data.find('.%s').val(),\n",fs[i].getName()+":",fs[i].getName());
		}
	}
	public static void putName() {
		for(int i = 0;i < dbName.length;i++) {
			System.out.printf("		<th class=\"colname-th\"><span class=\"colname-text numCol\">%s</span>\r\n" + 
					"			<div class=\"menu\">\r\n" + 
					"				<span class=\"sortSign iconfont\">&#xe660;</span><br/>\r\n" + 
					"				<span class=\"sort-cancel iconfont\">一</span><br/>\r\n" + 
					"			</div>\r\n" + 
					"		</th>\n",dbName[i]);
		}
		
	}
	public static void main(String[] args) {
		test2();
//		putName();
	}
}
