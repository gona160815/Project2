package main.java.hugo.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
import main.java.hugo.util.DateUtils;
import main.java.hugo.util.PasswordUtils;

@Controller
@SessionAttributes({ "UserNumber", "count", "AdminNumber", "admin", "loginOK", "getAdmin", "selectedAdmin", "message" })
public class BackStageController {
	@Autowired
	ServletContext scx;

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
	@Qualifier("memberAreaServiceImpl")
	MemberAreaServiceImpl memberAreaServiceImpl;

	@Autowired
	@Qualifier("favorServiceImpl")
	FavorServiceImpl favorServiceImpl;

	// 處理客服訊息
	@PostMapping("/processMessage")
	public @ResponseBody void processMessage(Model model, @RequestParam("message") String message) {
		model.addAttribute("message", message);
		System.err.println(message);
	}

	// 會員詳細資訊頁面
	@RequestMapping("/memberinfo")
	public String memberInfoPage(Model model) {
		MemberBasic mBasic = (MemberBasic) model.getAttribute("loginOK");
		if (null != mBasic) {
			return "member/member_detail";
		} else {
			return "redirect:/loginPage";
		}
	}

	// 設定頁面
	@RequestMapping("/settingPage")
	public String settingPage(Model model) {
		MemberBasic mBasic = (MemberBasic) model.getAttribute("loginOK");
		if (null != mBasic) {
			return "member/managerSetting";
		} else {
			return "redirect:/loginPage";
		}
	}

	// 跳轉後台(security)
	@PostMapping("/adminPage")
	public String adminPage(Model model, @RequestParam String username, @RequestParam String password) {
		// set session
		MemberBasic result = memberBasicServiceImpl.queryone(username);
		model.addAttribute("loginOK", result);// 设定登入会员物件
		// 用ID查詢此會員的進階表格取得其他資訊以便顯示在網頁上
		int memberId = result.getMemberId();
		MemberAdvanced memberAdvanced = memberAdvancedServiceImpl.select(memberId);
		if (memberAdvanced != null) {
			model.addAttribute("MemberAdvanced", memberAdvanced);
		}
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		System.err.println("into admin------------------------------------");
		//
		List<MemberBasic> selectAll = memberBasicServiceImpl.selectAll();
//		int count = memberBasicServiceImpl.countAll();
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		for (MemberBasic memberBasic : selectAll) {
			if (null != memberBasic.getMemberAuth()) {
				if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
					arrayList.add(memberBasic);
				}
			}
		}
		int size = arrayList.size();
		model.addAttribute("member", arrayList);
		System.out.println("註冊會員總數:" + size);
		model.addAttribute("count", size);
		return "member/member";
	}

//跳轉管理員
	@RequestMapping("/adminPage.controller")
	public String adminPageController(Model model) {

//		MemberBasic mBasic = (MemberBasic) model.getAttribute("loginOK");
//		System.out.println(mBasic);
//		if (null != mBasic) {

		// 算會員總數
		try {
			List<MemberBasic> selectAll = memberBasicServiceImpl.selectAll();
//			int count = memberBasicServiceImpl.countAll();
			ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
			for (MemberBasic memberBasic : selectAll) {
				if (null != memberBasic.getMemberAuth()) {
					if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
						arrayList.add(memberBasic);
					}
				}
			}
			int size = arrayList.size();
			model.addAttribute("member", arrayList);
			System.out.println("註冊會員總數:" + size);
			model.addAttribute("count", size);
			return "member/member";
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("To Admin Error");
			return "redirect:/loginPage";
		}
