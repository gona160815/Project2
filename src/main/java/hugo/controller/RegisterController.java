package main.java.hugo.controller;

import java.security.GeneralSecurityException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;
import java.util.UUID;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

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
import main.java.hugo.service.MemberAdvancedServiceImpl;
import main.java.hugo.service.MemberAreaServiceImpl;
import main.java.hugo.service.MemberAuthServiceImpl;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.hugo.service.MemberLevelServicImpl;
import main.java.hugo.service.StatusServiceImpl;
import main.java.hugo.util.MailUtils;
import main.java.hugo.util.PasswordUtils;

@Controller
@SessionAttributes({ "uuid", "register", "MemberAdvanced", "loginOK", "resetMember" })
public class RegisterController {
	@Autowired
	@Qualifier("memberBasicServiceImpl")
	MemberBasicServiceImpl memberBasicServiceImpl;

	@Autowired
	@Qualifier("memberAuthServiceImpl")
	MemberAuthServiceImpl memberAuthServiceImpl;

	@Autowired
	@Qualifier("memberAreaServiceImpl")
	MemberAreaServiceImpl memberAreaServiceImpl;

	@Autowired
	@Qualifier("memberAdvancedServiceImpl")
	MemberAdvancedServiceImpl memberAdvancedServiceImpl;

	@Autowired
	@Qualifier("favorServiceImpl")
	FavorServiceImpl favorServiceImpl;

	@Autowired
	@Qualifier("statusServiceImpl")
	StatusServiceImpl statusServiceImpl;

	@Autowired
	@Qualifier("memberLevelServicImpl")
	MemberLevelServicImpl memberLevelServicImpl;

	@Autowired
	@Qualifier("authorityServiceImpl")
	AuthorityServiceImpl authorityServiceImpl;

	// 導向註冊頁面
	@RequestMapping(path = "/registPage")
	public String registerPage() {
		return "member/registration_basicform";
	}

	// 導向進階註冊/會員資料
	@RequestMapping("/infoPage")
	public String infoPage(Model model) {
		MemberBasic mBasic = (MemberBasic) model.getAttribute("loginOK");
		System.out.println("loginOK" + mBasic);
		if (null != mBasic) {
			return "member/registration_advancedform2";
		} else {
			return "redirect:/loginPage";
		}
	}

	// 導向忘記密碼頁面
	@RequestMapping("/forgetPasswordPage")
	public String forgetPasswordPage() {
		return "member/ForgetPassword";
	}

	// 導向重設密碼頁面
	@RequestMapping("/resetPasswordPage")
	public String resetPasswordPage() {
		return "member/resetPWD";
	}

	// 導向信箱驗證頁面
	@RequestMapping("/checkEmailPage")
	public String checkEmailPage() {
		return "member/RegistCheck2";
	}

