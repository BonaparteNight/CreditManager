package com.core.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateUtils {

	/**日期格式转换**/
	public static String dateTimeFormat(String dateTime,String pattern) {
		try {
			if("".equals(dateTime)){
				return null;
			}
			SimpleDateFormat sdf = new SimpleDateFormat(pattern);
			return sdf.format(sdf.parse(dateTime));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String dateTimeFormatToNull(String dateTime) {
		if("".equals(dateTime)){
			return null;
		}
		return dateTime;
	}
	
    public static Date stringToDate(String str) {  
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        Date date = null;  
        try {  
            date = format.parse(str);   
        } catch (ParseException e) {  
            e.printStackTrace();  
        }  
        date = java.sql.Date.valueOf(str);  
        return date;  
    }  
    
    public static String getNowTime(String format){
    	Date now = new Date();
    	SimpleDateFormat dateFormat = new SimpleDateFormat(format);//可以方便地修改日期格式
    	String hehe = dateFormat.format(now);
    	return hehe;
    }
    
    public static String getPreMonth(String formatString){
    		Calendar c = Calendar.getInstance();
    	   c.add(Calendar.MONTH, -1);
    	   SimpleDateFormat format =  new SimpleDateFormat(formatString);
    	   String time = format.format(c.getTime());
    	   return time;
    }
    
    public static Date stringToDate(String str,String formats) {  
        DateFormat format = new SimpleDateFormat(formats);  
        Date date = null;  
        try {  
            date = format.parse(str);   
        } catch (ParseException e) {  
            e.printStackTrace();  
        }  
        date = java.sql.Date.valueOf(str);  
        return date;  
    } 
    
    public static String getPrvTime(String format){ //获取昨天的时间
    	Date prve = new Date(new Date().getTime()-24*60*60*1000);
    	SimpleDateFormat dateFormat = new SimpleDateFormat(format);
    	String hehe = dateFormat.format(prve);
    	return hehe;
    }
}
