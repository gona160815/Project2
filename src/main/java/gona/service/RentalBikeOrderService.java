package main.java.gona.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ecpay.payment.integration.domain.AioCheckOutOneTime;
import main.java.gona.dao.RentalBikeOrderDao;
import main.java.gona.model.RbBill;
import main.java.gona.model.RbCart;
import main.java.gona.model.RbOrder;
import main.java.gona.model.RentalBike;

@Service
public class RentalBikeOrderService {

	@Autowired
	private RentalBikeOrderDao rentalBikeOrderDao;
	
//查詢腳踏車(該店有引進)--------------------------------
	
	public List<RentalBike> getSearchRb(String Bgstore_Id){
		return rentalBikeOrderDao.getSearchRb(Bgstore_Id);		
	}	
	
//計算時間-----------------------------------------------
	
	public Integer getOrderDate(String bgDate,String edDate) {
		return rentalBikeOrderDao.getOrderDate(bgDate,edDate);
	}
	
//========RbOrder CRUD===============
	
	public RbOrder selectRbOrder(String rbOrderId) {
		return rentalBikeOrderDao.selectRbOrder(rbOrderId);
	}
			
	public RbOrder insertRbOrder(RbOrder rbOrder) {
		return rentalBikeOrderDao.insertRbOrder(rbOrder);
	}

	public boolean deleteRbOrder(String rbOrderId) {
		return rentalBikeOrderDao.deleteRbOrder(rbOrderId);
	}
			
	public void updateRbOrder(RbOrder rbOrder) {
		updateRbOrder(rbOrder);
	}

//========預約商品 CRUD===============
	
	public RbCart selectRbCart(String rbCartId) {
		return rentalBikeOrderDao.selectRbCart(rbCartId);
	}
	
	public RbCart insertRbCart(RbCart rbCart) {
		return rentalBikeOrderDao.insertRbCart(rbCart);
	}

	public boolean deleteRbCart(String rbCartId) {
		return rentalBikeOrderDao.deleteRbCart(rbCartId);
	}
	
	public void updateRbCart(RbCart rbCart) {
		updateRbCart(rbCart);
	}

//=======預約明細 CRUD============================
	
	public RbBill selectRbBill(String billId) {
		return rentalBikeOrderDao.selectRbBill(billId);
	}
			
	public RbBill insertRbBill(RbBill rbBill) {
		return rentalBikeOrderDao.insertRbBill(rbBill);	
	}

	public boolean deleteRbBill(String billId) {
		return rentalBikeOrderDao.deleteRbBill(billId);	
	}
			
	public void updateRbBill(RbBill rbBill) {
		updateRbBill(rbBill);
	}
//========綠界付款=================================
	
	public String payOrder(String orderId,String date,String totalPrice,String rbName) {
		return rentalBikeOrderDao.payOrder(orderId,date,totalPrice,rbName);		
	}

//====搜尋該會員擁有的訂單==========================
	
	public List<RbOrder> selectOrderByMenber(String memberId){
		return rentalBikeOrderDao.selectOrderByMenber(memberId);		
	}

//====用orderId去撈出該筆訂單預約的所有商品==========
	
	public ArrayList<RbCart> selectCartByOrder(String orderId){
		return rentalBikeOrderDao.selectCartByOrder(orderId);		
	}

//====用orderId去撈出預定人資料==========
	
	public RbBill selectBillByOrder(String orderId){
		return rentalBikeOrderDao.selectBillByOrder(orderId);		
	}
//===random================================
	
	private long random(long begin,long end){ 
		return rentalBikeOrderDao.random(begin,end);
	} 
//===生成指定範圍內的亂數時間==============
	
	public List<String> randomDate(String bgDate,String edDate) {
		return rentalBikeOrderDao.randomDate(bgDate,edDate);	
	}
}
