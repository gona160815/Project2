package main.java.hugo.controller;

import java.io.IOException;
import java.io.PrintStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken.Payload;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.http.javanet.NetHttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;

import main.java.gona.model.RbOrder;
import main.java.gona.service.RentalBikeOrderService;
import main.java.hugo.model.Authority;
import main.java.hugo.model.Favor;
import main.java.hugo.model.MemberAdvanced;
import main.java.hugo.model.MemberArea;
import main.java.hugo.model.MemberAuth;
import main.java.hugo.model.MemberBasic;
import main.java.hugo.model.MemberLevel;
import main.java.hugo.model.Status;
import main.java.hugo.service.AuthorityServiceImpl;
import main.java.hugo.service.FavorServiceImpl;
import main.java.hugo.service.LoginService;
import main.java.hugo.service.MemberAdvancedServiceImpl;
import main.java.hugo.service.MemberAreaServiceImpl;
import main.java.hugo.service.MemberAuthServiceImpl;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.hugo.service.MemberLevelServicImpl;
import main.java.hugo.service.StatusServiceImpl;
import main.java.hugo.util.PasswordUtils;
import main.java.hugo.util.VerifyUtils;
import main.java.sixsix.dao.RegistDAO;
import main.java.sixsix.model.Hotel_Order;

//@Scope(value = "session")
@Controller
@SessionAttributes({ "loginOK", "MemberAdvanced", "rememberMe", "url", "getAdmin", "pictureUrl", "message" })
public class LoginController {

	@Autowired
	@Qualifier("loginService")
	LoginService loginService;

	@Autowired
	@Qualifier("memberBasicServiceImpl")
	MemberBasicServiceImpl memberBasicServiceImpl;

	@Autowired
	@Qualifier("memberAdvancedServiceImpl")
	MemberAdvancedServiceImpl memberAdvancedServiceImpl;

	@Autowired
	@Qualifier("memberAuthServiceImpl")
	MemberAuthServiceImpl memberAuthServiceImpl;

	@Autowired
	@Qualifier("statusServiceImpl")
	StatusServiceImpl statusServiceImpl;

	@Autowired
	@Qualifier("memberLevelServicImpl")
	MemberLevelServicImpl memberLevelServicImpl;

	@Autowired
	@Qualifier("authorityServiceImpl")
	AuthorityServiceImpl authorityServiceImpl;

	@Autowired
	@Qualifier("favorServiceImpl")
	FavorServiceImpl favorServiceImpl;

	@Autowired
	@Qualifier("memberAreaServiceImpl")
	MemberAreaServiceImpl memberAreaServiceImpl;

	@Autowired
	RentalBikeOrderService rbOrderService;

	@Autowired // wen xuan's service
	RegistDAO DAO;
	
	
	@RequestMapping("/service") // 跳轉使用者客服
	public String service(Model model) {
		List<MemberAuth> selectAuthority = memberBasicServiceImpl.selectAuthority(2);
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		for (MemberAuth memberAuth : selectAuthority) {
			MemberBasic result = memberBasicServiceImpl.select(memberAuth.getMemberId());
			arrayList.add(result);
		}
		int num = arrayList.size();
		System.out.println("查詢筆數:" + num);
		model.addAttribute("getAdmin", arrayList);
		return "member/chatroom";
	}

	@RequestMapping("/service2")
	public String service2() {
		return "member/chatroom_service";
	}

	// 跳轉登入頁
	@RequestMapping("/loginPage")
	public String LoginPage(HttpServletRequest request, Model model) {
		String url = request.getHeader("referer");
		System.out.println("**********url:" + url);
		if (null != url) {
			String newUrl = url.substring(47);
			System.out.println(newUrl);
			if ("homepage?url=loginPage".equals(newUrl)) {
				model.addAttribute("url", "homepage");
			} else if ("loginPage".equals(newUrl)) {
				model.addAttribute("url", "homepage");
			} else if ("".equals(newUrl)) {
				model.addAttribute("url", "homepage");
			} else {
				model.addAttribute("url", newUrl);
			}
		}
		return "member/new_login";
	}

	// 跳轉首頁不帶上一頁紀錄
	@RequestMapping("/login2Page")
	public String Login2Page() {
		return "member/new_login";
	}

	// 跳轉首頁
	@RequestMapping("/homePage")
	public String HomePage() {
		return "homepage";
	}

	// 跳轉後台login(security)
	@RequestMapping("/adminLogin")
	public String adminLogin() {
		return "member/AdminLogin";
	}

	// 跳轉Google登入 填寫基本資料
	@RequestMapping("/googleInfo")
	public String googleInfo(Model model) {
		MemberBasic memberBasic = (MemberBasic) model.getAttribute("loginOK");
		model.addAttribute("loginOK", memberBasic);
		return "member/registration_oauthform";
	}

