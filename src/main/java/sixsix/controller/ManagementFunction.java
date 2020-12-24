package main.java.sixsix.controller;

import java.io.File;
import java.math.BigDecimal;
import java.security.GeneralSecurityException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import org.apache.commons.io.FilenameUtils;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import example.ExampleAllInOne;
import main.java.gona.util.BikeMailUtil;
import main.java.hugo.model.MemberBasic;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.sixsix.dao.RegistDAO;
import main.java.sixsix.model.Homestay;
import main.java.sixsix.model.Hotel_Order;
import main.java.sixsix.model.Hotel_type;
import oracle.net.aso.h;

@Controller
@SessionAttributes({"homestayId","loginOK"})
public class ManagementFunction {

	@Autowired
	private RegistDAO DAO;
	
	@Autowired
	private MemberBasicServiceImpl memberDAO;
	
	private SessionFactory session;
	
	public ManagementFunction(@Qualifier("sessionFactory")SessionFactory sessionstar) {
		this.session = sessionstar;
	}
	
	public Session getSession() {
		return session.getCurrentSession();
	}

	// ========================================================================================================

	
	@RequestMapping(path = "/sixsix.SearchHome.controller", method=RequestMethod.GET)
	public String processSearchHome() {
		
		return "hotel/hotel_home_Search";
		
	}
	
	
	@RequestMapping(path = "/sixsix.dataUpdate.controller", method = RequestMethod.POST)
	public String processUpdata(@ModelAttribute("chg") Homestay chg, Model m) {
	
		DAO.updataData(chg);
		List<Homestay> list = new ArrayList();
		list.add(chg);
		m.addAttribute("ADDD", list);
		
		
		return "hotel/homestay11";

	}

	// ========================================================================================================

	@RequestMapping(path = "/sixsix.deleteData.controller", method = RequestMethod.GET)
	public String processDeleteDate(@RequestParam(name = "deletegood") String del) {

		DAO.deleteData(del);

		return "hotel/homestay11";
	}

	// ========================================================================================================

	@RequestMapping(path = "/sixsix.checkDataUpdate.controller", method = RequestMethod.GET)
	public String processCheckDataUpdata(@RequestParam(name = "homenum") String change, Model m) throws SQLException {

		Homestay chg = DAO.changeSomething(change);
		int[][] arrMonAndDay = DAO.selectYearMonth();

		m.addAttribute("chg", chg);
		m.addAttribute("arr", arrMonAndDay);

		return "hotel/homestay_updateForm11";
//		return "hotel/bookinghotel11";
	}

	// 查詢後選定房間BOOKING======================================================================================

