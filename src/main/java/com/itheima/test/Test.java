package com.itheima.test;

import java.lang.reflect.Field;

import com.itheima.model.GeneralLedger;
import com.itheima.model.OrdersAndJournal;
import com.itheima.otherClass.QueryInfo;

public class Test {
	private static String[] dbName = {"���","��Ʒ���/����","�̶���ſ�λ","��Ʒ����","ҵ��Ա","�̵�����ȷ������",
			"������������","����ۼ���","ʵ�ʳ����ۼ���","��ǰ���ÿ����","��ǰ�������","����ƥ��״̬","��������",
			"��������ÿ����","19���׼���","20���¾�����","�¾�����","��������","���Ƶ��","����Ƶ��","������Ϳ��Ԥ������",
			"����������ܿ���","����Ͷ������"};
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
					"				<span class=\"sort-cancel iconfont\">һ</span><br/>\r\n" + 
					"			</div>\r\n" + 
					"		</th>\n",dbName[i]);
		}
		
	}
	public static void main(String[] args) {
		test2();
//		putName();
	}
}