	// 管理員登入
	@PostMapping("/adminLoginController")
	public @ResponseBody void AdminLoginController(Model model, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(name = "username") String userId)
			throws IOException, Exception {
		
			MemberBasic result = memberBasicServiceImpl.queryone(userId);
			model.addAttribute("loginOK", result);// 设定登入会员物件
			// 用ID查詢此會員的進階表格取得其他資訊以便顯示在網頁上
			int memberId = result.getMemberId();
			MemberAdvanced memberAdvanced = memberAdvancedServiceImpl.select(memberId);
			if (memberAdvanced != null) {
				model.addAttribute("MemberAdvanced", memberAdvanced);
			}
	
	}

	// 登入
	@PostMapping("/memberLogin.controller")
	public @ResponseBody Map<String, String> MemberLoginController(Model model, HttpServletRequest request,
			HttpServletResponse response, @RequestParam(name = "account") String userId,
			@RequestParam(name = "password") String password,
			@RequestParam(name = "rememberMe", required = false) String rm, @RequestParam(name = "token") String token)
			throws IOException, Exception {
		System.out.println("rm=====" + rm);
		if (null == rm) {
			System.out.println("rm is null");
		}
		Map<String, String> msg = new HashMap<String, String>();
		// check cookie
		loginService.CheckRememberMe(userId, password, rm, request, response);
		// check token
		boolean valid = VerifyUtils.isValid(token);
		// check is member or not
		try {
			MemberBasic result = memberBasicServiceImpl.queryone(userId);
			System.out.println("-----是否有此會員-----------" + result == null);
			System.out.println("9999999999999999999999999999999999999999999999999999999999999");
			if (result != null) {
				// check password
				// 解密
				String password2 = result.getPassword();
//				String decrypt = PasswordUtils.decrypt(password2);
//				System.out.println("typePWD"+password);
//				System.out.println("DBPWD"+decrypt);
//				boolean checkPSW = PasswordUtils.checkPSW(password, password2);
				boolean checkPSW = PasswordUtils.checkBCryptPSW(password, password2);

//				if (password.equals(decrypt)) {
				if (checkPSW) {
					// session for customer service
					String message = "";
					model.addAttribute("message", message);
					// 檢查是否被停權
					MemberAuth memberAuth = memberAuthServiceImpl.select(result.getMemberId());
					System.out.println("------帳號狀態------------" + memberAuth.getStatus().getStatus());
					System.out.println("------帳號狀態------------" + memberAuth.getStatus().getStatusId());
					System.out.println("------帳號LEVEL------------" + memberAuth.getMemberLevel().getmLevel());
					if (valid) {

						if (memberAuth.getStatus().getStatusId() != 3) {
							model.addAttribute("loginOK", result);// 设定登入会员物件
							// 用ID查詢此會員的進階表格取得其他資訊以便顯示在網頁上
							int memberId = result.getMemberId();
							MemberAdvanced memberAdvanced = memberAdvancedServiceImpl.select(memberId);
							if (memberAdvanced != null) {
								model.addAttribute("MemberAdvanced", memberAdvanced);
							}
							System.out.println("7777777777777777777777777777777777777777777777777777777");
							System.out.println("------advance exist:-----------" + memberAdvanced == null);
//							System.out.println(
//									"------進階表格ID:-----------" + memberAdvanced.getMemberBasic().getMemberId());
//							System.out.println("------進階表格ID:-----------" + memberAdvanced.getMemberId());
							if (2 == memberAuth.getAuthority().getAuthorityId()) {
//							return "redirect:/adminPage.controller";
								msg.put("loginSuccess", "2");
								return msg;
							}
//						return "member/Homepage";
							msg.put("loginSuccess", "1");
							return msg;
						} else {
							System.out.println("帳號已被停權，無法登入");
//						return "member/new_login";
							msg.put("loginError", "此帳號已停權，如有疑問請洽詢客服人員");
							return msg;
						}
					} else {
						msg.put("loginError", "您未通過google recaptcha驗證");
						return msg;
					}
				} else {
					System.out.println("帳號或密碼錯誤");
//					return "member/new_login";
					msg.put("loginError", "帳號或密碼錯誤");
					return msg;
				}
			} else {
				System.out.println("查無此帳號");
//				return "member/new_login";
				msg.put("loginError", "帳號或密碼錯誤");
				return msg;
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("登入方法有錯");
//			return "member/new_login";
			msg.put("loginError", "帳號或密碼錯誤");
			return msg;
		}
	}

//	登入驗證
	public Map<String, String> loginCheck() {

		return null;
	}

	@RequestMapping("/memberLogout.controller") // 登出
	public String MemberLogoutController(@ModelAttribute("loginOK") MemberBasic memberBasic,
		SessionStatus sessionStatus, Model model, HttpSession session) {
		
		memberBasicServiceImpl.logOut();
		// WebRequest request
		sessionStatus.setComplete();
		System.out.println("sessionStatus setComplete");
//		HttpSession session = requst.getSession(false);
		session.invalidate();
		System.out.println("session invalidate");
		return "redirect:/homepage";

	}

	// google oauth 附帶新的MemberBasic
	@PostMapping("/googleLoging")
	public @ResponseBody Map<String, Object> googleLoging(@RequestParam("id_token") String idTokenString, Model model)
			throws Exception, IOException {

		HashMap<String, Object> map = new HashMap<String, Object>();

		GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(new NetHttpTransport(),
				JacksonFactory.getDefaultInstance())
						// Specify the CLIENT_ID of the app that accesses the backend:
						.setAudience(Collections.singletonList(
								"514166050422-k0sff2opmpf37l6865c1n5tnsbhi8rcj.apps.googleusercontent.com"))
						// Or, if multiple clients access the backend:
						// .setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
						.build();

		// (Receive idTokenString by HTTPS POST)

		GoogleIdToken idToken = verifier.verify(idTokenString);
		if (idToken != null) {
			Payload payload = idToken.getPayload();

			// Print user identifier
			String userId = payload.getSubject();
			System.out.println("User ID: " + userId);

			// Get profile information from payload
			String email = payload.getEmail();
			System.out.println(email);// mail
			boolean emailVerified = Boolean.valueOf(payload.getEmailVerified());
			String name = (String) payload.get("name");// 名字
			System.out.println(name);
			String pictureUrl = (String) payload.get("picture");// 頭貼
			System.out.println(pictureUrl);
			String locale = (String) payload.get("locale");
			System.out.println(locale);
			String familyName = (String) payload.get("family_name");
			System.out.println(familyName);
			String givenName = (String) payload.get("given_name");
			System.out.println(givenName);
			// Use or store profile information ...
			String loginType = "google";
			if (emailVerified) {
				MemberBasic result = memberBasicServiceImpl.queryone(email);
				if (!"".equals(pictureUrl) && null != pictureUrl) {
					model.addAttribute("pictureUrl", pictureUrl);
				}
				if (result == null) {// 尚未有此帳號
//					
					Date date = new Date();
					SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
					String dateString = sf.format(date);
					Date date2;
					MemberBasic user = new MemberBasic();
					try {
						// 註冊日期
						date2 = sf.parse(dateString);
						java.sql.Date registTime = new java.sql.Date(date2.getTime());
						// setMemberBaisc
						user.setRegistTime(registTime);
						user.setEmail(email);
						user.setName(name);
						user.setLoginType(loginType);
						// 設定基本資料表格
						// 設定權限狀態資料表格
						// insert權限狀態資料表格
//								MemberAuthServiceImpl memberAuthServiceImpl = new MemberAuthServiceImpl(sessionHibernate);
						MemberAuth memberAuth = new MemberAuth();
						// 設狀態未驗證
						Status status = statusServiceImpl.select(1);
						memberAuth.setStatus(status);
						// 設等級
						MemberLevel memberLevel = memberLevelServicImpl.select(1);
						memberAuth.setMemberLevel(memberLevel);
						// 設身分
						Authority authority = authorityServiceImpl.select(1);
						memberAuth.setAuthority(authority);
						//
						memberAuth.setMemberBasic(user);

						// 設定基本資料表格
						Favor favor = favorServiceImpl.select(1);// test
						MemberArea memberArea = memberAreaServiceImpl.select(1);// test
						// insert基本資料表格
						user.setFavor(favor);
						user.setMemberArea(memberArea);
						user.setMemberAuth(memberAuth);
						MemberBasic memberBasic = memberBasicServiceImpl.insert(user);// 方法1111111111111111111111111111
						model.addAttribute("loginOK", memberBasic);
						map.put("registSuccess", "註冊成功");
						return map;
					} catch (ParseException e) {
						System.out.println("時間處理錯誤");
						e.printStackTrace();
						map.put("error", "出現異常，無法登入");
						return map;
					}
				} else if (2 == result.getMemberAuth().getStatus().getStatusId() && null == result.getPassword()) {
					// 已認證完成資料完整 直接登入成功
					// set loginOK
					MemberAdvanced memberAdvanced = memberAdvancedServiceImpl.select(result.getMemberId());
					if (memberAdvanced != null) {
						model.addAttribute("MemberAdvanced", memberAdvanced);
					}
					model.addAttribute("loginOK", result);
					map.put("loginSuccess", "登入成功");
					return map;
				} else if (1 == result.getMemberAuth().getStatus().getStatusId() && null == result.getPassword()) {
					MemberAdvanced memberAdvanced = memberAdvancedServiceImpl.select(result.getMemberId());
					if (memberAdvanced != null) {
						model.addAttribute("MemberAdvanced", memberAdvanced);
					}
					model.addAttribute("loginOK", result);
					map.put("inputInfo", "補滿資料");
					return map;
				} else {
					map.put("emailExist", "帳號已存在");
					return map;
				}
			} else {
				System.out.println("Gmail尚未經過驗證，無法成功登入!");
				map.put("error", "Gmail尚未經過驗證，無法成功登入!");
				return map;
			}

		} else {
			map.put("error", "出現異常，無法登入");
			System.out.println("Invalid ID token.");
			return map;
		}

	}

	// facebook oauth 附帶新的MemberBasic
	@PostMapping("/facebookLoging")
	public @ResponseBody Map<String, Object> facebookLoging(@RequestParam("email") String email,
			@RequestParam("name") String name, Model model) throws Exception, IOException {

		HashMap<String, Object> map = new HashMap<String, Object>();

		MemberBasic result = memberBasicServiceImpl.queryone(email);
		String loginType = "facebook";
		if (result == null) {// 尚未有此帳號
//					
			Date date = new Date();
			SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
			String dateString = sf.format(date);
			Date date2;
			MemberBasic user = new MemberBasic();
			try {
				// 註冊日期
				date2 = sf.parse(dateString);
				java.sql.Date registTime = new java.sql.Date(date2.getTime());
				// setMemberBaisc
				user.setRegistTime(registTime);
				user.setEmail(email);
				user.setName(name);
				user.setLoginType(loginType);
				// 設定基本資料表格
				// 設定權限狀態資料表格
				// insert權限狀態資料表格
//								MemberAuthServiceImpl memberAuthServiceImpl = new MemberAuthServiceImpl(sessionHibernate);
				MemberAuth memberAuth = new MemberAuth();
				// 設狀態未驗證
				Status status = statusServiceImpl.select(1);
				memberAuth.setStatus(status);
				// 設等級
				MemberLevel memberLevel = memberLevelServicImpl.select(1);
				memberAuth.setMemberLevel(memberLevel);
				// 設身分
				Authority authority = authorityServiceImpl.select(1);
				memberAuth.setAuthority(authority);
				//
				memberAuth.setMemberBasic(user);

				// 設定基本資料表格
				Favor favor = favorServiceImpl.select(1);// test
				MemberArea memberArea = memberAreaServiceImpl.select(1);// test
				// insert基本資料表格
				user.setFavor(favor);
				user.setMemberArea(memberArea);
				user.setMemberAuth(memberAuth);
				MemberBasic memberBasic = memberBasicServiceImpl.insert(user);// 方法1111111111111111111111111111
				model.addAttribute("loginOK", memberBasic);
				map.put("registSuccess", "註冊成功");
				return map;
			} catch (ParseException e) {
				System.out.println("時間處理錯誤");
				e.printStackTrace();
				map.put("error", "出現異常，無法登入");
				return map;
			}
		} else if (2 == result.getMemberAuth().getStatus().getStatusId() && null == result.getPassword()) {
			// 已認證完成資料完整 直接登入成功
			// set loginOK
			MemberAdvanced memberAdvanced = memberAdvancedServiceImpl.select(result.getMemberId());
			if (memberAdvanced != null) {
				model.addAttribute("MemberAdvanced", memberAdvanced);
			}
			model.addAttribute("loginOK", result);
			map.put("loginSuccess", "登入成功");
			return map;
		} else if (1 == result.getMemberAuth().getStatus().getStatusId() && null == result.getPassword()) {
			MemberAdvanced memberAdvanced = memberAdvancedServiceImpl.select(result.getMemberId());
			if (memberAdvanced != null) {
				model.addAttribute("MemberAdvanced", memberAdvanced);
			}
			model.addAttribute("loginOK", result);
			map.put("inputInfo", "補滿資料");
			return map;
		} else {
			map.put("emailExist", "帳號已存在");
			return map;
		}

	}

	// test member's level
	@PostMapping("/memberLevel.controller")
	public @ResponseBody String memberLevel(Model model) {
		MemberBasic mBasic = (MemberBasic) model.getAttribute("loginOK");
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
		} else if (totalMoney >= 10000) {

			MemberLevel levelTwo = memberLevelServicImpl.select(2);
			mAuth.setMemberLevel(levelTwo);
		}

		return null;
	}

}
