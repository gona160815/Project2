package main.java.jackey.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import main.java.jackey.model.service.ActNameService;
import main.java.jackey.model.service.EventActivityService;
import main.java.jackey.model.service.EventDetailService;
import main.java.jackey.model.service.EventService;

@RestController
public class EventMgrAnalyzeController {
	@Autowired
	EventDetailService detailService;
	@Autowired
	EventActivityService activityService;
	@Autowired
	ActNameService actNameService;
	@Autowired
	EventService eventService;

	@PostMapping(value = "mgrSevenData", produces = "application/json")
	public Map<String, Object> getHomeData() {
		Map<String, Object> recent7DaysDetails = detailService.getRecent7DaysDetails();
		return recent7DaysDetails;
	}

	@PostMapping(value = "mgr30DaysData", produces = "application/json")
	public Map<String, Object> get30DaysData() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("last30days", detailService.getRecent30DaysDetails());
		map.put("monthly", detailService.getMonthlyDetails());
		return map;
	}

	@PostMapping(value = "mgrMonthlyData", produces = "application/json")
	public Map<String, Object> getMonthlyData() {
		Map<String, Object> monthlyDetails = detailService.getMonthlyDetails();
		return monthlyDetails;
	}

	@PostMapping(value = "mgrTodayData", produces = "application/json")
	public Map<String, Object> getTodayData() {
		Map<String, Object> todayData = detailService.getTodayData();
		return todayData;
	}

	@GetMapping(value = "eventAllData")
	public Map<String, Object> getAllData() {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("TodayData", detailService.getTodayData());
		map.put("Recent7DaysData", detailService.getRecent7DaysDetails());
		map.put("Last30daysData", detailService.getRecent30DaysDetails());
		map.put("MonthlyData", detailService.getMonthlyDetails());
		return map;
	}

	@PostMapping(value = "eventData/{eventId}", produces = "application/json")
	public Map<String, Object> getDataByEvent(@PathVariable Integer eventId) {
		Map<String, Object> map = new HashMap<>();
		Map<String, Object> todayDataByEvent = detailService.getTodayDataByEvent(eventId);
		Map<String, Object> recent7DaysByEvent = detailService.getRecent7DaysByEvent(eventId);
		Map<String, Object> recent30DaysByEvent = detailService.getRecent30DaysByEvent(eventId);
		Map<String, Object> monthlyDetailsByEvent = detailService.getMonthlyDetailsByEvent(eventId);
		map.put("monthly", monthlyDetailsByEvent);
		map.put("todayData", todayDataByEvent);
		map.put("recent7Days", recent7DaysByEvent);
		map.put("last30days", recent30DaysByEvent);

		return map;
	}

	@PostMapping(value = "eventLocationData")
	public Map<String, Object> getEventLocationData() {
		return eventService.countEventByLocation();
	}

	@PostMapping(value = "eventCatData")
	public List<Long> getEventCatData() {
		return eventService.countEventByCategory();
	}

	@PostMapping(value = "activityData")
	public List<Long> getActivityData() {
		List<Long> list = activityService.countType();
		return list;
	}

	@PostMapping(value = "actNameData")
	public Map<String, Object> getactNameData() {
		Map<String, Object> map = actNameService.countRevenue();
		return map;
	}

}
