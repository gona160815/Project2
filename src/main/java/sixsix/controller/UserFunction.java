package main.java.sixsix.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import main.java.sixsix.dao.RegistDAOimpt;
import main.java.sixsix.model.Homestay;

@Controller
//@SessionAttributes("sessiontest")
public class UserFunction {
	
	@Autowired
	private RegistDAOimpt DAO;
	
	//=========================================================================================================
	
		@RequestMapping(path = "/sixsix.Search.controller", method=RequestMethod.GET)
		public String processSearch(Model m) {
			
			int pageNow=1;
			String pla="1";
			String add = "";
			
		
			try {
				List<Homestay> add1 = DAO.selectSomething(pla,add,pageNow);
				System.out.println(add1);
				DAO.mathPageNum(pla, add); //計算總頁數
				int pageNum = DAO.getPageNum();
				if(pageNum==0) {
					pageNum=1;
				}
				System.out.println(pageNum);
				System.out.println("pageNow:"+pageNow);
				
				m.addAttribute("NowPage", pageNow);
				m.addAttribute("PLANUM", pla);
				m.addAttribute("ADDD", add1);
				m.addAttribute("PLACE", add);
				m.addAttribute("PAGENUM", pageNum);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return "hotel/hotelSearch";
		}
	
	//========================================================================================================
	
	@RequestMapping(path = "/sixsix.Home.controller",method = RequestMethod.GET)
	public String processImportant(ModelMap m1,Model m) {
//		m1.addAttribute("sessiontest","PigPPigPPPig");
		Integer orderNum = DAO.countOrder();
		ArrayList<Integer> list = DAO.countEveryMonthDollar();
		m.addAttribute("order", orderNum);
		m.addAttribute("list",list);
		
		return "hotel/homestay11";
	}
	
	//========================================================================================================
	
		@RequestMapping(path = "/sixsix.HomeDetail.controller",method = RequestMethod.GET)
		public String processImportant1() {
			
			return "hotel/homestay_detail11";
		}
	
	//========================================================================================================
	
	@RequestMapping(path = "/sixsix.InsertDataPage.controller",method = RequestMethod.GET)
	public String processInsertDataPage() {
		return "hotel/homestay_Insert11";
	}
	
	//========================================================================================================
	
	@RequestMapping(path = "/sixsix.selectData.controller", method = RequestMethod.POST)
	public String processSelectData(@RequestParam(name = "place") String pla,@RequestParam(name = "inputAdd") String add,@RequestParam(name = "inputPage") String nowPage,Model m){
		
		int pageNow=1;
		
		System.out.println(pla);
		System.out.println(add);
		System.out.println(nowPage);
		Integer orderNum = DAO.countOrder();
		ArrayList<Integer> list = DAO.countEveryMonthDollar();
		m.addAttribute("order", orderNum);
		m.addAttribute("list",list);
		
		if(add!=null) {
			pageNow= Integer.parseInt(nowPage);
		}
	
		try {
			List<Homestay> add1 = DAO.selectSomething(pla,add,pageNow);
			System.out.println(add1);
			DAO.mathPageNum(pla, add); //計算總頁數
			int pageNum = DAO.getPageNum();
			
			if(pageNum==0) {
				pageNum=1;
			}
			System.out.println(pageNum);
			
			m.addAttribute("NowPage", pageNow);
			m.addAttribute("PLANUM", pla);
			m.addAttribute("ADDD", add1);
			m.addAttribute("PLACE", add);
			m.addAttribute("PAGENUM", pageNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "hotel/homestay11";
		
	}
	
	
	//========================================================================================================
	
	@RequestMapping(path = "/sixsix.selectData1.controller", method = RequestMethod.GET)
	public String processSelectData1(@RequestParam(name = "place") String pla,@RequestParam(name = "inputAdd") String add,@RequestParam(name = "inputPage") String nowPage,Model m){
		
		int pageNow=1;
		
		System.out.println(pla);
		System.out.println(add);
		System.out.println(nowPage);
		
		if(add!=null) {
			pageNow= Integer.parseInt(nowPage);
		}
	
		try {
			List<Homestay> add1 = DAO.selectSomething(pla,add,pageNow);
			System.out.println(add1);
			DAO.mathPageNum(pla, add); //計算總頁數
			int pageNum = DAO.getPageNum();
			if(pageNum==0) {
				pageNum=1;
			}
			System.out.println(pageNum);
			System.out.println("pageNow:"+pageNow);
			
			m.addAttribute("NowPage", pageNow);
			m.addAttribute("PLANUM", pla);
			m.addAttribute("ADDD", add1);
			m.addAttribute("PLACE", add);
			m.addAttribute("PAGENUM", pageNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return "hotel/hotelSearch";
		
	}
    
    
  //========================================================================================================
	
  	@RequestMapping(path = "/sixsix.BookingHouse.controller", method = RequestMethod.POST)
  	public String processBookingData(@RequestParam(name = "place") String pla,@RequestParam(name = "inputAdd") String add,@RequestParam(name = "inputPage") String nowPage,Model m){
  		
  		int pageNow=1;
  		
  		System.out.println(pla);
  		System.out.println(add);
  		System.out.println(nowPage);
  		
  		if(add!=null) {
  			pageNow= Integer.parseInt(nowPage);
  		}
  	
  		try {
  			List<Homestay> add1 = DAO.selectSomething(pla,add,pageNow);
  			System.out.println(add1);
  			DAO.mathPageNum(pla, add); //計算總頁數
  			int pageNum = DAO.getPageNum();
  			System.out.println(pageNum);
  			
  			m.addAttribute("NowPage", pageNow);
  			m.addAttribute("PLANUM", pla);
  			m.addAttribute("ADDD", add1);
  			m.addAttribute("PLACE", add);
  			m.addAttribute("PAGENUM", pageNum);
  		} catch (SQLException e) {
  			e.printStackTrace();
  		}
  		
  		return "hotel/hotelSearch";
  		
  	}
  	
  	//========================================================================================================
	
	
}
