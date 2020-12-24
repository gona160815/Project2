package main.java.hugo.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

public class DateUtils {
	public static boolean isInDate(Date date, String strDateBegin,String strDateEnd) {  
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd",Locale.TAIWAN);  
	    String strDate = sdf.format(date);   //2019-12-20
	    // 截取當前時間年月日 轉成整型
	    int  tempDate=Integer.parseInt(strDate.split("-")[0]+strDate.split("-")[1]+strDate.split("-")[2]);  
	    // 截取開始時間年月日 轉成整型
	    int  tempDateBegin=Integer.parseInt(strDateBegin.split("-")[0]+strDateBegin.split("-")[1]+strDateBegin.split("-")[2]);  
	    // 截取結束時間年月日   轉成整型
	    int  tempDateEnd=Integer.parseInt(strDateEnd.split("-")[0]+strDateEnd.split("-")[1]+strDateEnd.split("-")[2]);
	 
	    if ((tempDate >= tempDateBegin && tempDate <= tempDateEnd)) {  
	        return true;  
	    } else {  
	        return false;  
	    }  
	}
	
	
	 public static int getAgeByBirth(Date birthday){      
		 if (null != birthday) {
		       //Calendar：日歷
	          /*從Calendar對象中或得一個Date對象*/
	          Calendar cal = Calendar.getInstance();
	          /*把出生日期放入Calendar類型的bir對象中，進行Calendar和Date類型進行轉換*/
	          Calendar bir = Calendar.getInstance();
	          bir.setTime(birthday);
	          /*如果生日大於當前日期，則拋出異常：出生日期不能大於當前日期*/
	         if(cal.before(birthday)){
	        	 return 0;
	          }
	          /*取出當前年月日*/
	          int yearNow = cal.get(Calendar.YEAR);
	          int monthNow = cal.get(Calendar.MONTH);
	          int dayNow = cal.get(Calendar.DAY_OF_MONTH);
	          /*取出出生年月日*/
	          int yearBirth = bir.get(Calendar.YEAR);
	          int monthBirth = bir.get(Calendar.MONTH);
	          int dayBirth = bir.get(Calendar.DAY_OF_MONTH);
	          /*大概年齡是當前年減去出生年*/
	          int age = yearNow - yearBirth;
	          /*如果出當前月小與出生月，或者當前月等於出生月但是當前日小於出生日，那麽年齡age就減一歲*/
	          if(monthNow < monthBirth || (monthNow == monthBirth && dayNow < dayBirth)){
	              age--;
	          }
	          return age;
	      }else {
	    	  return 0;
		}
		}
		   
}