	@RequestMapping(path = "/sixsix.BookingHouseDetail.controller", method = RequestMethod.GET)
	public String processBookingHouseDetail(@RequestParam(name = "homenum") String change,
			Model m) throws SQLException {
		MemberBasic member = (MemberBasic) m.getAttribute("loginOK");
		Integer thisMember = 0;
		Integer commentYoN = 1;
		if(member!=null) {
		Integer memberID = member.getMemberId();
		thisMember = DAO.searchMemberNowHotelOrder(memberID, change); //此會員選擇此房間是否有訂單過 0否  1有
		

		if(thisMember==1) {
			List<String> commentList = DAO.searchMemberChangeHotelOrder(memberID, change); //會員有訂單，判斷是否評論過
			if(commentList.size()!=0) {
				
				Hotel_Order thisHotel = DAO.searchHotelOrder(commentList.get(0));
				commentYoN = 0;
				
			}
			
		}
		
		}
		System.out.println("****************是否下定"+thisMember);
		System.out.println("****************是否評論"+commentYoN);
		Homestay chg = DAO.changeSomething(change);
		int[][] arrMonAndDay = DAO.selectYearMonth();
		double countStarNum = DAO.countStarNum(change);
		 //此會員選擇此房間是否有訂單過 0否  1有  調整用
		m.addAttribute("YesOrNotOrder",thisMember); //此會員選擇此房間是否有訂單過 0否  1有
		m.addAttribute("YesOrNotComment",commentYoN); //會員有訂單了， 0還沒評論，1評論過
		m.addAttribute("countStarNum",countStarNum);  //飯店獲得星星數統計
		if(countStarNum*2*10<=0) {
		m.addAttribute("controlStarWidth",0); //控制星星顆數
		}else {
			m.addAttribute("controlStarWidth",countStarNum*2*10);
		}
		System.out.println(countStarNum*2*10+"------------------------------------------");
		Integer hotelMomentNum = DAO.countCommentNum(change);
		m.addAttribute("hotelMomentNum",hotelMomentNum); //飯店評論數
		m.addAttribute("homestayId",change); //hotel ID
		m.addAttribute("chg", chg);	//hotel Bean
		m.addAttribute("arr", arrMonAndDay);  
		
		
		
		//亂數生成照片
		int starRand = (int)(Math.random()*30)+100;
		int overRand = (int)(Math.random()*30)+180;
		
		m.addAttribute("starRand",starRand);
		m.addAttribute("overRand",overRand);
		
		int pictureNum = (overRand-starRand);
		m.addAttribute("pictureNum",pictureNum);
		
//		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
//
//		java.util.Date currentTime = new java.util.Date();//得到当前系统时间
//
//		String str_date1 = formatter.format(currentTime); //将日期时间格式化 
//		String str_date2 = currentTime.toString(); //将Date型日期时间转换成字符串形式 
//		System.out.println(str_date1+"=======================");
//		m.addAttribute("date1",str_date1);
//
//		return "hotel/chagehome";
		return "hotel/bookinghotel11";
	
	}
	

//	@RequestMapping(path = "sixsix.InsertData.controller", method = RequestMethod.POST)
	@PostMapping("sixsix.InsertData.controller")
	public String processInsertData(@ModelAttribute("homeinsertpage") Homestay insertHome,
			@RequestParam(name = "picturefile") MultipartFile pic, Model m) throws Exception {
		
		
		String oldFileName = pic.getOriginalFilename();
		String suffix = FilenameUtils.getExtension(oldFileName);
		String fileName = null; // 圖片檔案名稱

		fileName = "ht_" + System.currentTimeMillis() + "." + suffix; // 根據時間戳建立檔案名稱

		File dirPath = new File("D:\\sixsix00\\FinalProject\\WebContent\\WEB-INF\\pages\\hotel\\image"); // 決定上傳路徑(本機)

		if (!dirPath.exists()) { // 如果該資料夾不存在變創造一個
			dirPath.mkdirs();
		}

		String imgsrc = dirPath + "/" + fileName; // 檔案名稱
		File saveFile = new File(imgsrc); // 圖片路徑
		pic.transferTo(saveFile); // 把圖片給存到這個路徑
		
		insertHome.setPicturel(fileName);
		
		DAO.insertData(insertHome);
		m.addAttribute("InsertDataNew", insertHome);

		return "hotel/homestay_updateForm11";
	}

	// ========================================================================================================

	@RequestMapping(path = "/sixsix.toInsertPage.controller", method = RequestMethod.GET)
	public String processToInsertPage(Model m) {
		Homestay home = new Homestay();
		m.addAttribute("homeinsertpage", home);
		return "hotel/homestay_Insert11";
	}
	
	@RequestMapping(path = "/sixsix.togetHouseDetail.controller", method =RequestMethod.POST)
	public void processBookinghotel(@RequestParam(name="datechoose")String date) {
		
		String[] str = date.split(" ~ ");
		System.out.println(str[0]);
		System.out.println(str[1]);
		}
	
	// ========================================================================================================
	
	
	
	
	
	// 房間下訂後的日期整理==========================================================================================
	
