package main.java.gona.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import main.java.gona.model.Cart;
import main.java.gona.model.RbBill;
import main.java.gona.model.RbCart;
import main.java.gona.model.RbOrder;
import main.java.gona.model.RentalBike;

@Repository("rentalBikeOrderDao")
public class RentalBikeOrderDao {
	
	public static AllInOne all; //綠界付款
	
	@Autowired
	@Qualifier("sessionFactory") //指定
	private SessionFactory sessionFactory; 
	
	private String query;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	//查詢當日庫存------------------------------------------
	
	

	//查詢腳踏車(該店有引進)--------------------------------
	
	public List<RentalBike> getSearchRb(String Bgstore_Id){
		Session session = getSession(); //與資料庫取得連線
//		select rb.rbid  from rentalbike rb , rb_stock rbs where rb.rbid = rbs.rbid  and rbs.rbstock > 0;
		Query<RentalBike> query = session.createQuery("select rb from RentalBike rb left join fetch rb.rbStock rbs left join fetch rbs.store s where s.store_id=?1",RentalBike.class);
		query.setParameter(1,Bgstore_Id);
		List<RentalBike> bikes = query.list();
		return bikes;		
	}
	
	//計算時間-----------------------------------------------
	
	public Integer getOrderDate(String bgDate,String edDate) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		List<String> days = new ArrayList<String>();
		try {
			Date start = dateFormat.parse(bgDate);//轉換時間型態
			Date end = dateFormat.parse(edDate);
			
			Calendar tempStart = Calendar.getInstance();//使用預設時區和語言環境獲得一個日曆
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
		return size;			
	}		
	
	//========RbOrder CRUD================
	
		public RbOrder selectRbOrder(String rbOrderId) {
			Session session = getSession(); 
			return (RbOrder)session.get(RbOrder.class, rbOrderId);
		}
		
		public RbOrder insertRbOrder(RbOrder rbOrder) {
			Session session = getSession();
			session.save(rbOrder);
			return rbOrder;
		}

		public boolean deleteRbOrder(String rbOrderId) {
			Session session = getSession();
			RbOrder rs = session.get(RbOrder.class,rbOrderId);
			if(rs != null) {
				session.delete(rs);
				return true;
			}
			return false;
		}
		
		public void updateRbOrder(RbOrder rbOrder) {
			Session session = getSession();
			session.update(rbOrder);
		}
		
	//========預約商品 CRUD===================
		
		public RbCart selectRbCart(String rbCartId) {
			Session session = getSession(); 
			return (RbCart)session.get(RbCart.class, rbCartId);
		}
		
		public RbCart insertRbCart(RbCart rbCart) {
			Session session = getSession();
			session.save(rbCart);
			return rbCart;
		}

		public boolean deleteRbCart(String rbCartId) {
			Session session = getSession();
			RbCart rs = session.get(RbCart.class,rbCartId);
			if(rs != null) {
				session.delete(rs);
				return true;
			}
			return false;
		}
		
		public void updateRbCart(RbCart rbCart) {
			Session session = getSession();
			session.update(rbCart);
		}
		
	//=======預約明細 CRUD====================
		
		public RbBill selectRbBill(String billId) {
			Session session = getSession(); 
			return (RbBill)session.get(RbBill.class, billId);
		}
		
		public RbBill insertRbBill(RbBill rbBill) {
			Session session = getSession();
			session.save(rbBill);
			return rbBill;
		}

		public boolean deleteRbBill(String billId) {
			Session session = getSession();
			RbBill rs = session.get(RbBill.class,billId);
			if(rs != null) {
				session.delete(rs);
				return true;
			}
			return false;
		}
		
		public void updateRbBill(RbBill rbBill) {
			Session session = getSession();
			session.update(rbBill);
		}
	
	//======綠界付款==========================
		
		public String payOrder(String orderId,String dateStr,String totalPrice,String rbName) {
			String date = dateStr.replaceAll("-", "/");
			all = new AllInOne("");
			AioCheckOutOneTime obj = new AioCheckOutOneTime();
			obj.setMerchantTradeNo(orderId);
			obj.setMerchantTradeDate(date);
			obj.setTotalAmount(totalPrice);
			obj.setTradeDesc("test Description");
			obj.setItemName(rbName);
			obj.setReturnURL("http://211.23.128.214:5000");
			obj.setClientBackURL("http://localhost:8080/EEIT124Team1FinalProject/orderSuccess?ors=1&orderId="+orderId);
			obj.setNeedExtraPaidInfo("N");
			obj.setRedeem("Y");
			String form = all.aioCheckOut(obj, null);
			return form;		
		}
		
	//====搜尋該會員擁有的訂單================
		
		public List<RbOrder> selectOrderByMenber(String memberId){
			Session session = getSession(); //與資料庫取得連線
			Query<RbOrder> query = session.createQuery("select order from RbOrder order where order.memberId=?1",RbOrder.class);
			query.setParameter(1,memberId);
			List<RbOrder> orders = query.list();
			return orders;		
		}
	
	//==用orderId去撈出該筆訂單預約的所有商品==========
		
		public ArrayList<RbCart> selectCartByOrder(String orderId){
			RbOrder thisOrder = selectRbOrder(orderId);
			Set<RbCart> carts = thisOrder.getRbCart();
			ArrayList<RbCart> cartList = new ArrayList<RbCart>();
			cartList.addAll(carts);
			return cartList;		
		}
	
	//====用orderId去撈出預定人資料==========
		
		public RbBill selectBillByOrder(String orderId){
			RbOrder thisOrder = selectRbOrder(orderId);
			RbBill bill = thisOrder.getRbBill();
			return bill;		
		}
		
	//===random================================
		
		public long random(long begin,long end){ 
			long rtn = begin + (long)(Math.random() * (end - begin));
			if(rtn == begin || rtn == end){ 
			return random(begin,end); 
			} 
			return rtn; 
			} 
		
	//===生成指定範圍內的亂數時間(年月日)==============
		
		public List<String> randomDate(String bgDate,String edDate) {
			try {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			SimpleDateFormat dayOnly = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat timeOnly = new SimpleDateFormat("HH:mm");
			Date start = format.parse(bgDate);//轉換字串 開始日期 
			Date end = format.parse(edDate);//轉換字串 結束日期
				if(start.getTime() >= end.getTime()){ 
				}
			long date = random(start.getTime(),end.getTime()); 
			Date d=new Date(date);
			
			List<String> dateList = new ArrayList<String>();
			String dateText = format.format(d);
			String dayText = dayOnly.format(d);
			String timeText = timeOnly.format(d);
			dateList.add(dateText);
			dateList.add(dayText);
			dateList.add(timeText);
			return dateList;
				}catch (Exception e) {
					e.printStackTrace(); 
				}
			return null;
		}
}
