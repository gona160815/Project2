package main.java.jackey.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import main.java.gona.model.RbType;
import main.java.gona.model.RentalBike;
import main.java.gona.model.SimpleBike;
import main.java.gona.model.Store;
import main.java.gona.service.RentalBikeService;
import main.java.gona.service.StoreService;
import main.java.hugo.model.MyFavorite;
import main.java.hugo.service.MyFavoriteServiceImpl;
import main.java.jackey.model.ActName;
import main.java.jackey.model.Event;
import main.java.jackey.model.EventActivity;
import main.java.jackey.model.service.ActNameService;
import main.java.jackey.model.service.EventActivityService;
import main.java.jackey.model.service.EventService;
import main.java.sixsix.dao.RegistDAOimpt;
import main.java.sixsix.model.Homestay;
import main.java.xxx30514.model.Bike;
import main.java.xxx30514.model.BikeService;
import main.java.xxx30514.model.RestArea;
import main.java.xxx30514.model.RestServie;

@RestController
public class ActivityController {

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
	@Autowired
	MyFavoriteServiceImpl favoriteService;

//  依TYPE撈出各類型資訊
	@PostMapping(value = "/getInfo")
	public Map<String, Object> getInfo(@RequestParam Integer typeId, @RequestParam String query) {
		Map<String, Object> map = new HashMap<>();
		if (typeId == 1) {
			try {
				List<Homestay> homestay = homestayDao.selectSomething("1", query, 1);

				map.put("homestay", homestay);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if (typeId == 2) {
			List<Store> store = storeService.selectByArea(Integer.parseInt(query), "");
			map.put("store", store);
		}
		if (typeId == 3) {
			eventService.setQuery(query);
			List<Event> eventList = eventService.selectAll();
			map.put("event", eventList);
		}

		if (typeId == 4) {
			bikeService.setPageNo(1);
			bikeService.setRecordsPerPage(20);
			List<Bike> bikeRoad = bikeService.selectRoad(query, "");
			map.put("bike", bikeRoad);
		}
		if (typeId == 5) {
			restService.setPageNo(1);
			restService.setRecordsPerPage(20);
			List<RestArea> restArea = restService.selectRestArea(query, "");
			map.put("restArea", restArea);
		}
		return map;
	}

//  取得店家有的單車
	@PostMapping(value = "/getBikeByStore")
	public Map<String, Object> getBikeByStore(@RequestParam String storeId) {
		Map<String, Object> map = new HashMap<>();
		List<RentalBike> bike = storeService.getBikeByStore(storeId);

		map.put("bike", bike);
		return map;
	}

//  取得單車資訊
	@PostMapping(value = "/getBikeInfo")
	public Map<String, Object> getBikeInfo(@RequestParam String simRbId) {
		Map<String, Object> map = new HashMap<>();
		System.out.println("simRbId" + simRbId);
		SimpleBike simBike = rentalService.selectSimBike(simRbId);
		List<Store> store = rentalService.getStoreByBike(simRbId);
		RbType rbType = simBike.getRbType();
		map.put("store", store);
		map.put("bike", rbType);
		return map;
	}

//  取得我的最愛之類型
	@PostMapping(value = "/getFavInfo")
	public Map<String, Object> getFavInfo(@RequestParam Integer memberId) {
		Map<String, Object> map = new HashMap<>();
		List<MyFavorite> favoriteList = favoriteService.selectByAddTime(memberId);
		List<Object> list = new ArrayList<Object>();
		for (MyFavorite myFavorite : favoriteList) {
			Integer typeId = myFavorite.getTypeId();
			if (typeId == 1) {
				Homestay homestay = homestayDao.selectOneData(myFavorite.getInfoId());
				list.add(homestay);
			}
			if (typeId == 2) {
				SimpleBike simBike = rentalService.selectSimBike(myFavorite.getInfoId());
				RbType rbType = simBike.getRbType();
				list.add(rbType);
			}
			if (typeId == 3) {
				Event event = eventService.select(Integer.parseInt(myFavorite.getInfoId()));
				list.add(event);
			}
			if (typeId == 4) {
				Bike bike = bikeService.select(Integer.parseInt(myFavorite.getInfoId()));
				list.add(bike);
			}
			if (typeId == 5) {
				RestArea restArea = restService.select(Integer.parseInt(myFavorite.getInfoId()));
				list.add(restArea);
			}
		}
		map.put("list", list);
		map.put("favorite", favoriteList);
		return map;
	}

// 查詢選擇的我的最愛各項資訊
	@PostMapping(value = "/getSelectFav")
	public Map<String, Object> getSelectFav(Integer memberId, Integer typeId, String infoId) {
		Map<String, Object> map = new HashMap<>();
		MyFavorite favorite = favoriteService.selectByInfoId(memberId, typeId, infoId);
		map.put("favorite", favorite);
		return map;
	}

//  新增行程訂單
	@PostMapping(value = "/addActivity")
	public Map<String, Object> addActivity(@RequestBody String data) {
		Map<String, Object> map = new HashMap<>();
		JsonParser jsonParser = new JsonParser();
		ActName actName;
		EventActivity eventActivity;
		System.out.println(data);
		if (data != null || !"".equals(data)) {
			JsonArray jsonArray = (JsonArray) jsonParser.parse(data);
			JsonObject actNameObj = (JsonObject) jsonArray.get(0);
			actName = new ActName();
			actName.setName(actNameObj.get("name").getAsString());
			actName.setMemberId(actNameObj.get("memberId").getAsInt());
			actName.setOrderTime(actNameObj.get("orderTime").getAsString());
			actName.setPrice(actNameObj.get("price").getAsInt());
			actNameService.insert(actName);
			map.put("actName", actName);
			List<EventActivity> existActivity = activityService.selectByActName(actNameObj.get("name").getAsString(),
					actNameObj.get("memberId").getAsInt());
			for (EventActivity activity : existActivity) {
				activityService.delete(activity.getActivityId());
			}
			for (int i = 1; i < jsonArray.size(); i++) {
				JsonObject eventActObj = (JsonObject) jsonArray.get(i);
				eventActivity = new EventActivity();
				eventActivity.setTypeId(eventActObj.get("typeId").getAsInt());
				eventActivity.setInfoId(eventActObj.get("infoId").getAsString());
				eventActivity.setActDate(eventActObj.get("actDate").getAsString());
				eventActivity.setName(eventActObj.get("name").getAsString());
				eventActivity.setPrice(eventActObj.get("price").getAsInt());
				eventActivity.setMemberId(eventActObj.get("memberId").getAsInt());
				System.out.println(eventActivity.toString());
				activityService.insert(eventActivity);
			}

		}
		return map;
	}

//	刪除更新頁裡的單項行程
	@PostMapping(value = "deleteActivity")
	public Boolean deleteActivity(Integer activityId) {
		Boolean result = activityService.delete(activityId);
		return result;
	}

//  更新行程訂單
	@PostMapping(value = "/updateActivity")
	public Map<String, Object> updateActivity(@RequestBody String data) {
		Map<String, Object> map = new HashMap<>();
		JsonParser jsonParser = new JsonParser();
		ActName actName;
		EventActivity eventActivity;
		System.out.println(data);
		if (data != null || !"".equals(data)) {
			JsonArray jsonArray = (JsonArray) jsonParser.parse(data);
			JsonObject actNameObj = (JsonObject) jsonArray.get(0);
			String name = actNameObj.get("name").getAsString();
			Integer memberId = actNameObj.get("memberId").getAsInt();
			Integer actNameId = actNameObj.get("actNameId").getAsInt();
			actName = actNameService.selectActNameById(actNameId);
			if (actName == null) {
				actName = new ActName();
				actName.setName(name);
				actName.setMemberId(memberId);
				actName.setOrderTime(actNameObj.get("orderTime").getAsString());
				actName.setPrice(actNameObj.get("price").getAsInt());
				actName.setStatus(0);
				actNameService.insert(actName);
			} else {
				actName.setName(name);
				actName.setOrderTime(actNameObj.get("orderTime").getAsString());
				actName.setPrice(actNameObj.get("price").getAsInt());
				actName.setStatus(0);
				actNameService.update(actName);
			}

			map.put("actName", actName);
			for (int i = 1; i < jsonArray.size(); i++) {
				JsonObject eventActObj = (JsonObject) jsonArray.get(i);
				Integer activityId = eventActObj.get("activityId").getAsInt();
				eventActivity = activityService.selectActivity(activityId);
				if (eventActivity != null) {
					eventActivity.setTypeId(eventActObj.get("typeId").getAsInt());
					eventActivity.setInfoId(eventActObj.get("infoId").getAsString());
					eventActivity.setActDate(eventActObj.get("actDate").getAsString());
					eventActivity.setName(eventActObj.get("name").getAsString());
					eventActivity.setPrice(eventActObj.get("price").getAsInt());
					eventActivity.setMemberId(eventActObj.get("memberId").getAsInt());
					activityService.update(eventActivity);
				} else {
					eventActivity = new EventActivity();
					eventActivity.setTypeId(eventActObj.get("typeId").getAsInt());
					eventActivity.setInfoId(eventActObj.get("infoId").getAsString());
					eventActivity.setActDate(eventActObj.get("actDate").getAsString());
					eventActivity.setName(eventActObj.get("name").getAsString());
					eventActivity.setPrice(eventActObj.get("price").getAsInt());
					eventActivity.setMemberId(eventActObj.get("memberId").getAsInt());
					activityService.insert(eventActivity);
				}
			}
		}
		return map;
	}

//  刪除行程訂單 
	@PostMapping(value = "removeActivity")
	public Map<String, Object> removeActivity(Integer actNameId, Integer memberId) {
		Map<String, Object> map = new HashMap<>();
		ActName actName = actNameService.selectActNameById(actNameId);
		Boolean result = actNameService.delete(actNameId);
		List<EventActivity> activityList = activityService.selectByActName(actName.getName(), memberId);
		for (EventActivity eventActivity : activityList) {
			activityService.delete(eventActivity.getActivityId());
		}
		map.put("result", result);
		return map;
	}

//  CHECK 會員是否有重複名稱的行程
	@PostMapping(value = "checkActivity")
	public Map<String, Object> checkActName(Integer memberId, String actName) {
		Map<String, Object> map = new HashMap<>();
		List<EventActivity> result = activityService.selectByActName(actName, memberId);
		if (result != null && !result.isEmpty()) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

//  CHECK 是否結帳
	@PostMapping(value = "checkPayment")
	public Map<String, Object> checkPayment(@RequestBody String data) {
		Map<String, Object> map = new HashMap<>();
		List<Integer> status = new ArrayList<Integer>();
		ActName actName;
		JsonParser jsonParser = new JsonParser();
		if (data != null || !"".equals(data)) {
			JsonArray jsonArray = (JsonArray) jsonParser.parse(data);
			for (int i = 0; i < jsonArray.size(); i++) {
				JsonObject jsonObject = (JsonObject) jsonArray.get(i);
				actName = actNameService.selectActNameById(jsonObject.get("actNameId").getAsInt());
				status.add(actName.getStatus());
			}
		}
		map.put("status", status);
		return map;
	}
//  取得會員的行程訂單
	@PostMapping(value = "getActivity")
	public Map<String, Object> getActivity(@RequestParam String actName, @RequestParam Integer memberId) {
		Map<String, Object> map = new HashMap<>();
		List<EventActivity> activityList = activityService.selectByActName(actName, memberId);
		List<Object> list = new ArrayList<Object>();
		for (EventActivity eventActivity : activityList) {
			Integer typeId = eventActivity.getTypeId();
			if (typeId == 1) {
				Homestay homestay = homestayDao.selectOneData(eventActivity.getInfoId());
				list.add(homestay);
			}
			if (typeId == 2) {
				SimpleBike simBike = rentalService.selectSimBike(eventActivity.getInfoId());
				list.add(simBike);
			}
			if (typeId == 3) {
				Event event = eventService.select(Integer.parseInt(eventActivity.getInfoId()));
				list.add(event);
			}
			if (typeId == 4) {
				Bike bike = bikeService.select(Integer.parseInt(eventActivity.getInfoId()));
				list.add(bike);
			}
			if (typeId == 5) {
				RestArea restArea = restService.select(Integer.parseInt(eventActivity.getInfoId()));
				list.add(restArea);
			}

		}
		map.put("list", list);
		map.put("activity", activityList);
		return map;
	}

}
