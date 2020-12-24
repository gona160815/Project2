package main.java.gona.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.print.ServiceUI;

import main.java.gona.dao.RentalBikeOrderDao;


public class test {
	
	 public static List<Date> findDates(String bgDateStr, String edDateStr) throws ParseException {
		 SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy/MM/dd");
		 Date bgDate = sdf.parse(bgDateStr);
		 Date edDate = sdf.parse(edDateStr);
         List<Date> dateList = new ArrayList<Date>();
         dateList.add(bgDate);
         Calendar calBegin = Calendar.getInstance(); //獲得起始日的日曆
         calBegin.setTime(bgDate);
         Calendar calEnd = Calendar.getInstance(); // 獲得結束日的日曆
         calEnd.setTime(edDate);
         while (edDate.after(calBegin.getTime()))  { // 如果結束日晚於起始日
        	 
              calBegin.add(Calendar.DAY_OF_MONTH, 1); //加一天
              dateList.add(calBegin.getTime());
         }
         return dateList;
    }
	 
	 

	public static void main(String[] args) throws ParseException {
		List<Date> dates = findDates("2020/01/01","2020/01/16");
		for(Date value:dates){
			SimpleDateFormat sdf =   new SimpleDateFormat( "yyyy/MM/dd");
			String dateStr = sdf.format(value);
            System.out.println(dateStr);
        }
		
		
	}

}