	// 匯入資料(會員)
	@RequestMapping("/initMember")
	public void initDB() {
		String name = "";
		String pwd = "";
		String gender = "";
		Integer areaId = 0;
		Integer favorId = 0;
		String tel = "";
		String account = "";
		Random r = new Random();
		int nextInt = r.nextInt(50);
		for (int i = 0; i < nextInt; i++) {
			int nextInt2 = r.nextInt(51);
			int nextInt3 = r.nextInt(51);
			int nextInt4 = r.nextInt(30);
			if (nextInt2 % 3 == 0) {
				name = "王曉明";
				pwd = "asd123";
				gender = "Male";
				areaId = r.nextInt(22) + 1;
				favorId = r.nextInt(8) + 1;
				tel = "0943861753";
				account = "abc" + areaId + favorId + "@gmail.com";
			} else if (nextInt2 % 3 == 1) {
				name = "蘇怡靜";
				pwd = "asd456";
				gender = "Female";
				areaId = r.nextInt(22) + 1;
				favorId = r.nextInt(8) + 1;
				tel = "0976481193";
				account = "qwe" + areaId + favorId + "@gmail.com";
			} else {
				name = "蘇怡靜";
				pwd = "asd789";
				gender = "Other";
				areaId = r.nextInt(22) + 1;
				favorId = r.nextInt(8) + 1;
				tel = "0916578914";
				account = "qwe" + areaId + favorId + "@gmail.com";
			}

			try {
				//

				//

				MemberBasic user = null;
				try {
					// 註冊日期

					Random rand = new Random();
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					Calendar cal = Calendar.getInstance();
					cal.set(2020, 0, 01);
					long start = cal.getTimeInMillis();
					cal.set(2020, 11, 15);
					long end = cal.getTimeInMillis();
					java.sql.Date date3 = null;
					for (int j = 0; j < 10; j++) {
						Date d = new Date(start + (long) (rand.nextDouble() * (end - start)));
						date3 = new java.sql.Date(d.getTime());
						System.out.println(format.format(d));
					}
					// 一般登入方式
					if (nextInt4 % 3 == 0) {
						// 加密
//					String encrypt = PasswordUtils.encrypt(pwd);
//						String encrypt = PasswordUtils.oneWayEncrypt(pwd);
						String encrypt = PasswordUtils.BCryptPasswordEncoder(pwd);
						String loginType = "一般";
						user = new MemberBasic(name, encrypt, gender, areaId, tel, account, favorId, date3, loginType);// 設定基本資料表格

					} else if (nextInt4 % 3 == 1) {
						String encrypt = null;
						String loginType = "facebook";
						user = new MemberBasic(name, encrypt, gender, areaId, tel, account, favorId, date3, loginType);// 設定基本資料表格
					} else {
						String encrypt = null;
						String loginType = "google";
						user = new MemberBasic(name, encrypt, gender, areaId, tel, account, favorId, date3, loginType);// 設定基本資料表格
					}
					// 只增加第三方登入
//					if (nextInt4%2==0) {
//						String encrypt = null;
//						String loginType = "facebook"; 
//						user = new MemberBasic(name, encrypt, gender, areaId, tel, account, favorId, date3,loginType);// 設定基本資料表格
//					}else {
//						String encrypt = null;
//						String loginType = "google"; 
//						user = new MemberBasic(name, encrypt, gender, areaId, tel, account, favorId, date3,loginType);// 設定基本資料表格
//					}
					// 設定權限狀態資料表格
					// insert權限狀態資料表格
//						MemberAuthServiceImpl memberAuthServiceImpl = new MemberAuthServiceImpl(sessionHibernate);
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
					Favor favor = favorServiceImpl.select(favorId);
					MemberArea memberArea = memberAreaServiceImpl.select(areaId);
					// 設定基本資料表格
					if (nextInt3 % 2 == 0) {
						Random rand2 = new Random();
						SimpleDateFormat format2 = new SimpleDateFormat("yyyy-MM-dd");
						Calendar cal2 = Calendar.getInstance();
						cal2.set(1950, 0, 1);
						long start2 = cal2.getTimeInMillis();
						cal2.set(2005, 0, 1);
						long end2 = cal2.getTimeInMillis();
						java.sql.Date date4 = null;
						for (int j = 0; j < 10; j++) {
							Date d2 = new Date(start2 + (long) (rand2.nextDouble() * (end2 - start2)));
							date4 = new java.sql.Date(d2.getTime());
						}
						Status status2 = statusServiceImpl.select(2);
						memberAuth.setStatus(status2);

						MemberLevel level = memberLevelServicImpl.select(r.nextInt(4) + 1);
						memberAuth.setMemberLevel(level);

						MemberAdvanced memberAdvanced = new MemberAdvanced();
						memberAdvanced.setMemberBasic(user);
						memberAdvanced.setBirthday(date4);
						user.setMemberAdvanced(memberAdvanced);
						memberAdvancedServiceImpl.insert(memberAdvanced);
					}
					// insert基本資料表格
					user.setFavor(favor);
					user.setMemberArea(memberArea);
					user.setMemberAuth(memberAuth);
					memberBasicServiceImpl.insert(user);// 方法1111111111111111111111111111
					// insert基本資料表格 方法2222222222222222222222222222
//					HashSet<MemberBasic> memberBasics = new HashSet<MemberBasic>();
//					memberBasics.add(user);
//					memberArea.setMemberBasics(memberBasics);
//					memberAreaServiceImpl.insert(memberArea);

				} catch (Exception e) {
					System.out.println("時間處理錯誤");
					e.printStackTrace();
				}

			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("mail Exception");
			}
		}

	}

//新增管理員
	@GetMapping("/initAdmin")
	public void initAdmin() {
		MemberBasic memberBasic = new MemberBasic();
		memberBasic.setEmail("eeit124group1Admin@gmail.com");
//		String encrypt = PasswordUtils.oneWayEncrypt("asd123");
		String encrypt = PasswordUtils.BCryptPasswordEncoder("asd123");
		memberBasic.setPassword(encrypt);
		memberBasic.setGender("Male");
		memberBasic.setName("管理員");
		Favor favor = favorServiceImpl.select(1);
		MemberArea memberArea = memberAreaServiceImpl.select(1);
		memberBasic.setMemberArea(memberArea);
		memberBasic.setFavor(favor);
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String dateString = sf.format(date);
		Date date2;
		try {
			date2 = sf.parse(dateString);
			java.sql.Date registTime = new java.sql.Date(date2.getTime());
			memberBasic.setRegistTime(registTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		MemberAuth memberAuth = new MemberAuth();
		// 設狀態已驗證
		Status status = statusServiceImpl.select(2);
		memberAuth.setStatus(status);
		// 設等級
		MemberLevel memberLevel = memberLevelServicImpl.select(1);
		memberAuth.setMemberLevel(memberLevel);
		// 設身分
		Authority authority = authorityServiceImpl.select(2);
		memberAuth.setAuthority(authority);
		//
		memberAuth.setMemberBasic(memberBasic);
		System.out.println(memberBasic.getEmail());
		memberBasic.setMemberAuth(memberAuth);
		memberBasicServiceImpl.insert(memberBasic);
	}

//	基本註冊
	@PostMapping(path = "/basicRegister.controller")
	public @ResponseBody Map<String, String> basicRegisterController(@RequestParam(name = "email") String account,
			@RequestParam(name = "password") String pwd, @RequestParam(name = "name") String name,
			@RequestParam(name = "gender") String gender, @RequestParam(name = "area") String areaStr,
			@RequestParam(name = "favor") String favorStr, @RequestParam(name = "tel") String tel, Model model) {
		Executor executor = Executors.newFixedThreadPool(10);
		System.out.println(account);

		Map<String, String> msg = new HashMap<String, String>();

		MemberBasic result = memberBasicServiceImpl.queryone(account);
		if (result == null) {// 尚未有此帳號

			System.out.println("email" + account);
			System.out.println(gender);
			int areaId = Integer.parseInt(areaStr);
			System.out.println(areaId);
			int favorId = Integer.parseInt(favorStr);
			System.out.println(favorId);
			try {
				Date date = new Date();
				SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
				String dateString = sf.format(date);
				Date date2;
				MemberBasic user = null;
				try {
					// 註冊日期
					date2 = sf.parse(dateString);
					java.sql.Date registTime = new java.sql.Date(date2.getTime());
					// 註冊方式
					String loginType = "一般";
					// 加密
//					String encrypt = PasswordUtils.encrypt(pwd);
//					String encrypt = PasswordUtils.oneWayEncrypt(pwd);
					String encrypt = PasswordUtils.BCryptPasswordEncoder(pwd);
					user = new MemberBasic(name, encrypt, gender, areaId, tel, account, favorId, registTime, loginType);// 設定基本資料表格
					// 設定權限狀態資料表格
					// insert權限狀態資料表格
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
					Favor favor = favorServiceImpl.select(favorId);
					MemberArea memberArea = memberAreaServiceImpl.select(areaId);
					// 設定基本資料表格
					// insert基本資料表格
					user.setFavor(favor);
					user.setMemberArea(memberArea);
					user.setMemberAuth(memberAuth);
					memberBasicServiceImpl.insert(user);// 方法1111111111111111111111111111
					// insert基本資料表格 方法2222222222222222222222222222
//					HashSet<MemberBasic> memberBasics = new HashSet<MemberBasic>();
//					memberBasics.add(user);
//					memberArea.setMemberBasics(memberBasics);
//					memberAreaServiceImpl.insert(memberArea);

				} catch (ParseException e) {
					System.out.println("時間處理錯誤");
					e.printStackTrace();
				}
				// make uuid
				UUID uuid = UUID.randomUUID();
				String uuString = uuid.toString();
				String[] validArray = uuString.split("-");
				String validStr = validArray[0];
//				session.setAttribute("uuid", uuString);// 驗證碼
				model.addAttribute("uuid", validStr);// 驗證碼
//				session.setAttribute("register", user);// 註冊會員
				model.addAttribute("register", user);// 註冊會員
				String content = name + "恭喜您註冊成功，請在網頁中輸入以下驗證碼" + validStr;
				System.out.println(content);
				// 寄驗證信
				Runnable task = new Runnable() {

					@Override
					public void run() {
						// TODO Auto-generated method stub
						try {
							MailUtils.sendMail(account, content, 1);
						} catch (GeneralSecurityException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					}
				};
				executor.execute(task);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("mail Exception");
			}
			msg.put("registSuccess", "註冊成功");
			return msg;
		} else {
			msg.put("accountExist", "此帳號已被註冊");
			return msg;
		}
	}

//	驗證碼CHECK,
	@PostMapping(path = "/checkCAPTCHA.controller") // 輸入之驗證碼 //正確之驗證碼
	public String checkCAPTCHA(@RequestParam("check") String uuidInput, @ModelAttribute("uuid") String uuidString,
			@ModelAttribute("register") MemberBasic user, Model model) {

		String uuid = uuidInput.trim();// 會員輸入之驗證碼
		if (uuid.equals(uuidString)) {
			try {
//				將驗證欄位改為已驗證
				MemberAuth memberAuth = memberAuthServiceImpl.select(user.getMemberId());
				Status status = statusServiceImpl.select(2);
				memberAuth.setStatus(status);
//				memberAuthServiceImpl.updateStatus(user.getMemberId());//將狀態改為已驗證
//				建立進階表格
				MemberAdvanced memberAdvanced = new MemberAdvanced();
				memberAdvanced.setMemberBasic(user);
				user.setMemberAdvanced(memberAdvanced);
				memberAdvancedServiceImpl.insert(memberAdvanced);
				model.addAttribute("MemberAdvanced", memberAdvanced);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
//		return "member/new_login";
		return "redirect:/login2Page";
	}

//	進階註冊
	@PostMapping(path = "/advancedRegister.json")
	public @ResponseBody Map<String, String> advancedRegisterController(
			@ModelAttribute("MemberAdvanced") @RequestBody MemberAdvanced mAdvanced, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		System.out.println("------進階表格ID:-----------" + mAdvanced.getMemberId());
		System.out.println("------進階表格nickName:-----------" + mAdvanced.getNickName());
		memberAdvancedServiceImpl.update(mAdvanced);
		System.out.println("------進階表格nickName:-----------" + mAdvanced.getNickName());
		model.addAttribute("MemberAdvanced", mAdvanced);
		map.put("success", "更新成功");
		return map;
	}

//	忘記密碼(寄)
	@RequestMapping(path = "/forgetPassword.controller")
	public String forgetPasswordController(@RequestParam(name = "account") String email) {
		Executor executor = Executors.newFixedThreadPool(10);
		MemberBasic rg = memberBasicServiceImpl.queryone(email);
		if (null != rg) {
			Integer memberId = rg.getMemberId();
			String memberIdStr = memberId.toString();
			String encrypt = PasswordUtils.encrypt(memberIdStr);
			System.err.println(encrypt);
//		String encrypt = PasswordUtils.oneWayEncrypt(memberIdStr);
			String hrefStr = "http://localhost:8080/EEIT124Team1FinalProject/resetMyPWD?path=" + encrypt;
			String content = rg.getName() + " 您好，請至以下連結重新設定您的密碼:<br>" + hrefStr + "<br>為了您的帳戶安全，請盡快更改密碼。";
			try {
				Runnable task = new Runnable() {

					@Override
					public void run() {
						// TODO Auto-generated method stub
						try {
							MailUtils.sendMail(email, content, 2);
						} catch (GeneralSecurityException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}

					}
				};
				executor.execute(task);
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("忘記密碼錯誤");
			}
			System.out.println("密碼已寄送");
		}
		return "member/new_login";
	}

	// 跳轉忘記密碼頁面
	@GetMapping("/resetMyPWD")
	public String forgotResetPSW(@RequestParam("path") String memberIdStr, Model model) {
		String decrypt = PasswordUtils.decrypt(memberIdStr);
		System.err.println(decrypt);
		Integer memberId = Integer.valueOf(decrypt);
		MemberBasic mBasic = memberBasicServiceImpl.select(memberId);
		model.addAttribute("resetMember", mBasic);
		return "member/forgotResetPSW";

	}

	// 忘記密碼重設
	@PostMapping(value = "/resetPassword.controller", produces = "application/json")
	public @ResponseBody Map<String, String> resetPassword(@RequestParam("password") String password, Model model) {
		MemberBasic mBasic = (MemberBasic) model.getAttribute("resetMember");
		Map<String, String> map = new HashMap<>();
		System.out.println("type:" + password);
//		String password2 = PasswordUtils.oneWayEncrypt(password);
		String password2 = PasswordUtils.BCryptPasswordEncoder(password);
		System.out.println("change:" + password2);
		if (null != mBasic) {
			mBasic.setPassword(password2);
			memberBasicServiceImpl.updateBasicInfo(mBasic);
			map.put("success", "更新成功");
		} else {
			map.put("error", "連線逾時");
		}
		return map;
	}

//	修改基本資料
	@PostMapping(value = "/updateBasicInfo.controller", produces = "application/json")
	public @ResponseBody Map<String, String> updateBasicInfo(
			@ModelAttribute(name = "loginOK") @RequestBody MemberBasic mBasic, Model model) {
		Map<String, String> map = new HashMap<>();
		System.out.println("----PSW----" + mBasic.getPassword());
//		String encrypt = PasswordUtils.encrypt(mBasic.getPassword());
		String encrypt = mBasic.getPassword();
		mBasic.setPassword(encrypt);
		memberBasicServiceImpl.updateBasicInfo(mBasic);
		model.addAttribute("loginOK", mBasic);
		map.put("success", "更新成功");
		return map;
	}

//	修改PSW //checkPWSW
	@PostMapping(value = "/updatePassword.controller", produces = "application/json")
	public @ResponseBody Map<String, String> updatePassword(@RequestParam("origin") String origin,
			@RequestParam("password") String password, Model model) {
		MemberBasic mBasic = (MemberBasic) model.getAttribute("loginOK");
		Map<String, String> map = new HashMap<>();
		String password2 = mBasic.getPassword();
//		boolean checkPSW = PasswordUtils.checkPSW(origin, password2);
		boolean checkPSW = PasswordUtils.checkBCryptPSW(origin, password2);
		System.out.println("origin" + origin);
		System.out.println("password2" + password2);
		if (checkPSW) {
//			String oneWayEncrypt = PasswordUtils.oneWayEncrypt(password);
			String oneWayEncrypt = PasswordUtils.BCryptPasswordEncoder(password);
			System.out.println("oneWayEncrypt" + oneWayEncrypt);
			mBasic.setPassword(oneWayEncrypt);
			memberBasicServiceImpl.updateBasicInfo(mBasic);
			model.addAttribute("loginOK", mBasic);
			map.put("success", "更新成功");
		} else {
			map.put("error", "密碼錯誤");
		}
		return map;
	}

//	GOOGLE修改基本資料
	@PostMapping(value = "/updateBasicInfoByGoogle.controller", produces = "application/json")
	public @ResponseBody Map<String, String> updateBasicInfoByGoogle(
			@ModelAttribute(name = "loginOK") @RequestBody MemberBasic mBasic, Model model) {
		Map<String, String> map = new HashMap<>();
		memberBasicServiceImpl.updateBasicInfo(mBasic);
		model.addAttribute("loginOK", mBasic);
		//
		// 將驗證欄位改為已驗證
		MemberAuth memberAuth = memberAuthServiceImpl.select(mBasic.getMemberId());
		Status status = statusServiceImpl.select(2);
		memberAuth.setStatus(status);
//		建立進階表格
		MemberAdvanced memberAdvanced = new MemberAdvanced();
		memberAdvanced.setMemberBasic(mBasic);
		mBasic.setMemberAdvanced(memberAdvanced);
		memberAdvancedServiceImpl.insert(memberAdvanced);
		model.addAttribute("MemberAdvanced", memberAdvanced);
		map.put("success", "更新成功");
		return map;
	}
}