	@RequestMapping(path = "/getgettime", method = RequestMethod.POST)
	public String getTime(@RequestParam(name = "datechoose") String t1 ,
			@RequestParam(name = "houseid")String houseid,
			@SessionAttribute(name = "loginOK")MemberBasic member,
			Model m) {
		
		
		Integer memberID = member.getMemberId();
		Integer thisMember = 0;
		Integer commentYoN = 1;
		if(member!=null) {
		thisMember = DAO.searchMemberNowHotelOrder(memberID, houseid); //此會員選擇此房間是否有訂單過 0否  1有
		

		if(thisMember==1) {
			List<String> commentList = DAO.searchMemberChangeHotelOrder(memberID, houseid); //會員有訂單，判斷是否評論過
			if(commentList.size()!=0) {
				
				Hotel_Order thisHotel = DAO.searchHotelOrder(commentList.get(0));
				commentYoN = 0;
				
			}
			
		}
		
		}
		System.out.println("****************是否下定"+thisMember);
		System.out.println("****************是否評論"+commentYoN);
		
		
		m.addAttribute("YesOrNotOrder",thisMember); //此會員選擇此房間是否有訂單過 0否  1有
		m.addAttribute("YesOrNotComment",commentYoN); //會員有訂單了， 0還沒評論，1評論過
		
		String[] str = t1.split(" ~ ");
		String startTime = str[0];
		String endTime = str[1];

		List<String> days = new ArrayList<String>();
		
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date start = dateFormat.parse(startTime);
			Date end = dateFormat.parse(endTime);

			Calendar tempStart = Calendar.getInstance();
			tempStart.setTime(start);

			Calendar tempEnd = Calendar.getInstance();
			tempEnd.setTime(end);
			tempEnd.add(Calendar.DATE, +1);// 日期加1(包含结束)
			while (tempStart.before(tempEnd)) {
				days.add(dateFormat.format(tempStart.getTime()));
				tempStart.add(Calendar.DAY_OF_YEAR, 1);

			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		//紀錄所選的日期區間總天數
		int size = days.size();
		
		
		//將所選日期存進date內
		String date="";
		for(int i=0;i<size;i++) {
			date+=" "+days.get(i);
		}
		
		System.out.println(date.trim());
		
		Homestay nowhotel = DAO.selectOneData(houseid);
		Hotel_type s5 = null,s6= null,s7= null,s8= null;
		
		System.out.println(nowhotel.getId());
		Set<Hotel_type> sss = nowhotel.getHotel_type();
		for(Hotel_type sss1:sss) {
			System.out.println(sss1.getId());
			if(sss1.getId().equals("5")) {
				m.addAttribute("s5",sss1);		//紀錄5號防數量
			}else if(sss1.getId().equals("6")) {
				m.addAttribute("s6",sss1);		//紀錄6號防數量
			}else if(sss1.getId().equals("7")) {
				m.addAttribute("s7",sss1);		//紀錄7號防數量
			}else if(sss1.getId().equals("8")) {
				m.addAttribute("s8",sss1);		//紀錄8號防數量
			}
			
		}
		
		//亂數生成照片編號
		int starRand = (int)(Math.random()*30)+100;
		int overRand = (int)(Math.random()*30)+180;
		
		m.addAttribute("starRand",starRand);
		m.addAttribute("overRand",overRand);
		int pictureNum = (overRand-starRand);
		m.addAttribute("pictureNum",pictureNum);
		
		int[] hotel_alreadybooking = DAO.processHotelnum(houseid, days);
		
		System.out.println(hotel_alreadybooking[0]+"--------------------------");
		
		
		//選定的日期頭跟尾(例如:2000-1-31 ~ 2000-2-3)
		m.addAttribute("daterange", t1);
		
		//此為查詢目前訂房剩餘的房間數
		List<Integer> countEveryHouseTypeNum = DAO.countEveryHouseTypeNum(houseid);
		m.addAttribute("order_Small_Hotelnum",countEveryHouseTypeNum.get(0)-hotel_alreadybooking[0]);
		m.addAttribute("order_Medium_Hotelnum",countEveryHouseTypeNum.get(1)-hotel_alreadybooking[1]);
		m.addAttribute("order_Big_Hotelnum",countEveryHouseTypeNum.get(2)-hotel_alreadybooking[2]);
		
		//下訂的總天數
		m.addAttribute("daySize",size);
		
		//下定總天數所有日期印出
		m.addAttribute("memberTotalDays",date.trim());
		
		//選擇的房間Bean
		m.addAttribute("chg",nowhotel);
		
		Integer hotelMomentNum = DAO.countCommentNum(houseid);
		double countStarNum = DAO.countStarNum(houseid);
		thisMember = DAO.searchMemberNowHotelOrder(memberID, houseid); //此會員選擇此房間是否有訂單過 0否  1有
		m.addAttribute("YesOrNotOrder",thisMember); //此會員選擇此房間是否有訂單過 0否  1有
		m.addAttribute("countStarNum",countStarNum);  //飯店獲得星星數統計
		m.addAttribute("controlStarWidth",countStarNum*2*10); //控制星星顆數
		m.addAttribute("hotelMomentNum",hotelMomentNum); //飯店評論數
		
		return "hotel/bookinghotel11";
	}
	// ========================================================================================================

	@RequestMapping(path = "/sixsix.BookingHotelCheckOK", method = RequestMethod.GET)
	public String BookingOKHotel(@RequestParam(name = "houseid")String houseid,
					@RequestParam(name = "daySize")String daySize,
					@RequestParam(name = "memberTotalDays")String memberTotalDays,
					@RequestParam(name = "houseType")String houseType,
					@RequestParam(name = "hotelMoney")String hotelMoney,
					@RequestParam(name = "dateChoose")String date,
//					@SessionAttribute(name = "loginOK")MemberBasic bb,
					Model m) {
		
//		DAO.countEveryMonthDollar();
		System.out.println(houseType);
		System.out.println(houseid);
		System.out.println(daySize);
		System.out.println(memberTotalDays);
		System.out.println("-----------------------");
		
		String[] str = date.split(" ~ ");
		String startTime = str[0].trim();
		String endTime = str[1].trim();
		
		
		String houseTypeName="";
		
		Homestay nowhotel = DAO.selectOneData(houseid);
		
		int hotelmoney = Integer.parseInt(hotelMoney);
		
		int housetype = Integer.parseInt(houseType);
		
		int daysize = Integer.parseInt(daySize);
		
		int money = hotelmoney*(daysize-1);
		
		int tax = 0;
		
		if((daysize-1)>=5) {
			tax = (int)((daysize-1)*hotelmoney*(0.1)*(0.8));
		}else if((daysize-1)<5 && (daysize-1)>=3) {
			tax = (int)((daysize-1)*hotelmoney*(0.1)*(0.9));
		}else {
		tax = (int)((daysize-1)*hotelmoney*(0.1));
		}
		
		int totalMoney = 0;
		
		if((daysize-1)>=5) {
			totalMoney = (int)((daysize-1)*hotelmoney*(1.1)*(0.8));
		}else if((daysize-1)<5 &&(daysize-1)>=3) {
			totalMoney = (int)((daysize-1)*hotelmoney*(1.1)*(0.9));
		}else {
			totalMoney = (int)((daysize-1)*hotelmoney*(1.1));
		}
		
		
		if(housetype==5) {
			houseTypeName="二人房";
		}else if(housetype==6) {
			houseTypeName="三人房";
		}else if(housetype==7) {
			houseTypeName="家庭套房";
		}
		Integer hotelMomentNum = DAO.countCommentNum(houseid);
		double countStarNum = DAO.countStarNum(houseid);
		
		m.addAttribute("hotelMomentNum",hotelMomentNum); //飯店評論數
		m.addAttribute("countStarNum",countStarNum);
		m.addAttribute("tax",tax);
		m.addAttribute("houseid",houseid);
		m.addAttribute("memberTotalDays",memberTotalDays);
		m.addAttribute("houseType",housetype);
		m.addAttribute("houseTypeName",houseTypeName);
		m.addAttribute("daysize",daysize-1);
		m.addAttribute("startDate",startTime);
		m.addAttribute("endDate",endTime);
		m.addAttribute("totalMoney",totalMoney);
		m.addAttribute("chg",nowhotel);
		m.addAttribute("totalMoneyNotTax",(totalMoney-tax));
//		System.out.println(bb.getMemberId());
		

		return "hotel/homestay_order";
	}
	
	//訂單前一步
	@PostMapping("sixsix.HotelCheckingOK.controller")
	public String processMemberHotelOrder(@RequestParam(name = "houseid")String houseid,
			@RequestParam(name = "daySize")String daySize,
			@RequestParam(name = "totalMoney")String totalMoney,
			@RequestParam(name = "memberTotalDays")String memberTotalDays,
			@RequestParam(name = "houseType")String houseType,
			Model m
			) throws Exception {
		System.out.println("--------------------------------------");
		System.out.println(houseid);
		System.out.println(daySize);
		System.out.println(totalMoney);
		System.out.println(memberTotalDays);
		System.out.println(houseType);

		
		MemberBasic member = (MemberBasic) m.getAttribute("loginOK");
		Integer memberId = member.getMemberId();
		int housetype = Integer.parseInt(houseType);
		int hotelmoney = Integer.parseInt(totalMoney);
		
		//新增訂單時打開
		Hotel_Order hotel_Order = DAO.processBookingHotelCheckOK(memberId, houseid, housetype, hotelmoney, memberTotalDays);
		
		
		String housename = DAO.selectOneData(houseid).getName();
		String form = DAO.processPayMoney(totalMoney, housename,hotel_Order.getId());
		
		//新增多筆資料時打開
//		DAO.processBokkingHotelRandom(memberId);
		
//		List<Hotel_Order> member_Total_Order = DAO.searchMemberTotalOrder(memberId);
		
//		m.addAttribute("thisMemberOrder",member_Total_Order);
		m.addAttribute("form",form);
		m.addAttribute("orderid",hotel_Order.getId());
		return "hotel/testtesttest";
	}
	
	@GetMapping("sixsix.orderCenter.success")
	public String successOrder(@SessionAttribute(name = "loginOK")MemberBasic member,
			@RequestParam(name = "orderid")String orderid,
			Model m) throws AddressException, MessagingException, GeneralSecurityException {
		
//		String user_Email = member.getEmail();
		String user_Email = "s35985456@hotmail.com";
		String subject = "[追風者]  ★住宿★預約訂單明細";
		StringBuilder contentBuilder = new StringBuilder();
		Hotel_Order hotel_Order = DAO.searchHotelOrder(orderid);
		
		contentBuilder.append("親愛的　"+member.getName()+"　您好：<br><br>");
		contentBuilder.append("感謝您使用我們的預約服務！<br>以下是您本次的預約資訊<br><br>");
		
		contentBuilder.append("訂單編號："+hotel_Order.getId()+"<br>");	
		contentBuilder.append("下訂日期："+hotel_Order.getOrderdate()+"<br>");
		contentBuilder.append("預約人姓名："+member.getName()+"<br>");
		contentBuilder.append("預約人聯絡電話："+member.getTel()+"<br><br>");
		
		contentBuilder.append("飯店名稱："+hotel_Order.getHomestay().getName()+"<br>");
		contentBuilder.append("飯店地址："+hotel_Order.getHomestay().getAdd()+"<br>");
		contentBuilder.append("住宿期間："+hotel_Order.getDate()+"<br>");
		contentBuilder.append("<br><br>");
		
		contentBuilder.append("=====================<br><br>");
		contentBuilder.append("金額總計："+hotel_Order.getMoney()+"<br><br>");
		
		contentBuilder.append("您也可隨時登入我們的網站，至會員中心查詢訂單或修改基本資料。如果您有任何問題，也請您至客服中心詢問相關訊息或來信給我們。<br>追風者 敬上");
		
		String content = contentBuilder.toString();
		BikeMailUtil.sendBikeMail(user_Email,subject,content);
		
		return "redirect:sixsix.orderSuccessPage";
	}
	
	
	@GetMapping(path="/sixsix.orderSuccessPage")
	public String orderSuccessPage() {
		return "hotel/orderCenter";
	}
	
	
	@GetMapping("sixsix.success.booking")
	public String sucessBooking(@SessionAttribute(name = "loginOK")MemberBasic member,Model m) {
		Integer memberId = member.getMemberId();
		
		List<Hotel_Order> member_Total_Order = DAO.searchMemberTotalOrder(memberId);
		
		
		m.addAttribute("thisMemberOrder",member_Total_Order);
		
		return "hotel/homestay_memberlive";
	}
	//查詢單位會員訂單
	@GetMapping("/sixsix.member.booking")
	public@ResponseBody Map<String, Object> memberBooking(@SessionAttribute(name = "loginOK")MemberBasic member,Model m) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> nameList = new ArrayList<String>();
		ArrayList<String> idList = new ArrayList<String>();
		ArrayList<String> dateList = new ArrayList<String>();
		Integer memberId = member.getMemberId();
		List<Hotel_Order> member_Total_Order = DAO.searchMemberTotalOrder(memberId);
		for (Hotel_Order hotel_Order : member_Total_Order) {
			Hotel_Order order = DAO.searchHotelOrder(hotel_Order.getId());
			String name = order.getHomestay().getName();
			String id = order.getHomestay().getId();
			String orderdate = order.getOrderdate();
			nameList.add(name);
			idList.add(id);
			dateList.add(orderdate);
		}
		map.put("orderList",member_Total_Order);
		map.put("nameList",nameList);
		map.put("idList",idList);
		map.put("dateList",dateList);
		return map;
	}
	
