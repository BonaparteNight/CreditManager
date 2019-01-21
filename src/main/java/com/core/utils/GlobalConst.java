package com.core.utils;

import java.io.Serializable;



@SuppressWarnings({ "serial"})
public class GlobalConst implements Serializable {
	 
	public static long stime = 1800000;//超时时长（毫秒）   
	public static boolean isDebug = true; 
	public static final int NUMBERS_PER_PAGE = 15;
	public static final String DIALECT = "MYSQL";
	public static String DATE_PATTERN_YMDHMS = "yyyy-MM-dd HH:mm:ss";
	public static final String SESSION_KEY = "myssm_session";//系统session键值常量
	public static final String DB_NAME = "";
	
	
}
