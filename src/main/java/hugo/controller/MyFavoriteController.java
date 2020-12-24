package main.java.hugo.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import main.java.gona.model.RbType;
import main.java.gona.model.SimpleBike;
import main.java.gona.service.RentalBikeService;
import main.java.gona.service.StoreService;
import main.java.hugo.model.MyFavorite;
import main.java.hugo.service.MyFavoriteServiceImpl;
import main.java.jackey.model.Event;
import main.java.jackey.model.service.EventService;
import main.java.sixsix.dao.RegistDAOimpt;
import main.java.sixsix.model.Homestay;
import main.java.xxx30514.model.Bike;
import main.java.xxx30514.model.BikeService;
import main.java.xxx30514.model.RestArea;
import main.java.xxx30514.model.RestServie;

@Controller
public class MyFavoriteController {

	@Autowired
	MyFavoriteServiceImpl myFavoriteServiceImpl;
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

	// 單筆判斷是否加入過我的最愛
	@PostMapping(value = "/checkMyFavorite", produces = "application/json")
	public @ResponseBody Map<String, Object> checkLike(@RequestParam Integer memberId, @RequestParam Integer typeId,
			@RequestParam String infoId) {
		Map<String, Object> map = new HashMap<>();
		Boolean checkFavorite = myFavoriteServiceImpl.checkFavorite(memberId, typeId, infoId);
		if (checkFavorite) {
			map.put("favorite", true);
		} else {
			map.put("favorite", false);
		}
		return map;
	}

	// 多筆判斷是否加入過我的最愛
	@PostMapping(value = "/checkMyFavoriteList", produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, Object> checkLike(@RequestBody String data) {
		Map<String, Object> map = new HashMap<>();
		List<Boolean> result = new ArrayList<Boolean>();
		JsonParser jsonParser = new JsonParser();
		try {
			if (data != null || !"".equals(data)) {

				JsonArray jsonArray = (JsonArray) jsonParser.parse(data);
				for (int i = 0; i < jsonArray.size(); i++) {
					JsonObject jsonObject = (JsonObject) jsonArray.get(i);
					String infoId = jsonObject.get("infoId").getAsString();
					Integer memberId = jsonObject.get("memberId").getAsInt();
					Integer typeId = jsonObject.get("typeId").getAsInt();
					Boolean checkFavorite = myFavoriteServiceImpl.checkFavorite(memberId, typeId, infoId);
					result.add(checkFavorite);
				}
			}
			map.put("result", result);
			return map;
		} catch (Exception e) {
			map.put("error", "member Id null");
			return null;
		}

	}

	// 加入
	@PostMapping(value = "/addMyFavorite")
	public @ResponseBody Map<String, Object> addMyFavorite(MyFavorite myFavorite) throws ParseException {
		Map<String, Object> map = new HashMap<>();
		Date date = new Date();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		String dateString = sf.format(date);
		// add日期
		Date date2 = sf.parse(dateString);
		java.sql.Date registTime = new java.sql.Date(date2.getTime());
		myFavorite.setAddTime(registTime);
		Boolean result = myFavoriteServiceImpl.insert(myFavorite);
		if (result) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}
		map.put("result", "已加入我的最愛");

		return map;
	}

	// 刪除
	@PostMapping(value = "/deleteMyFavorite")
	public @ResponseBody Map<String, Object> deleteMyFavorite(@RequestParam Integer memberId,
			@RequestParam Integer typeId, @RequestParam String infoId) {
		Map<String, Object> map = new HashMap<>();
		Boolean result = myFavoriteServiceImpl.delete(memberId, typeId, infoId);
		if (result) {
			map.put("success", true);
			map.put("result", "已移除我的最愛");

		} else {
			map.put("success", false);
		}
		return map;
	}

	// 依時間列出(進到遠)
	@PostMapping(value = "/selectByAddTime")
	public @ResponseBody Map<String, Object> selectByAddTime(@RequestParam Integer memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<MyFavorite> selectByAddTime = myFavoriteServiceImpl.selectByAddTime(memberId);
		List<String> types = new ArrayList<String>();
		List<Object> list = new ArrayList<Object>();
		System.out.println(selectByAddTime.size());
		map.put("favorites", selectByAddTime);
		for (MyFavorite myFavorite : selectByAddTime) {
			Integer typeId = myFavorite.getTypeId();
			if (typeId == 1) {
				Homestay homestay = homestayDao.selectOneData(myFavorite.getInfoId());
				list.add(homestay);
				types.add("住宿");
			}
			if (typeId == 2) {
				SimpleBike simBike = rentalService.selectSimBike(myFavorite.getInfoId());
				RbType rbType = simBike.getRbType();
				list.add(rbType);
				types.add("租車");
			}
			if (typeId == 3) {
				Event event = eventService.select(Integer.parseInt(myFavorite.getInfoId()));
				list.add(event);
				types.add("活動");
			}
			if (typeId == 4) {
				Bike bike = bikeService.select(Integer.parseInt(myFavorite.getInfoId()));
				list.add(bike);
				types.add("自行車道");
			}
			if (typeId == 5) {
				RestArea restArea = restService.select(Integer.parseInt(myFavorite.getInfoId()));
				list.add(restArea);
				types.add("補給站");
			}
		}
		map.put("list", list);
		map.put("types", types);
		return map;

	}

	// 依時間列出(進到遠)
	@PostMapping(value = "/selectByAddTimeASC")
	public @ResponseBody Map<String, Object> selectByAddTimeASC(@RequestParam Integer memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		List<MyFavorite> selectByAddTime = myFavoriteServiceImpl.selectByAddTime(memberId);
		List<Event> events = new ArrayList<Event>();
		List<String> types = new ArrayList<String>();
		System.out.println(selectByAddTime.size());
		map.put("favorites", selectByAddTime);
		for (MyFavorite myFavorite : selectByAddTime) {
			Event select = eventService.select(Integer.parseInt(myFavorite.getInfoId()));
			events.add(select);
			Integer typeId = myFavorite.getTypeId();
			if (typeId == 4) {
				types.add("車道");
			} else if (typeId == 3) {
				types.add("活動");
			} else if (typeId == 2) {
				types.add("門市");
			} else {
				types.add("住宿");
			}
		}
		map.put("types", types);
		map.put("events", events);
		return map;

	}

	// 依種類列出
	@PostMapping("/selectByType")
	public @ResponseBody List<MyFavorite> selectByType(@RequestParam Integer memberId) {
		List<MyFavorite> selectByType = myFavoriteServiceImpl.selectByType(memberId);
		return selectByType;
	}

	@PostMapping(value = "/countMyFavorite")
	public @ResponseBody Integer countFavorite(@RequestParam Integer typeId, @RequestParam String infoId) {
		Integer count = myFavoriteServiceImpl.countFavorate(typeId, infoId);
		return count;
	}

}