	@PostMapping(value = "/sixsix.detaildata.json", produces = "application/json")
	public @ResponseBody Map<String, Object> orderDetail(@RequestParam(name = "dataDetailparam")String orderId){
		System.out.println(orderId);
		Map<String,Object> map = new HashMap<>();
		Hotel_Order order = DAO.searchHotelOrder(orderId);
		
		String houseId = order.getHomestay().getId();
		
		String pic = order.getHomestay().getPicturel();
		
		String hotelName = order.getHomestay().getName();
		
		String tel = order.getHomestay().getTellphone();
		
		BigDecimal px = order.getHomestay().getPx();
		
		BigDecimal py = order.getHomestay().getPy();
		
		int hotelTypeid = order.getHowmanyday();
		
		String hoteltypeId = Integer.toString(hotelTypeid);
		
		Hotel_type hotelType = DAO.searchHotelType(hoteltypeId);
		
		String chiName = hotelType.getH_type();
		
		String hotelonedayPrice = hotelType.getPrice();
		
		String[] date = order.getDate().split(" ");
		
		int howmanyday = date.length;
		
		int howmanynight = date.length-1;
		
		
		String startDate = date[0];
		
		String overDate = date[(howmanyday-1)];
		
		
		map.put("thishotelTypeName",chiName);
		map.put("thishotelonedayPrice",hotelonedayPrice);
		map.put("howmanyDay",howmanyday);
		map.put("howmanyhowmanyNight",howmanynight);
		map.put("thisstartDate",startDate);
		map.put("thisoverDate",overDate);
		map.put("thisOrder", order);
		map.put("thisHotel", houseId);
		map.put("thisPic", pic);
		map.put("thisName", hotelName);
		map.put("thisTel",tel);
		map.put("thisPx",px);
		map.put("thisPy",py);
		
		
		
		return map;
		
	}
	
