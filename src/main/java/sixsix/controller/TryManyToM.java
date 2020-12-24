package main.java.sixsix.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.apache.el.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import main.java.sixsix.dao.RegistDAO;
import main.java.sixsix.dao.TryManyToMany;
import main.java.sixsix.model.Homestay;
import main.java.sixsix.model.Hotel_type;

@Controller
public class TryManyToM {

	@Autowired
	private TryManyToMany DAO1;
	
	@Autowired
	private RegistDAO DAO;
	
	@RequestMapping(path = "/trytryone123", method = RequestMethod.POST)
	public String tyrrtetre123123() {
		return "hotel/testtesttest";
	}

	@RequestMapping(path = "/trytryone", method = RequestMethod.GET)
	public String tyrrtetre(@RequestParam(name = "h1") String h1, @RequestParam(name = "h2") String h2) {

		DAO1.proccessTrytry(h1, h2);

		return "hotel/testetst";
	}

	@RequestMapping(path = "/trytryone1", method = RequestMethod.GET)
	public String tyrrtetre1() {
		DAO1.processInsertHotel();
		
		return "hotel/testetst";
	}

	@RequestMapping(path = "/trytryone2", method = RequestMethod.GET)
	public String tyrrtetre2() {

		DAO1.processSelect();

		return "hotel/testetst";
	}

//	@RequestMapping(path = "/getgettime", method = RequestMethod.POST)
//	public String getTime(@RequestParam(name = "datechoose") String t1 ,@RequestParam(name = "houseid")String houseid,Model m) {
//
//		String[] str = t1.split(" ~ ");
//		String startTime = str[0];
//		String endTime = str[1];
//
//		List<String> days = new ArrayList<String>();
//
//		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
//		try {
//			Date start = dateFormat.parse(startTime);
//			Date end = dateFormat.parse(endTime);
//
//			Calendar tempStart = Calendar.getInstance();
//			tempStart.setTime(start);
//
//			Calendar tempEnd = Calendar.getInstance();
//			tempEnd.setTime(end);
//			tempEnd.add(Calendar.DATE, +1);// 日期加1(包含结束)
//			while (tempStart.before(tempEnd)) {
//				days.add(dateFormat.format(tempStart.getTime()));
//				tempStart.add(Calendar.DAY_OF_YEAR, 1);
//
//			}
//			
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//		
//		
//		int size = days.size();
//		
//		String date="";
//		for(int i=0;i<size;i++) {
//			date+=" "+days.get(i);
//		}
//		
//		System.out.println(date.trim());
//		
//		Homestay nowhotel = DAO.selectOneData(houseid);
//		Hotel_type s5 = null,s6= null,s7= null,s8= null;
//		
//		System.out.println(nowhotel.getId());
//		Set<Hotel_type> sss = nowhotel.getHotel_type();
//		for(Hotel_type sss1:sss) {
//			System.out.println(sss1.getId());
//			if(sss1.getId().equals("5")) {
//				m.addAttribute("s5",sss1);
//			}else if(sss1.getId().equals("6")) {
//				m.addAttribute("s6",sss1);
//			}else if(sss1.getId().equals("7")) {
//				m.addAttribute("s7",sss1);
//			}else if(sss1.getId().equals("8")) {
//				m.addAttribute("s8",sss1);
//			}
//			
//		}
//		
//		int[] hotel_alreadybooking = DAO.processHotelnum(houseid, days);
//		
//		//--------------------------------------房型一
//		
//		
//		
//		m.addAttribute("order_Small_Hotelnum",2-hotel_alreadybooking[0]);
//		m.addAttribute("order_Medium_Hotelnum",2-hotel_alreadybooking[1]);
//		m.addAttribute("order_Big_Hotelnum",2-hotel_alreadybooking[2]);
//		
//		
//		
//		
//		
//		//--------------------------------------房型二
//
//		
//		
//		
//		
//		
//		//--------------------------------------房型三
//		
//		m.addAttribute("chg",nowhotel);
//		
//		
//		
//		return "hotel/bookinghotel11";
//	}

}