//		} else {
//			return "redirect:/loginPage";
//		}
	}

	// 依地區查詢
	@RequestMapping(path = "/queryByArea.controller", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> queryByAreaController(Model model,
			@RequestParam(name = "area") Integer areaId) {

		System.out.println("以地區查詢會員");
		System.out.println("area:" + areaId);
		Map<String, Object> map = new HashMap<String, Object>();
		List<MemberBasic> selectFavor = memberBasicServiceImpl.selectArea(areaId);
		ArrayList<String> levelList = new ArrayList<String>();
		ArrayList<String> statusList = new ArrayList<String>();
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		for (MemberBasic memberBasic : selectFavor) {
			if (null != memberBasic.getMemberAuth()) {
				if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
					levelList.add(memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					statusList.add(memberBasic.getMemberAuth().getStatus().getStatus());
					arrayList.add(memberBasic);
					System.out.println(
							"*************LEVEL**********" + memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					System.out.println("*************ID**********" + memberBasic.getMemberId());
				}
			}
		}
		map.put("memberBasic", arrayList);
		map.put("level", levelList);
		map.put("status", statusList);
		return map;

	}

//	依性別查詢
	@PostMapping("/queryByGender")
	public @ResponseBody Map<String, Object> queryByGenderController(@RequestParam("gender") String gender,
			Model model) {

		List<MemberBasic> selectGender = memberBasicServiceImpl.selectGender(gender);
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> levelList = new ArrayList<String>();
		ArrayList<String> statusList = new ArrayList<String>();
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		for (MemberBasic memberBasic : selectGender) {
			if (null != memberBasic.getMemberAuth()) {
				if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
					levelList.add(memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					statusList.add(memberBasic.getMemberAuth().getStatus().getStatus());
					arrayList.add(memberBasic);
					System.out.println(
							"*************LEVEL**********" + memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					System.out.println("*************ID**********" + memberBasic.getMemberId());
				}
			}
		}
		map.put("memberBasic", arrayList);
		map.put("level", levelList);
		map.put("status", statusList);
		return map;

	}

//	依帳號狀態查詢
	@PostMapping("/queryByStatus")
	public @ResponseBody Map<String, Object> queryByStatusController(@RequestParam("status") int status, Model model) {
		List<MemberAuth> memberAuths = memberBasicServiceImpl.selectStatus(status);
		ArrayList<MemberBasic> arrayList2 = new ArrayList<MemberBasic>();
		for (MemberAuth memberAuth : memberAuths) {
			MemberBasic result = memberBasicServiceImpl.select(memberAuth.getMemberId());
			if (1 == result.getMemberAuth().getAuthority().getAuthorityId()) {
				arrayList2.add(result);
			}
		}
		Map<String, Object> map = new HashMap<String, Object>();
		ArrayList<String> levelList = new ArrayList<String>();
		ArrayList<String> statusList = new ArrayList<String>();
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		for (MemberBasic memberBasic : arrayList2) {
			if (null != memberBasic.getMemberAuth()) {
				if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
					levelList.add(memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					statusList.add(memberBasic.getMemberAuth().getStatus().getStatus());
					arrayList.add(memberBasic);
					System.out.println(
							"*************LEVEL**********" + memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					System.out.println("*************ID**********" + memberBasic.getMemberId());
				}
			}
		}
		map.put("memberBasic", arrayList);
		map.put("level", levelList);
		map.put("status", statusList);
		return map;

	}

	// 依身分查詢
	@RequestMapping("/toSettingPage")
	public String queryByAuthorityController(@RequestParam("authority") Integer authority, Model model) {
		List<MemberAuth> selectAuthority = memberBasicServiceImpl.selectAuthority(authority);
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		for (MemberAuth memberAuth : selectAuthority) {
			MemberBasic result = memberBasicServiceImpl.select(memberAuth.getMemberId());
			arrayList.add(result);
		}
		int num = arrayList.size();
		model.addAttribute("AdminNumber", num);
		System.out.println("查詢筆數:" + num);
		model.addAttribute("admin", arrayList);
		return "member/managerSetting";
	}

	// 查詢多位管理員
	@PostMapping("/getAdmins")
	public @ResponseBody List<MemberBasic> queryAuthorityController(@RequestParam("authority") Integer authority,
			Model model) {
		System.out.println("------------------------");
		List<MemberAuth> selectAuthority = memberBasicServiceImpl.selectAuthority(authority);
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		for (MemberAuth memberAuth : selectAuthority) {
			MemberBasic result = memberBasicServiceImpl.select(memberAuth.getMemberId());
			arrayList.add(result);
		}
		int num = arrayList.size();
		System.out.println("查詢筆數:" + num);
		model.addAttribute("getAdmin", arrayList);
		return arrayList;
	}

	// 查詢單位管理員
	@GetMapping("/getAdmin")
	public String queryAuthority(@RequestParam("Id") Integer authority, Model model) {

		MemberBasic mBasic = memberBasicServiceImpl.select(authority);

		model.addAttribute("selectedAdmin", mBasic);
		return "member/websoketTest2";
	}

	// 依自行車偏好查詢
	@PostMapping("/queryByFavor")
	public @ResponseBody Map<String, Object> queryByFavorController(@RequestParam("favorId") int favorId, Model model) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MemberBasic> selectFavor = memberBasicServiceImpl.selectFavor(favorId);
		ArrayList<String> levelList = new ArrayList<String>();
		ArrayList<String> statusList = new ArrayList<String>();
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		for (MemberBasic memberBasic : selectFavor) {
			if (null != memberBasic.getMemberAuth()) {
				if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
					levelList.add(memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					statusList.add(memberBasic.getMemberAuth().getStatus().getStatus());
					arrayList.add(memberBasic);
					System.out.println(
							"*************LEVEL**********" + memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					System.out.println("*************ID**********" + memberBasic.getMemberId());
				}
			}
		}
		map.put("memberBasic", arrayList);
		map.put("level", levelList);
		map.put("status", statusList);
		return map;

//		return "member/member";
	}

	// 停權
	@RequestMapping("/memberSuspension.controller")
	public @ResponseBody String MemberSuspensionController(@RequestParam(name = "memberId") String memberIdStr) {
		int memberId = Integer.valueOf(memberIdStr);
		MemberAuth memberAuth = memberAuthServiceImpl.select(memberId);
		Status status = statusServiceImpl.select(3);
		memberAuth.setStatus(status);
		return "1";
	}

	// 恢復權限
	@RequestMapping("/memberEmpowerment.controller")
	public @ResponseBody String MemberEmpowermentController(@RequestParam(name = "memberId") String memberIdStr) {
		int memberId = Integer.valueOf(memberIdStr);
		MemberAuth memberAuth = memberAuthServiceImpl.select(memberId);
		MemberAdvanced mAdvanced = memberAdvancedServiceImpl.select(memberId);
		Status status = null;
		String identity = null;
		if (null == mAdvanced) {
			status = statusServiceImpl.select(1);
			identity = "1";
		}
		if (null != mAdvanced) {
			status = statusServiceImpl.select(2);
			identity = "2";
		}
		memberAuth.setStatus(status);
		return identity;
	}

	// show member icon
	@GetMapping("/showMemberIcon")
	public @ResponseBody ResponseEntity<byte[]> showMemberIcon(@RequestParam(name = "id") Integer id) {
		ResponseEntity<byte[]> re = null;
		MemberAdvanced mAdvanced = memberAdvancedServiceImpl.select(id);
		String iconFileName = mAdvanced.getIconFileName();
		Blob icon = mAdvanced.getIcon();
		String mimeType = scx.getMimeType(iconFileName);
		MediaType mediaType = MediaType.valueOf(mimeType);
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			InputStream binaryStream = icon.getBinaryStream();
			byte[] b = new byte[2048];
			int len = 0;
			try {
				while ((len = binaryStream.read(b)) != -1) {
					baos.write(b, 0, len);
				}
				HttpHeaders headers = new HttpHeaders();
				headers.setContentType(mediaType);
				headers.setCacheControl(CacheControl.noCache().getHeaderValue());
				re = new ResponseEntity<byte[]>(baos.toByteArray(), headers, HttpStatus.OK);
			} catch (IOException e) {
				System.out.println("picture IOException");
				e.printStackTrace();
			}
		} catch (SQLException e) {
			System.out.println("picture SQLException");
			e.printStackTrace();
		}
		return re;
	}

//	單筆會員詳細資訊
	@PostMapping("/getMemberInfo")
	public @ResponseBody MemberBasic memberInfo(@RequestParam("id") Integer id) {
		MemberBasic memberBasic = memberBasicServiceImpl.select(id);
		return memberBasic;
	}

	// 全域搜尋
	@PostMapping("/allRangeQuery")
	public @ResponseBody Map<String, Object> allRangeQuery(@RequestParam("query") String query) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<MemberBasic> allRangeQuery = memberBasicServiceImpl.allRangeQuery(query);
		ArrayList<String> levelList = new ArrayList<String>();
		ArrayList<String> statusList = new ArrayList<String>();
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		for (MemberBasic memberBasic : allRangeQuery) {
			if (null != memberBasic.getMemberAuth()) {
				if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
					levelList.add(memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					statusList.add(memberBasic.getMemberAuth().getStatus().getStatus());
					arrayList.add(memberBasic);
					System.out.println(
							"*************LEVEL**********" + memberBasic.getMemberAuth().getMemberLevel().getmLevel());
					System.out.println("*************ID**********" + memberBasic.getMemberId());
				}
			}
		}
		map.put("memberBasic", arrayList);
		map.put("level", levelList);
		map.put("status", statusList);
		return map;
	}

	// 管理員新增
	@PostMapping(value = "/addMGR.controllers", produces = "application/json")
	public @ResponseBody Map<String, String> addMGR(MemberBasic memberBasic) {
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String dateString = sf.format(date);
		Date date2;
		try {
			String rawPassword = memberBasic.getPassword();
			String bCryptPassword = PasswordUtils.BCryptPasswordEncoder(rawPassword);
			memberBasic.setPassword(bCryptPassword);
			date2 = sf.parse(dateString);
			java.sql.Date registTime = new java.sql.Date(date2.getTime());
			memberBasic.setRegistTime(registTime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Favor favor = favorServiceImpl.select(1);
		MemberArea memberArea = memberAreaServiceImpl.select(memberBasic.getAreaId());
		memberBasic.setMemberArea(memberArea);
		memberBasic.setFavor(favor);
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
		Map<String, String> map = new HashMap<String, String>();
		System.out.println(memberBasic.getEmail());
		memberBasic.setMemberAuth(memberAuth);
		memberBasicServiceImpl.insert(memberBasic);
		map.put("success", "成功新增管理員");
		return map;
	}

	// delete MGR
	@PostMapping("/deleteMGR")
	public @ResponseBody Map<String, Object> deleteMGR(@RequestParam Integer memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		boolean deleteAuth = memberAuthServiceImpl.delete(memberId);
		boolean deleteMGR = memberBasicServiceImpl.deleteMGR(memberId);
		map.put("success", "成功移除");
		return map;

	}

	@PostMapping("getweekmember.controller")
	public @ResponseBody Map<String, Object> getWeekmember() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		// get now time(string)
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		String nowStr = sf.format(now);
		// 6days ago(string)
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -6);
		String yesterday = new SimpleDateFormat("yyyy-MM-dd").format(cal.getTime());
		System.out.println("6days ago" + yesterday);
		// get member time(sql to util)
		List<MemberBasic> members = memberBasicServiceImpl.selectAll();
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListMale = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListFemale = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListOther = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListBasic = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListAdvanced = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListDelete = new ArrayList<MemberBasic>();

		for (MemberBasic memberBasic : members) {

			if (null != memberBasic.getMemberAuth()) {
				if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
					java.sql.Date registTime = memberBasic.getRegistTime();
					Date date = new Date(registTime.getTime());
					if (DateUtils.isInDate(date, yesterday, nowStr)) {
						arrayList.add(memberBasic);
						if ("Male".equals(memberBasic.getGender())) {
							arrayListMale.add(memberBasic);
						} else if ("Female".equals(memberBasic.getGender())) {
							arrayListFemale.add(memberBasic);
						} else {
							arrayListOther.add(memberBasic);
						}

						if (1 == memberBasic.getMemberAuth().getStatus().getStatusId()) {
							arrayListBasic.add(memberBasic);
						} else if (2 == memberBasic.getMemberAuth().getStatus().getStatusId()) {
							arrayListAdvanced.add(memberBasic);
						} else {
							arrayListDelete.add(memberBasic);
						}
					}

				}
			}
		}
		int memberNums = arrayList.size();
		map.put("weekallnum", memberNums);
		map.put("weekallmem", arrayList);
		map.put("weekallMale", arrayListMale);
		map.put("weekallFemale", arrayListFemale);
		map.put("weekallOther", arrayListOther);
		map.put("weekallBasic", arrayListBasic);
		map.put("weekallAdvanced", arrayListAdvanced);
		map.put("weekallDelete", arrayListDelete);
		return map;
	}
	
	@PostMapping("getdaymember.controller")
	public @ResponseBody Map<String, Object> getDaymember() {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListMale = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListFemale = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListOther = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListBasic = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListAdvanced = new ArrayList<MemberBasic>();
		ArrayList<MemberBasic> arrayListDelete = new ArrayList<MemberBasic>();
		// get now time(string)
		Date now = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("dd-MM月-yy");
		String nowStr = sf.format(now);
		// 6days ago(string)//dd-MM月-yy
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, +1);
		String tomorrow = new SimpleDateFormat("dd-MM月-yy").format(cal.getTime());
		System.out.println("1days after" + tomorrow);
		List<MemberBasic> everyDayOfMember = memberBasicServiceImpl.getEveryDayOfMember(nowStr, tomorrow);
		for (MemberBasic memberBasic : everyDayOfMember) {
			if (null != memberBasic.getMemberAuth()) {
				if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
						arrayList.add(memberBasic);
						if ("Male".equals(memberBasic.getGender())) {
							arrayListMale.add(memberBasic);
						} else if ("Female".equals(memberBasic.getGender())) {
							arrayListFemale.add(memberBasic);
						} else {
							arrayListOther.add(memberBasic);
						}

						if (1 == memberBasic.getMemberAuth().getStatus().getStatusId()) {
							arrayListBasic.add(memberBasic);
						} else if (2 == memberBasic.getMemberAuth().getStatus().getStatusId()) {
							arrayListAdvanced.add(memberBasic);
						} else {
							arrayListDelete.add(memberBasic);
						}

				}
			}
		}
		int memberNums = arrayList.size();
		map.put("weekallnum", memberNums);
		map.put("weekallmem", arrayList);
		map.put("weekallMale", arrayListMale);
		map.put("weekallFemale", arrayListFemale);
		map.put("weekallOther", arrayListOther);
		map.put("weekallBasic", arrayListBasic);
		map.put("weekallAdvanced", arrayListAdvanced);
		map.put("weekallDelete", arrayListDelete);
		return map;
		
	}

	// get every area of member
	@PostMapping("/getEveryAreaOfMember.controller")
	public @ResponseBody List<Integer> getEveryAreaOfMember() {
		ArrayList<Integer> areasMember = new ArrayList<Integer>();
		for (int i = 1; i < 23; i++) {
			Integer num = 0;
			List<MemberBasic> everyAreaOfMember = memberBasicServiceImpl.getEveryAreaOfMember(i);
			for (MemberBasic memberBasic : everyAreaOfMember) {
				if (null != memberBasic.getMemberAuth()) {
					if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
						num++;
					}
				}
			}
			areasMember.add(num);
		}
		return areasMember;
	}

	// get every month member
	@PostMapping("/getEveryMonthOfMember")
	public @ResponseBody Map<String, Object> getEveryMonthOfMember() {
		List<MemberBasic> members = memberBasicServiceImpl.selectAll();
		HashMap<String, Object> map = new HashMap<String, Object>();
		// 總數
		int jan = 0;
		int feb = 0;
		int mar = 0;
		int apr = 0;
		int may = 0;
		int jun = 0;
		int jul = 0;
		int aug = 0;
		int sep = 0;
		int oct = 0;
		int nov = 0;
		int dec = 0;
		// 一般
		int janNormal = 0;
		int febNormal = 0;
		int marNormal = 0;
		int aprNormal = 0;
		int mayNormal = 0;
		int junNormal = 0;
		int julNormal = 0;
		int augNormal = 0;
		int sepNormal = 0;
		int octNormal = 0;
		int novNormal = 0;
		int decNormal = 0;
		// google
		int janGoogle = 0;
		int febGoogle = 0;
		int marGoogle = 0;
		int aprGoogle = 0;
		int mayGoogle = 0;
		int junGoogle = 0;
		int julGoogle = 0;
		int augGoogle = 0;
		int sepGoogle = 0;
		int octGoogle = 0;
		int novGoogle = 0;
		int decGoogle = 0;
		// facebook
		int janFacebook = 0;
		int febFacebook = 0;
		int marFacebook = 0;
		int aprFacebook = 0;
		int mayFacebook = 0;
		int junFacebook = 0;
		int julFacebook = 0;
		int augFacebook = 0;
		int sepFacebook = 0;
		int octFacebook = 0;
		int novFacebook = 0;
		int decFacebook = 0;

		for (MemberBasic memberBasic : members) {
			if (null != memberBasic.getMemberAuth()) {
				if (1 == memberBasic.getMemberAuth().getAuthority().getAuthorityId()) {
					java.sql.Date registTime = memberBasic.getRegistTime();
					Date date = new Date(registTime.getTime());
					Calendar instance = Calendar.getInstance();
					instance.setTime(date);
					int i = instance.get(Calendar.MONTH) + 1;
					if (i == 1) {
						jan++;
						if ("一般".equals(memberBasic.getLoginType())) {
							janNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							janGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							janFacebook++;
						}
					} else if (i == 2) {
						feb++;
						if ("一般".equals(memberBasic.getLoginType())) {
							febNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							febGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							febFacebook++;
						}
					} else if (i == 3) {
						mar++;
						if ("一般".equals(memberBasic.getLoginType())) {
							marNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							marGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							marFacebook++;
						}
					} else if (i == 4) {
						apr++;
						if ("一般".equals(memberBasic.getLoginType())) {
							aprNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							aprGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							aprFacebook++;
						}
					} else if (i == 5) {
						may++;
						if ("一般".equals(memberBasic.getLoginType())) {
							mayNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							mayGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							mayFacebook++;
						}
					} else if (i == 6) {
						jun++;
						if ("一般".equals(memberBasic.getLoginType())) {
							junNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							junGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							junFacebook++;
						}
					} else if (i == 7) {
						jul++;
						if ("一般".equals(memberBasic.getLoginType())) {
							julNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							julGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							julFacebook++;
						}
					} else if (i == 8) {
						aug++;
						if ("一般".equals(memberBasic.getLoginType())) {
							augNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							augGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							augFacebook++;
						}
					} else if (i == 9) {
						sep++;
						if ("一般".equals(memberBasic.getLoginType())) {
							sepNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							sepGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							sepFacebook++;
						}
					} else if (i == 10) {
						oct++;
						if ("一般".equals(memberBasic.getLoginType())) {
							octNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							octGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							octFacebook++;
						}
					} else if (i == 11) {
						nov++;
						if ("一般".equals(memberBasic.getLoginType())) {
							novNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							novGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							novFacebook++;
						}
					} else {
						dec++;
						if ("一般".equals(memberBasic.getLoginType())) {
							decNormal++;
						}
						if ("google".equals(memberBasic.getLoginType())) {
							decGoogle++;
						}
						if ("facebook".equals(memberBasic.getLoginType())) {
							decFacebook++;
						}
					}
				}
			}
		}
		ArrayList<Integer> monthsMember = new ArrayList<Integer>();
		monthsMember.add(jan);
		monthsMember.add(feb);
		monthsMember.add(mar);
		monthsMember.add(apr);
		monthsMember.add(may);
		monthsMember.add(jun);
		monthsMember.add(jul);
		monthsMember.add(aug);
		monthsMember.add(sep);
		monthsMember.add(oct);
		monthsMember.add(nov);
		monthsMember.add(dec);
		ArrayList<Integer> monthsMemberNormal = new ArrayList<Integer>();
		monthsMemberNormal.add(janNormal);
		monthsMemberNormal.add(febNormal);
		monthsMemberNormal.add(marNormal);
		monthsMemberNormal.add(aprNormal);
		monthsMemberNormal.add(mayNormal);
		monthsMemberNormal.add(junNormal);
		monthsMemberNormal.add(julNormal);
		monthsMemberNormal.add(augNormal);
		monthsMemberNormal.add(sepNormal);
		monthsMemberNormal.add(octNormal);
		monthsMemberNormal.add(novNormal);
		monthsMemberNormal.add(decNormal);
		ArrayList<Integer> monthsMemberGoogle = new ArrayList<Integer>();
		monthsMemberGoogle.add(janGoogle);
		monthsMemberGoogle.add(febGoogle);
		monthsMemberGoogle.add(marGoogle);
		monthsMemberGoogle.add(aprGoogle);
		monthsMemberGoogle.add(mayGoogle);
		monthsMemberGoogle.add(junGoogle);
		monthsMemberGoogle.add(julGoogle);
		monthsMemberGoogle.add(augGoogle);
		monthsMemberGoogle.add(sepGoogle);
		monthsMemberGoogle.add(octGoogle);
		monthsMemberGoogle.add(novGoogle);
		monthsMemberGoogle.add(decGoogle);
		ArrayList<Integer> monthsMemberFacebook = new ArrayList<Integer>();
		monthsMemberFacebook.add(janFacebook);
		monthsMemberFacebook.add(febFacebook);
		monthsMemberFacebook.add(marFacebook);
		monthsMemberFacebook.add(aprFacebook);
		monthsMemberFacebook.add(mayFacebook);
		monthsMemberFacebook.add(junFacebook);
		monthsMemberFacebook.add(julFacebook);
		monthsMemberFacebook.add(augFacebook);
		monthsMemberFacebook.add(sepFacebook);
		monthsMemberFacebook.add(octFacebook);
		monthsMemberFacebook.add(novFacebook);
		monthsMemberFacebook.add(decFacebook);

		map.put("monthsMember", monthsMember);
		map.put("monthsMemberNormal", monthsMemberNormal);
		map.put("monthsMemberGoogle", monthsMemberGoogle);
		map.put("monthsMemberFacebook", monthsMemberFacebook);
		return map;
	}

	// get favor of members
	@PostMapping("/getEveryFavorOfMember")
	public @ResponseBody List<Integer> getEveryFavorOfMember() {
		ArrayList<Integer> arrayList2 = new ArrayList<Integer>();
		for (int i = 1; i < 9; i++) {
			ArrayList<MemberBasic> arrayList = new ArrayList<MemberBasic>();
			List<MemberBasic> selectFavor = memberBasicServiceImpl.selectFavor(i);
			for (MemberBasic memberBasic : selectFavor) {
				if (memberBasic.getMemberAuth().getAuthority().getAuthorityId() == 1) {
					arrayList.add(memberBasic);
				}
			}
			int size = arrayList.size();
			arrayList2.add(size);
		}
		return arrayList2;
	}

	// get age of members
	@PostMapping("/getEveryAgeOfMember")
	public @ResponseBody Map<String, Object> getEveryAgeOfMember() {
		int age20m = 0;
		int age20f = 0;
		int age20o = 0;
		int age30m = 0;
		int age30f = 0;
		int age30o = 0;
		int age40m = 0;
		int age40f = 0;
		int age40o = 0;
		int age50m = 0;
		int age50f = 0;
		int age50o = 0;
		int age60m = 0;
		int age60f = 0;
		int age60o = 0;
		int age70m = 0;
		int age70f = 0;
		int age70o = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<Integer> agem = new ArrayList<Integer>();
		ArrayList<Integer> agef = new ArrayList<Integer>();
		ArrayList<Integer> ageo = new ArrayList<Integer>();
		List<MemberAdvanced> selectAll = memberAdvancedServiceImpl.selectAll();
		for (MemberAdvanced memberAdvanced : selectAll) {
			java.sql.Date birthday = memberAdvanced.getBirthday();
			if (null != birthday) {

				Date bir = new Date(birthday.getTime());
				if (0 < DateUtils.getAgeByBirth(bir) && DateUtils.getAgeByBirth(bir) < 20) {
					MemberBasic m = memberBasicServiceImpl.select(memberAdvanced.getMemberId());
					if ("Male".equals(m.getGender())) {
						age20m++;
					} else if ("Female".equals(m.getGender())) {
						age20f++;
					} else {
						age20o++;
					}
				} else if (DateUtils.getAgeByBirth(bir) < 30) {
					MemberBasic m = memberBasicServiceImpl.select(memberAdvanced.getMemberId());
					if ("Male".equals(m.getGender())) {
						age30m++;
					} else if ("Female".equals(m.getGender())) {
						age30f++;
					} else {
						age30o++;
					}
				} else if (DateUtils.getAgeByBirth(bir) < 40) {
					MemberBasic m = memberBasicServiceImpl.select(memberAdvanced.getMemberId());
					if ("Male".equals(m.getGender())) {
						age40m++;
					} else if ("Female".equals(m.getGender())) {
						age40f++;
					} else {
						age40o++;
					}
				} else if (DateUtils.getAgeByBirth(bir) < 50) {
					MemberBasic m = memberBasicServiceImpl.select(memberAdvanced.getMemberId());
					if ("Male".equals(m.getGender())) {
						age50m++;
					} else if ("Female".equals(m.getGender())) {
						age50f++;
					} else {
						age50o++;
					}
				} else if (DateUtils.getAgeByBirth(bir) < 60) {
					MemberBasic m = memberBasicServiceImpl.select(memberAdvanced.getMemberId());
					if ("Male".equals(m.getGender())) {
						age60m++;
					} else if ("Female".equals(m.getGender())) {
						age60f++;
					} else {
						age60o++;
					}
				} else {
					MemberBasic m = memberBasicServiceImpl.select(memberAdvanced.getMemberId());
					if ("Male".equals(m.getGender())) {
						age70m++;
					} else if ("Female".equals(m.getGender())) {
						age70f++;
					} else {
						age70o++;
					}
				}
			}
		}
		agem.add(age20m);
		agem.add(age30m);
		agem.add(age40m);
		agem.add(age50m);
		agem.add(age60m);
		agem.add(age70m);
		map.put("agem", agem);
		agef.add(age20f);
		agef.add(age30f);
		agef.add(age40f);
		agef.add(age50f);
		agef.add(age60f);
		agef.add(age70f);
		map.put("agef", agef);
		ageo.add(age20o);
		ageo.add(age30o);
		ageo.add(age40o);
		ageo.add(age50o);
		ageo.add(age60o);
		ageo.add(age70o);
		map.put("ageo", ageo);

		return map;
	}

	// 統計登入方式(一般.FB.Google)
	// public
}
