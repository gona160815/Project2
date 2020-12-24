package main.java.hugo.aop;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import main.java.gona.model.RbOrder;
import main.java.gona.service.RentalBikeOrderService;
import main.java.hugo.model.MemberAuth;
import main.java.hugo.model.MemberBasic;
import main.java.hugo.model.MemberLevel;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.hugo.service.MemberLevelServicImpl;
import main.java.sixsix.dao.RegistDAO;
import main.java.sixsix.model.Hotel_Order;

@Component
@Aspect
public class MemberLevelAOP {
	
	@Autowired
	HttpSession httpSession;
	
	@Autowired
	RentalBikeOrderService rbOrderService;

	@Autowired // wen xuan's service
	RegistDAO DAO;
	
	@Autowired
	@Qualifier("memberLevelServicImpl")
	MemberLevelServicImpl memberLevelServicImpl;
	
	@Autowired
	@Qualifier("memberBasicServiceImpl")
	MemberBasicServiceImpl memberBasicServiceImpl;
	
	@Pointcut("execution(* main.java.hugo.controller.RegisterController.infoPage(..))")
	public void pointcut() {
	
	}
	
	@Before("pointcut()")
	public void before() {
		MemberBasic mBasic = (MemberBasic)httpSession.getAttribute("loginOK");
		if (mBasic!=null) {
			
			MemberAuth mAuth = mBasic.getMemberAuth();
			Integer memberId = mBasic.getMemberId();
			Integer rbMoney = 0;
			Integer hotelMoney = 0;
			Integer totalMoney = 0;
			String memnerIdStr = memberId.toString();
			// serch rental order
			List<RbOrder> orderList = rbOrderService.selectOrderByMenber(memnerIdStr);
			for (RbOrder rbOrder : orderList) {
				Integer rbPrice = rbOrder.getTotlalMoney();
				rbMoney = rbMoney + rbPrice;
			}
			// serch hotel order
			List<Hotel_Order> hotelList = DAO.searchMemberTotalOrder(memberId);
			for (Hotel_Order hotel_Order : hotelList) {
				Integer hotelPrice = hotel_Order.getMoney();
				hotelMoney = hotelMoney + hotelPrice;
			}
			totalMoney = rbMoney + hotelMoney;
			if (totalMoney >= 50000) {
				MemberLevel levelFour = memberLevelServicImpl.select(4);
				mAuth.setMemberLevel(levelFour);
			} else if (totalMoney >= 20000) {
				
				MemberLevel levelThree = memberLevelServicImpl.select(3);
				mAuth.setMemberLevel(levelThree);
			} else if (totalMoney >= 5000) {
				
				MemberLevel levelTwo = memberLevelServicImpl.select(2);
				mAuth.setMemberLevel(levelTwo);
			}
			
			List<MemberAuth> selectAuthority = memberBasicServiceImpl.selectAuthority(2);
			ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
			for (MemberAuth memberAuth : selectAuthority) {
				MemberBasic result = memberBasicServiceImpl.select(memberAuth.getMemberId());
				arrayList.add(result);
			}
			int num = arrayList.size();
			System.out.println("查詢筆數:" + num);
			httpSession.setAttribute("getAdmin", arrayList);
		}
	}
}
