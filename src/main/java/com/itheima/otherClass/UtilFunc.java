package com.itheima.otherClass;

import java.text.SimpleDateFormat;
import java.util.Date;

public class UtilFunc {
	public static String getTime() {
        SimpleDateFormat df = new SimpleDateFormat("HH:mm:ss");//设置日期格式
        return df.format(new Date());			// new Date()为获取当前系统时间
	}
}
