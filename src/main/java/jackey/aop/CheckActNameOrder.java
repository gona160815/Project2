package main.java.jackey.aop;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import main.java.hugo.model.MemberBasic;
import main.java.jackey.model.ActName;
import main.java.jackey.model.EventActivity;
import main.java.jackey.model.service.ActNameService;
import main.java.jackey.model.service.EventActivityService;

@Component
@Aspect
public class CheckActNameOrder {
	@Autowired
	ActNameService actNameService;
	@Autowired
	EventActivityService activityService;
	@Autowired
	HttpSession session;

	@Pointcut("execution(* main.java.jackey.controller.ActivityPageController.myActivityPage(..))")
	public void pointcut() {

	}

	@Before("pointcut()")
	public void before() {
		try {
			MemberBasic member = (MemberBasic) session.getAttribute("loginOK");
			List<ActName> list = actNameService.selectByMember(member.getMemberId());
			for (ActName actName : list) {
				String orderTimeStr = actName.getOrderTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				Date date = sdf.parse(orderTimeStr);
				Calendar nowCalendar = Calendar.getInstance();
				Calendar orderTime = Calendar.getInstance();
				orderTime.setTime(date);
				long now = nowCalendar.getTime().getTime();
				long order = orderTime.getTime().getTime();
				Long leftDays = (now - order) / (1000 * 60 * 60 * 24);
				Integer price = actName.getPrice();
				if (price > 0 && leftDays > 5) {
					actName.setStatus(3);
					List<EventActivity> selectByActName = activityService.selectByActName(actName.getName(),
							actName.getMemberId());
					for (EventActivity result : selectByActName) {
						activityService.delete(result.getActivityId());
					}
					System.out.println("=====AOP CHECK ORDER ILLEGAL======");
				}
			}

		} catch (ParseException e) {
			e.printStackTrace();
		}
	}

	@After("pointcut()")
	public void after() {

	}

}
