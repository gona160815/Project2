package main.java.gona.aop;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import main.java.gona.model.RbOrder;
import main.java.gona.service.RentalBikeOrderService;
import main.java.hugo.model.MemberBasic;

@Component
@Aspect
public class rbOrderStatusAop {
	
	@Autowired
	RentalBikeOrderService rbOrderService;
	
	@Autowired
	HttpSession session;
	
	@Pointcut("execution(* main.java.gona.controller.RentalBikeOrderController.rbOrderDetail(..))")
	public void pointcut() {
	
	}
	
	@Before("pointcut()")
	public void before() {
		System.out.println("有嗎嗎");
		MemberBasic member = (MemberBasic) session.getAttribute("loginOK");
		if (member!=null) {	
			try {
			String memberId = Integer.toString(member.getMemberId());
			List<RbOrder> orders  = rbOrderService.selectOrderByMenber(memberId);
			for(RbOrder order :orders) {
				String bgDateString = order.getBgDate();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date bgDate = sdf.parse(bgDateString); //取得起始日期
				Calendar nowCalendar = Calendar.getInstance();
				Calendar orderTime = Calendar.getInstance();
				orderTime.setTime(bgDate); //獲得起始日期日曆
				System.err.println(bgDate);
				long now = nowCalendar.getTime().getTime();
				long od = orderTime.getTime().getTime();
				Long leftDays = (od-now) / (1000 * 60 * 60 * 24);
				if(leftDays<=3) {
					order.getRbBill().setOrderStatus(3);
					System.out.println(order.getRbBill().getOrderStatus());
				}		
				
			}
			
			}catch (ParseException e){
				e.printStackTrace();
			}
		}
		
	}

}



