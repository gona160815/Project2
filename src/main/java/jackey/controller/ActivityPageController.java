package main.java.jackey.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import main.java.gona.service.RentalBikeService;
import main.java.gona.service.StoreService;
import main.java.hugo.model.MemberBasic;
import main.java.jackey.model.ActName;
import main.java.jackey.model.EventActivity;
import main.java.jackey.model.service.ActNameService;
import main.java.jackey.model.service.EventActivityService;
import main.java.jackey.model.service.EventService;
import main.java.jackey.util.GlobalService;
import main.java.sixsix.dao.RegistDAOimpt;
import main.java.xxx30514.model.BikeService;
import main.java.xxx30514.model.RestServie;

@Controller
@SessionAttributes({ "loginOK" })
public class ActivityPageController {

	@Autowired
	ActNameService actNameService;
	@Autowired
	EventActivityService activityService;
	@Autowired
	EventService eventService;
	@Autowired
	StoreService storeService;
	@Autowired
	BikeService bikeService;
	@Autowired
	RentalBikeService rentalService;
	@Autowired
	RestServie restService;
	@Autowired
	RegistDAOimpt homestayDao;

//	規劃行程表頁面
	@GetMapping(value = "eventActivity")
	public String activityEntryPage() {

		return "event/event_activity";
	}

//  個人行程表頁面
	@GetMapping(value = "myActivity")
	public String myActivityPage(@ModelAttribute(name = "loginOK") MemberBasic member, Model m) {
		List<ActName> actNameList = actNameService.selectByMember(member.getMemberId());
		m.addAttribute("actName", actNameList);
		return "event/my_activity";
	}

//	修改行程頁面
	@GetMapping(value = "myActivity/{actNameId}.{memberId}.{actName}")
	public String preUpdatePage(@PathVariable Integer actNameId, @PathVariable Integer memberId,
			@PathVariable String actName, @ModelAttribute(name = "loginOK") MemberBasic member, Model m) {
		List<EventActivity> activityList = activityService.selectByActName(actName, memberId);
		ActName activity = actNameService.selectActNameById(actNameId);
		Integer totalPrice = 0;
		for (EventActivity eventActivity : activityList) {
			totalPrice += eventActivity.getPrice();
		}
		m.addAttribute("activity", activity);
		m.addAttribute("name", actName);
		m.addAttribute("totalPrice", totalPrice);
		m.addAttribute("activityList", activityList);

		return "event/event_activity_update";
	}

// 	MGR行程管理頁面
	@GetMapping(value = "activityMgr")
	public String activityMgrPage(@RequestParam(name = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(name = "query", required = false, defaultValue = "") String query, Model m) {
		actNameService.setPageNo(pageNo);
		actNameService.setQuery(query);
		actNameService.setTotalPages(actNameService.getTotalPages());
		ArrayList<Integer> pageNumList = actNameService.getPageNumbers();
		List<ActName> actNameList = actNameService.getPage();
		m.addAttribute("queryList", actNameList);
		m.addAttribute("pageNo", String.valueOf(pageNo));
		m.addAttribute("totalPages", actNameService.getTotalPages());
		m.addAttribute("query", query);
		m.addAttribute("pages", pageNumList);
		m.addAttribute("mgrId", GlobalService.MGRID);
		return "event/eventMgr_activity";
	}

// 	ACTIVITY MGR PAGE RESTFUL
	@PostMapping(value = "activityMgr.json", produces = "application/json")
	public @ResponseBody Map<String, Object> getEventPage(
			@RequestParam(name = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(name = "query", required = false, defaultValue = "") String query) {
		Map<String, Object> map = new HashMap<>();
		actNameService.setPageNo(pageNo);
		actNameService.setQuery(query);
		actNameService.setTotalPages(actNameService.getTotalPages());
		ArrayList<Integer> pageNumList = actNameService.getPageNumbers();
		List<ActName> list = actNameService.getPage();
		map.put("query", query);
		map.put("list", list);
		map.put("pageNo", pageNo);
		map.put("totalPages", actNameService.getTotalPages());
		map.put("pages", pageNumList);
		return map;

	}

// 	導向綠界結帳頁面
	@PostMapping(value = "activityOrder")
	public String activityOrder(String actNameId, String orderTime, String price, String name, Model m) {
		String orderId = "ACT" + actNameId;
		String form = actNameService.payOrder(orderId, orderTime, price, name);
		ActName actName = actNameService.selectActNameById(Integer.parseInt(actNameId));
		actName.setStatus(1);
		actNameService.update(actName);
		m.addAttribute("form", form);

		return "rental/orderSuccess";
	}

// 	平台發布之行程資訊頁
	@GetMapping(value = "activity/{actNameId}")
	public String activityDetail(@PathVariable Integer actNameId, Model m) {
		ActName actName = actNameService.selectActNameById(actNameId);
		List<EventActivity> activityList = activityService.selectByActName(actName.getName(), GlobalService.MGRID);

		m.addAttribute("memberId", GlobalService.MGRID);
		m.addAttribute("actName", actName);
		m.addAttribute("activityList", activityList);

		return "event/eventUI_activityDetail";
	}

//	使用者之行程資訊頁
	@GetMapping(value = "myactivity/{actNameId}")
	public String myactivityDetail(@PathVariable Integer actNameId,
			@ModelAttribute(name = "loginOK") MemberBasic member, Model m) {
		ActName actName = actNameService.selectActNameById(actNameId);
		List<EventActivity> activityList = activityService.selectByActName(actName.getName(), member.getMemberId());

		m.addAttribute("memberId", member.getMemberId());
		m.addAttribute("actName", actName);
		m.addAttribute("activityList", activityList);

		return "event/eventUI_myactivityDetail";
	}

}
