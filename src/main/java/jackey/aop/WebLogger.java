package main.java.jackey.aop;

import org.apache.log4j.Logger;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class WebLogger {
	
	private Logger log = Logger.getLogger(getClass());
	
	@Pointcut("execution(* main.java.jackey..*(..))")
	public void pointcut() {
		
	}
	
	@After("execution(* main.java.jackey.controller..*(..))")
	public void log(JoinPoint joinPoint) {
		System.out.println("======LOG===========");
		System.out.println(joinPoint.getSignature().getName()+" called...");
		System.out.println("======LOG===========");
		log.info(joinPoint.getSignature().getName()+" called...");
		
	}
	
	@AfterThrowing(pointcut = "pointcut()",throwing = "e")
	public void errorLog(Exception e) {
		System.out.println("E:==============="+e.getMessage());
		log.error(e.getMessage());
	}
	
	
}
