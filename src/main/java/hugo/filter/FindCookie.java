package main.java.hugo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class FindCookie implements Filter {
	String requestURI;

	public FindCookie() {

	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

//		HttpSession session = ((HttpServletRequest) request).getSession(false);
		if (request instanceof HttpServletRequest && response instanceof HttpServletResponse) {
			HttpServletRequest req = (HttpServletRequest) request;
			// **********Remember Me****************
			String cookieName = "";
			String user = "";
			String tmp = "";
			String rememberMe = "";

			Cookie[] cookies = req.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; i++) {
					cookieName = cookies[i].getName();
					if (cookieName.equals("user")) {

						user = cookies[i].getValue();
						System.out.println(user);
					} else if (cookieName.equals("password")) {

						tmp = cookies[i].getValue();
						System.out.println(tmp);
					} else if (cookieName.equals("rm")) {

						rememberMe = cookies[i].getValue();
						System.out.println(rememberMe);
					}
				}
			} else {
				
			}

			request.setAttribute("rememberMe", rememberMe);
			request.setAttribute("user", user);
			request.setAttribute("CookiePassword", tmp);

		}
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
	}

	@Override
	public void destroy() {
	}

}
