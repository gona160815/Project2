package main.java.util;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

public class OpenSessionInViewFilter implements Filter {
	@Autowired
	private SessionFactory sessionFactory;
	private WebApplicationContext context;

	@Override
	public void init(FilterConfig config) throws ServletException {
		ServletContext application = config.getServletContext();
		context = WebApplicationContextUtils.getWebApplicationContext(application);
		sessionFactory = (SessionFactory) context.getBean(SessionFactory.class);
		System.out.println("filter init");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.beginTransaction();
			System.out.println("Transaction Begin");

			chain.doFilter(request, response);

			session.getTransaction().commit();
			System.out.println("Transaction Commit");
		} catch (Exception e) {
			session.getTransaction().rollback();
			System.out.println("Transaction Rollback");
			e.printStackTrace();
		} finally {
			System.out.println("Session closed");
		}
	}
}
