package main.java.hugo.dao;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Repository;

@Repository("loginDAO")
public class LoginDAO {

	public void CheckRememberMe(String userId, String password, String rm, HttpServletRequest request,
			HttpServletResponse response) {
		System.out.println("開始登入驗證");
		System.out.println("rm-----"+rm);
		try {
			// **********Remember Me****************************
			Cookie cookieUser = null;
			Cookie cookiePassword = null;
			Cookie cookieRememberMe = null;
			// rm存放瀏覽器送來之RememberMe的選項，如果使用者對RememberMe打勾，rm就不會是null
			if (!rm.equals("")) {
				cookieUser = new Cookie("user", userId);
				cookieUser.setMaxAge(7 * 24 * 60 * 60); // Cookie的存活期: 七天
				cookieUser.setPath(request.getContextPath());
				System.out.println("------有勾選記住密碼------");
//				String encodePassword = GlobalService.encryptString(password);//加密
				cookiePassword = new Cookie("password", password);
				cookiePassword.setMaxAge(7 * 24 * 60 * 60);
				cookiePassword.setPath(request.getContextPath());

				cookieRememberMe = new Cookie("rm", "true");
				cookieRememberMe.setMaxAge(7 * 24 * 60 * 60);
				cookieRememberMe.setPath(request.getContextPath());
			} else { // 使用者沒有對 RememberMe 打勾
				cookieUser = new Cookie("user", userId);
				cookieUser.setMaxAge(0); // MaxAge==0 表示要請瀏覽器刪除此Cookie
				cookieUser.setPath(request.getContextPath());

//				String encodePassword = GlobalService.encryptString(password);//加密
				cookiePassword = new Cookie("password", password);
				cookiePassword.setMaxAge(0);
				cookiePassword.setPath(request.getContextPath());

				cookieRememberMe = new Cookie("rm", "true");
				cookieRememberMe.setMaxAge(0);
				cookieRememberMe.setPath(request.getContextPath());
			}
			response.addCookie(cookieUser);
			response.addCookie(cookiePassword);
			response.addCookie(cookieRememberMe);
			// ********************************************
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("cookie error");
		}

	}

}
