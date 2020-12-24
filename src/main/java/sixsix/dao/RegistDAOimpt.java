package main.java.sixsix.dao;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import main.java.hugo.dao.MemberBasicDAO;
import main.java.hugo.dao.MemberDAO;
import main.java.hugo.model.MemberBasic;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.sixsix.model.Homestay;
import main.java.sixsix.model.Homestay_Type;
import main.java.sixsix.model.Hotel_Order;
import main.java.sixsix.model.Hotel_type;

@Repository
public class RegistDAOimpt {

	public static AllInOne all;

	private SessionFactory session;

	private int pageNum;
	
	@Autowired
	private MemberBasicServiceImpl memberDAO;

	public RegistDAOimpt() {

	}

	@Autowired
	public RegistDAOimpt(@Qualifier("sessionFactory") SessionFactory sessionstar) {
		this.session = sessionstar;
	}

	public Session getSession() {
		return session.getCurrentSession();
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	// 查詢總頁數====================================================
	public void mathPageNum(String pla, String add) {

		if (pla.equals("1")) {

			String queryString = "from Homestay where ADD1 like '%" + add + "%'";

			Query<Homestay> query = getSession().createQuery(queryString, Homestay.class);

			List<Homestay> list = query.list();

			double page = (list.size() / (9.0));

			if (page == 0) {
				setPageNum((int) Math.ceil(page) + 1);
			} else
				setPageNum((int) Math.ceil(page));

		} else if (pla.equals("2")) {

			String queryString = "from Homestay where NAME1 like '%" + add + "%'";

			Query<Homestay> query = getSession().createQuery(queryString, Homestay.class);

			List<Homestay> list = query.list();

			double page = (list.size() / (9.0));

			if (page == 0) {
				setPageNum((int) Math.ceil(page) + 1);
			} else
				setPageNum((int) Math.ceil(page));

		} else if (pla.equals("3")) {

			String bicy = "自行車";
			String queryString = "from Homestay where ADD1 like '%" + add + "%' and SERVICEINFO like '%" + bicy + "%'";

			Query<Homestay> query = getSession().createQuery(queryString, Homestay.class);

			List<Homestay> list = query.list();

			double page = (list.size() / (9.0));

			if (page == 0) {
				setPageNum((int) Math.ceil(page) + 1);
			} else
				setPageNum((int) Math.ceil(page));
		}
	}

	// 模糊查詢====================================================

	public List<Homestay> selectSomething(String pla, String add, int nowpage) throws SQLException {

		if (pla.equals("1")) {

			String queryString = "from Homestay where ADD1 like '%" + add + "%'";

			Query<Homestay> query = getSession().createQuery(queryString, Homestay.class);

			Integer numover = (9 * (nowpage - 1));

			query.setFirstResult(numover);
			query.setMaxResults(9);

			List<Homestay> list = query.list();

			return list;

		} else if (pla.equals("2")) {

			String queryString = "from Homestay where NAME1 like '%" + add + "%'";

			Query<Homestay> query = getSession().createQuery(queryString, Homestay.class);

			Integer numover = (9 * (nowpage - 1));

			query.setFirstResult(numover);
			query.setMaxResults(9);

			List<Homestay> list = query.list();

			return list;

		} else if (pla.equals("3")) {

			String bicy = "自行車";
			String queryString = "from Homestay where ADD1 like '%" + add + "%' and SERVICEINFO like '%" + bicy + "%'";

			Query<Homestay> query = getSession().createQuery(queryString, Homestay.class);

			Integer numover = (9 * (nowpage - 1));

			query.setFirstResult(numover);
			query.setMaxResults(9);

			List<Homestay> list = query.list();

			return list;
		}
		return null;
	}

	// 修改後結果顯示====================================================

	public Homestay changeSomething(String change) throws SQLException {

		System.out.println(change.trim());
		Homestay result = getSession().get(Homestay.class, change.trim());

		return result;
	}

	// 修改資料====================================================
	public void updataData(Homestay upt) {

		getSession().update(upt);

	}

	// 新增資料進資料庫====================================================
	public void insertData(Homestay insertHome) {

		getSession().save(insertHome);

	}

	// 刪除表格====================================================
	public boolean deleteData(String del) {
		Homestay result = getSession().get(Homestay.class, del);

		System.out.println(result.getId());
		if (result != null) {
			getSession().delete(result);
			return true;
		} else
			return false;

	}

	// 單筆查詢====================================================
	public Homestay selectOneData(String houseid) {
		Homestay hotel = getSession().get(Homestay.class, houseid);

		return hotel;
	}

	// 飯店庫存查詢查詢====================================================
	public int[] processHotelnum(String houseid, List<String> days) {

		int smallhotel = 0;
		int mediumhotel = 0;
		int bighotel = 0;

		System.out.println("-------------------------------------");
		for (String today : days) {
			String tt = today.trim();
			String queryString = "from Hotel_Order where Homestay_id1 like '%" + houseid + "%' AND total_date like '%"
					+ tt + "%' AND howmanyday like '5'";
			Query<Hotel_Order> query = getSession().createQuery(queryString, Hotel_Order.class);
			List<Hotel_Order> list = query.list();
			int num5 = list.size();
			System.out.println(num5);
			if (num5 > smallhotel) {
				smallhotel = num5;
			}

			String queryString1 = "from Hotel_Order where Homestay_id1 like '%" + houseid + "%' AND total_date like '%"
					+ tt + "%' AND howmanyday = '6'";
			Query<Hotel_Order> query1 = getSession().createQuery(queryString1, Hotel_Order.class);
			int num6 = query1.list().size();
			if (num6 > mediumhotel) {
				mediumhotel = num6;
			}

			String queryString2 = "from Hotel_Order where Homestay_id1 like '%" + houseid + "%' AND total_date like '%"
					+ tt + "%' AND howmanyday = '7'";
			Query<Hotel_Order> query2 = getSession().createQuery(queryString2, Hotel_Order.class);

			int num7 = query2.list().size();
			if (num7 > bighotel) {
				bighotel = num7;
			}

		}

		System.out.println(smallhotel + "-------------------");

		int[] total = { smallhotel, mediumhotel, bighotel };

		return total;

	}

	// 飯店訂房確認

	public Hotel_Order processBookingHotelCheckOK(Integer memberId, String houseid, int houseType, int money,
			String memberTotalDays) throws Exception {

		Homestay hotelBooking = getSession().get(Homestay.class, houseid);
		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String dateString = formatter.format(currentTime);
		Hotel_Order member_Order = new Hotel_Order(memberId, memberTotalDays, houseType, money, hotelBooking,
				dateString);

		getSession().save(member_Order);

		return member_Order;

	}

	// 新增100筆亂數資料
	public void processBokkingHotelRandom(Integer memberId) throws ParseException {

		int hotelNum = 0;
		int hotelMoney = 0;
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		Date star = format.parse("2020-01-01 00:00:00");
		Date end = format.parse("2020-12-31 00:00:00");
		Query<Homestay> query = getSession().createQuery("from Homestay", Homestay.class);

		List<Homestay> list = query.list();

		Homestay hotelBooking;

		long date = 0;
		Date currentTime;
		for (int i = 20; i <= 100; i++) {
			currentTime = new Date();
			hotelNum = (int) (Math.random() * 4) + 5; // 隨機生成的房型號碼
			hotelMoney = (int) (Math.random() * 10000) + 1000; // 隨機生成金額
			date = random(star.getTime(), end.getTime());
			String dateString = format.format(new Date(date)); // 隨機生成今天日期
			System.out.println(hotelNum);
			System.out.println(hotelMoney);
			System.out.println(dateString);
			hotelBooking = list.get(i);
			Hotel_Order member_Order = new Hotel_Order(memberId, dateString, hotelNum, hotelMoney, hotelBooking,
					dateString);
			getSession().save(member_Order);
		}
	}

	// 亂數新增區間日期
	public long random(long begin, long end) {
		long rtn = begin + (long) (Math.random() * (end - begin));
		if (rtn == begin || rtn == end) {
			return random(begin, end);
		}
		return rtn;
	}

	// 單筆飯店訂單查詢
	public Hotel_Order searchHotelOrder(String orderid) {
		Hotel_Order hotelorder = getSession().get(Hotel_Order.class, orderid);

		return hotelorder;
	}

	// 利用會員ID查詢飯店訂單
	public List<Hotel_Order> searchMemberTotalOrder(Integer memberId) {

		String queryString = "from Hotel_Order where MEMBERID like '%" + memberId + "%'";

		Query<Hotel_Order> query = getSession().createQuery(queryString, Hotel_Order.class);

		List<Hotel_Order> list = query.list();

		return list;

	}

	// 單筆查詢房型
	public Hotel_type searchHotelType(String hoteltypeId) {
		Hotel_type hotelType = getSession().get(Hotel_type.class, hoteltypeId);

		return hotelType;
	}

	// 信用卡付款頁面自動生成
	public String processPayMoney(String money, String housename, String orderid) {
		UUID uuid = UUID.randomUUID();

		String[] idd = uuid.toString().split("-");
		String UuId = idd[0] + idd[1] + idd[2] + idd[3];

		System.out.println(UuId);

		Date currentTime = new Date();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String dateString = formatter.format(currentTime);

		all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo(UuId);
		obj.setMerchantTradeDate(dateString);
		obj.setTotalAmount(money);
		obj.setTradeDesc("test Description");
		obj.setItemName("下訂名宿名稱：" + housename);
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		obj.setClientBackURL("http://localhost:8080/EEIT124Team1FinalProject/sixsix.orderCenter.success?orderid="+orderid);
//		obj.setReturnURL("http://localhost:8080/EEIT124Team1FinalProject/testtesttest.jsp");
//		obj.setOrderResultURL("http://localhost:8080/EEIT124Team1FinalProject/testtesttest.jsp");
		String form = all.aioCheckOut(obj, null);
		System.out.println(form);
		return form;
	}

	// 日期查詢====================================================

	public int[][] selectYearMonth() {

		int[][] arr = new int[6][7];
		Calendar cal = Calendar.getInstance();

		int year = 2020;
		int month = 10;

		cal.set(year, month, 0);

		int max = cal.get(Calendar.DAY_OF_MONTH);
		for (int i = 1; i <= max; i++) {
			cal.set(year, month - 1, i); // 若不為0，month則需-1
			int row = cal.get(Calendar.WEEK_OF_MONTH) - 1;
			int col = cal.get(Calendar.DAY_OF_WEEK) - 1;
			arr[row][col] = i;
		}

		System.out.println("日\t一\t二\t三\t四\t五\t六");
		for (int x = 0; x < arr.length; x++) {
			for (int y = 0; y < arr[x].length; y++) {
				if (arr[x][y] != 0) {
					System.out.print(arr[x][y]);
				}
			}
			System.out.print("\t");
		}
		System.out.println();

		return arr;

	}

	// 每月下單人數計算========================
	public ArrayList<Integer> countEveryMonthNum() {
		ArrayList<Integer> list = new ArrayList<Integer>();
		for (int i = 1; i <= 12; i++) {
			String queryString = null;
			if (i >= 1 && i <= 9) {
				queryString = "from Hotel_Order where ORDERDATE like '%2020-0" + i + "%'";
			} else if (i >= 10 && i <= 12) {
				queryString = "from Hotel_Order where ORDERDATE like '%2020-" + i + "%'";
			}

			Query<Hotel_Order> query = getSession().createQuery(queryString, Hotel_Order.class);
			int countMonthNum = query.list().size();
			list.add(countMonthNum);

		}

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

		return list;

	}

	// 每月下單總額計算========================
	public ArrayList<Integer> countEveryMonthDollar() {
		System.out.println("**********************************************");
		ArrayList<Integer> list = new ArrayList<Integer>();

		for (int i = 1; i <= 12; i++) {
			int countTotal = 0;
			String queryString = null;
			if (i >= 1 && i <= 9) {
				queryString = "from Hotel_Order where ORDERDATE like '%2020-0" + i + "%'";
			} else if (i >= 10 && i <= 12) {
				queryString = "from Hotel_Order where ORDERDATE like '%2020-" + i + "%'";
			}

			Query<Hotel_Order> query = getSession().createQuery(queryString, Hotel_Order.class);
			List<Hotel_Order> list2 = query.list();

			if (list2.size() > 0) {
				for (int j = 0; j < list2.size(); j++) {
					countTotal += list2.get(j).getMoney();

				}
			}

			list.add(countTotal);

		}

		for (int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}

		return list;

	}

	// 查詢訂單總比數
	public Integer countOrder() {

		Query<Hotel_Order> query = getSession().createQuery("From Hotel_Order", Hotel_Order.class);
		int countOrder = query.list().size();

		return countOrder;
	}

	// 查詢訂單中選中飯店的評論數
	public Integer countCommentNum(String houseid) {

		Query<Hotel_Order> query = getSession()
				.createQuery("from Hotel_Order where Homestay_id1 like '%" + houseid + "%'", Hotel_Order.class);
		List<Hotel_Order> list = query.list();
		int count = 0;

		for (Hotel_Order hotel : list) {
			if (hotel.getCommentt() != null) {
				count += 1;
			}

		}

		return count;
	}

	// 查詢訂單中選中飯店的星星數
	public double countStarNum(String houseid) {
		Query<Hotel_Order> query = getSession()
				.createQuery("from Hotel_Order where Homestay_id1 like '%" + houseid + "%'", Hotel_Order.class);
		List<Hotel_Order> list = query.list();
		double count = 0;
		
		double starNum = 0;
		
		for (Hotel_Order hotel : list) {
			if (hotel.getStarnum() != null) {
				starNum += hotel.getStarnum();
				count +=1;
			}

		}
		double ans = 0;
		if(count!=0) {
		ans = starNum/count;
		}
		DecimalFormat df = new DecimalFormat("##.0");
		ans = Double.parseDouble(df.format(ans));
		
		return ans;

	}

	// 查詢選定該飯店的所有評論
	public List<Hotel_Order> countComment(String houseid) {
		Query<Hotel_Order> query = getSession()
				.createQuery("from Hotel_Order where Homestay_id1 like '%" + houseid + "%'", Hotel_Order.class);
		List<Hotel_Order> list = query.list();

		return list;

	}
	
	
	// 利用會員ID查詢飯店訂單未填寫評論和星星
		public Integer searchMemberNowHotelOrder(Integer memberId,String houseid) {

			String queryString = "from Hotel_Order where MEMBERID like '%" + memberId + "%' AND Homestay_id1 like '%" + houseid + "%'";

			Query<Hotel_Order> query = getSession().createQuery(queryString, Hotel_Order.class);

			List<Hotel_Order> list = query.list();
			
			if(list.size()==0) {
				return 0;
			}else {
				return 1;
			}
			
			
			
		}
		//判斷是否有訂房，且是否評論了沒
		public List<String> searchMemberChangeHotelOrder(Integer memberId,String houseid) {
			String queryString = "from Hotel_Order where MEMBERID like '%" + memberId + "%' AND Homestay_id1 like '%" + houseid + "%'";

			Query<Hotel_Order> query = getSession().createQuery(queryString, Hotel_Order.class);
			
			List<Hotel_Order> list = query.list();
			
			List<String> memberidList = new ArrayList<String>();
			
			
			int count = 0;
			
			
			for(int i=0;i<list.size();i++) {
				list.get(i).getCommentt();
				if(list.get(i).getCommentt()==null) {
					count = 0;
					memberidList.add(list.get(i).getId());
				}else {
					count = 1;
				}
			}
			
			
			return memberidList;
			
		}
		
		//判斷留言是否已留言
		public List<Hotel_Order> searchMemberSubmit1HotelOrderComment(Integer memberId,String houseid,String star,String commentt) {
			   
			   String queryString = "from Hotel_Order where MEMBERID like '%" + memberId + "%' AND Homestay_id1 like '%" + houseid + "%'";

			   Query<Hotel_Order> query = getSession().createQuery(queryString, Hotel_Order.class);
			   
			   List<Hotel_Order> list = query.list();
			   
//			   List<ArrayList<Object>> dontCommentList = new ArrayList<Hotel_Order>();
			   
			   List<Hotel_Order> dontCommentList = new ArrayList<Hotel_Order>();
			   
			   List<MemberBasic> memberList = new ArrayList<MemberBasic>();
			   
			   int starnum = Integer.parseInt(star);
			   
			   
			   for(int i=0;i<list.size();i++) {
			    if(list.get(i).getCommentt()==null) {
			    list.get(i).setStarnum(starnum);
			    list.get(i).setCommentt(commentt);
			    getSession().save(list.get(i));
			    dontCommentList.add(list.get(i));
			    Integer memberid = list.get(i).getMemberid();
			    memberList.add(memberDAO.select(memberid));
			    
			    if(i==0) {
			     break;
			    }
			    
			    }
			   }
			   
			   return dontCommentList;
			   
			   
			  }
		
		//計算各地區飯店總數
		public List<Integer> countEveryPlaceHotelNum(){
			
			String[] place= {"臺北","新北","桃園","新竹","苗栗","臺中","南投","彰化","雲林","嘉義","臺南","高雄","屏東","臺東","花蓮","宜蘭","金門","蘭嶼","綠島"};
			
			List<Integer> countList= new ArrayList<Integer>();
			
			for(int i = 0 ;i<place.length;i++) {
			
			String queryString = "from Homestay where ADD1 like '%" + place[i] + "%'";

			Query<Homestay> query = getSession().createQuery(queryString, Homestay.class);
			
			List<Homestay> list = query.list();
			
			countList.add(list.size());
			
			}
			
			return countList;
			
		}
		
		
		//全台各區域飯店總數
		public List<Integer> countAreaEveryPlaceHotelNum(){
			String[] place= {"臺北","新北","桃園","新竹","苗栗","臺中","南投","彰化","雲林","嘉義","臺南","高雄","屏東","臺東","花蓮","宜蘭","金門","蘭嶼","綠島"};
			
			List<Homestay> list = new ArrayList<Homestay>();
			List<Integer> countList= new ArrayList<Integer>();
			String queryString;
			Query<Homestay> query;
			int north = 0,west =0,south = 0, east = 0;
			
			for(int i=0;i<=4;i++) {
				queryString = "from Homestay where ADD1 like '%" + place[i] + "%'";

				query = getSession().createQuery(queryString, Homestay.class);
				
				 list = query.list();
				
				north += list.size();
			}
			System.out.println("北"+north);
			countList.add(north);
			
			for(int i=5;i<=8;i++) {
				queryString = "from Homestay where ADD1 like '%" + place[i] + "%'";

				query = getSession().createQuery(queryString, Homestay.class);
				
				list = query.list();
				
				west += list.size();
			}
			System.out.println("西"+west);
			countList.add(west);
			
			for(int i=9;i<=12;i++) {
				queryString = "from Homestay where ADD1 like '%" + place[i] + "%'";

				query = getSession().createQuery(queryString, Homestay.class);
				
				list = query.list();
				
				south += list.size();
			}
			System.out.println("南"+south);
			countList.add(south);
			for(int i=13;i<=18;i++) {
				queryString = "from Homestay where ADD1 like '%" + place[i] + "%'";

				query = getSession().createQuery(queryString, Homestay.class);
				
				list = query.list();
				
				east += list.size();
			}
			System.out.println("東"+east);
			countList.add(east);
			
			
			return countList;
		}
		
		
		//查詢選取飯店的各房型庫存量
		public List<Integer> countEveryHouseTypeNum(String houseid){
			Query<Homestay_Type> query;
			String queryString;
			String[] housetype = {"5","6","7"};
			
			List<Integer> list= new ArrayList<Integer>();
			for(int i=0;i<housetype.length;i++) {
				queryString = "from Homestay_Type where Hotel_type_hotel_id like '%" + housetype[i] + "%' AND homestay_id1 like '%" + houseid + "%'";
				query = getSession().createQuery(queryString, Homestay_Type.class);
				List<Homestay_Type> list2 = query.list();
				Integer hotelStock = list2.get(0).getNum();
				list.add(hotelStock);				
			}
			
			return list;
			
		}
		
		
		

}
