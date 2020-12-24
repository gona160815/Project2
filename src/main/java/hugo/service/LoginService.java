package main.java.hugo.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.LoginDAO;

@Service("loginService")
public class LoginService {
	@Autowired @Qualifier("loginDAO")
	private LoginDAO loginDAO;
	
	public void CheckRememberMe(String userId, String password, String rm, HttpServletRequest request,
			HttpServletResponse response) {
		loginDAO.CheckRememberMe(userId, password, rm, request, response);
	}
}
