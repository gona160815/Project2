package main.java.sixsix.trytry;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;

public class Todaywhatweek {
	final static LocalDateTime currentPoint = LocalDateTime.now(); //直接使用LocalDateTime類別來取得日期與時間
	public static void main(String[] args) {
		String strDate = "2017-11-17";// 定義日期字串  
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");// 定義日期格式  
        Date date = null;  
        try {  
            date = format.parse(strDate);// 將字串轉換為日期  
        } catch (ParseException e) {  
            System.out.println("輸入的日期格式不合理!");  
        }  
        
        
        System.out.println(currentPoint);
        
//		System.out.println(new Date());
		System.out.println(getWeek(date));
		System.out.println(new Date());
		System.out.println(getWeek(new Date()));
	}
	public static String getWeek(Date date) {  
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE");  
        String week = sdf.format(date);  
        return week;  
    } 
}