	@PostMapping(value = "/sixsix.countMonthMoney.json", produces = "application/json")
	public @ResponseBody Map<String, Object> countMoney(){
		
		ArrayList<Integer> list = DAO.countEveryMonthDollar();
		
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping(value = "/sixsix.countMonthNum.json", produces = "application/json")
	public @ResponseBody Map<String, Object> countNum(){
		
		ArrayList<Integer> list = DAO.countEveryMonthNum();
		
		Map<String,Object> map = new HashMap<>();
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping(value = "/sixsix.hotelcomment.json", produces = "application/json")
	public @ResponseBody Map<String, Object> countComment(@RequestParam(name = "dataDetailparam")String homestayId){
		System.out.println("UUUUUUUUUUUUUU"+homestayId);
		
		Map<String,Object> map = new HashMap<>();
		
		List<Hotel_Order> hotelList = DAO.countComment(homestayId);
		
		List<Hotel_Order> list = new ArrayList();
		
		for(Hotel_Order order:hotelList) {
			if(order.getCommentt()!=null) {
				System.out.println(order.getCommentt()+"---------------------------------------");
				list.add(order);
			}
		}
		
		System.out.println("確認回傳評論的人數為"+list);
		
		map.put("list",list);
		
		return map;
	}
	
	@PostMapping(value = "/sixsix.hotelSubmitcomment.json", produces = "application/json")
	public @ResponseBody Map<String, Object> submitComment(@RequestParam(name = "dataDetailparam")String homestayId,
			@RequestParam(name = "star")String star,
			@RequestParam(name = "commentt")String commentt,
			@SessionAttribute(name = "loginOK")MemberBasic member){
		System.out.println("UUUUUUUUUUUUUU"+homestayId);
		Integer memberId = member.getMemberId();
		Map<String,Object> map = new HashMap<>();
		int count = 0;
		List<Hotel_Order> memberCommentList = DAO.searchMemberSubmit1HotelOrderComment(memberId, homestayId, star, commentt);
		count = 1;
		
		System.out.println("確認回傳評論的人數為"+memberCommentList);
		map.put("count",count);
		map.put("list",memberCommentList);
		
		return map;
	}
	
	//查詢各地區飯店總數
	@PostMapping(value = "/sixsix.hotelTotalNum.json", produces = "application/json")
	public @ResponseBody Map<String, Object> hotelTotalNum(){
		
		List<Integer> list = DAO.countEveryPlaceHotelNum();
		
		Map<String,Object> map = new HashMap<>();
		
		
		map.put("list", list);
		
		return map;
	}
	
	//查詢東西南北區域的飯店數
	@PostMapping(value = "/sixsix.hotelAreaTotalNum.json", produces = "application/json")
	public @ResponseBody Map<String, Object> hotelAreaNum(){
		
		List<Integer> list = DAO.countAreaEveryPlaceHotelNum();
		
		Map<String,Object> map = new HashMap<>();
		
		
		map.put("list", list);
		
		return map;
	}
	
	@PostMapping(value = "/sixsix.commentOneMember.json", produces = "application/json")
	public @ResponseBody Map<String, Object> commentOneMember(@RequestParam(name = "memberID")String memberid){
		
		Map<String,Object> map = new HashMap<>();
		int memberID = Integer.parseInt(memberid.trim());
		
		MemberBasic member = memberDAO.select(memberID);
		
		
		
		map.put("member", member);
		
		return map;
	}
	
}
