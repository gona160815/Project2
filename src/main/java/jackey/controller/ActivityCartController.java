package main.java.jackey.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import main.java.gona.service.RentalBikeService;
import main.java.gona.service.StoreService;
import main.java.jackey.model.ActName;
import main.java.jackey.model.EventActivity;
import main.java.jackey.model.service.ActNameService;
import main.java.jackey.model.service.EventActivityService;
import main.java.jackey.model.service.EventService;
import main.java.sixsix.dao.RegistDAOimpt;
import main.java.xxx30514.model.BikeService;
import main.java.xxx30514.model.RestServie;

@RestController
public class ActivityCartController {
	
	@Autowired
	EventActivityService activityService;
	@Autowired
	ActNameService actNameService;
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
	
	
	//讀取此會員有的行程
	@PostMapping(value = "getMyActName")
	public Map<String, Object> getMyActName(Integer memberId){
		Map<String, Object> map = new HashMap<String, Object>();
		List<ActName> actNameList = actNameService.selectByMember(memberId);
		map.put("actName",actNameList);
		return map;
	}
	
	// 建一個空的行程訂單
	@PostMapping(value = "addMyActName")
	public Map<String,Object> addMyActName(Integer memberId,String actName){
		Map<String,Object> map = new HashMap<String, Object>();
		ActName act = new ActName();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		act.setName(actName);
		act.setMemberId(memberId);
		act.setOrderTime(sdf.format(new Date()));
		act.setPrice(0);
		ActName newAct = actNameService.insert(act);
		map.put("actName",newAct);
		return map;
	}
	
	// 建立行程
	@PostMapping(value = "addActivityByCart")
	public Map<String,Object> addActivity(EventActivity eventActivity){
		EventActivity activity = activityService.insert(eventActivity);
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("activity",activity);
		return map;
	}
	
	
	
}
