package main.java.jackey.aop;

import java.util.Date;
import java.util.List;

import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import main.java.jackey.model.Event;
import main.java.jackey.model.service.EventService;

@Component
@Aspect
public class CheckEventDate {
	
	@Autowired
	EventService eventService;
	
	@Pointcut("execution(* main.java.jackey.controller.EventMgrController.*(..))")
	public void pointcut() {
		
	}
	
	@Before("pointcut()")
	public void before() {
		List<Event> list = eventService.selectAll();
		for (Event event : list) {
			Date endDate = event.getEndDate();
			if (endDate.before(new Date())) {
				eventService.delete(event.getEventId());
				System.out.println("====aop====Delete Event:"+event.getEventId());
			}
		}
		System.out.println("===AOP BEFORE===");
		
	}
	
	@After("pointcut()")
	public void after() {
		
	}
	
	
	
}
