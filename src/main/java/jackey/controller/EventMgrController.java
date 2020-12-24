package main.java.jackey.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.java.jackey.model.Event;
import main.java.jackey.model.EventCat;
import main.java.jackey.model.service.EventService;

@Controller
public class EventMgrController {

	@Autowired
	EventService service;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@GetMapping(value = "/eventDashboard")
	public String mgrDashboard() {
		return "event/eventDashboard";
	}

	@GetMapping(path = "/eventMgr")
	public String mgrEntryPage(@RequestParam(name = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(name = "query", required = false, defaultValue = "") String query,
			@RequestParam(name = "categoryId", required = false, defaultValue = "") String categoryId, Model m) {

		service.setPageNo(pageNo);
		service.setCategoryId(categoryId);
		m.addAttribute("categoryId", categoryId);
		service.setQuery(query);
		service.setTotalPages(service.getTotalPages());
		ArrayList<Integer> pageNumList = service.getPageNumbers();
		List<Event> eList = service.getPage();
		m.addAttribute("queryList", eList);
		m.addAttribute("pageNo", String.valueOf(pageNo));
		m.addAttribute("totalPages", service.getTotalPages());
		m.addAttribute("query", query);
		m.addAttribute("pages", pageNumList);
		return "event/eventMgr";
	}

	@PostMapping(value = "/eventmgrPage.json", produces = "application/json;charset=UTF-8")
	public @ResponseBody Map<String, Object> getPageEvent(
			@RequestParam(name = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(name = "query", required = false, defaultValue = "") String query,
			@RequestParam(name = "categoryId", required = false, defaultValue = "") String categoryId) {
		Map<String, Object> map = new HashMap<>();
		service.setPageNo(pageNo);
		service.setCategoryId(categoryId);
		service.setQuery(query);
		service.setTotalPages(service.getTotalPages());
		ArrayList<Integer> pageNumList = service.getPageNumbers();
		List<Event> list = service.getPage();
		map.put("query", query);
		map.put("categoryId", categoryId);
		map.put("list", list);
		map.put("pageNo", pageNo);
		map.put("totalPages", service.getTotalPages());
		map.put("pages", pageNumList);

		return map;
	}

	@RequestMapping(path = "/eventInsertEntryPage", method = RequestMethod.GET)
	public String eventInsertEntryPage() {
		return "event/eventsInsert";
	}

	@PostMapping(value = "/saveEvent")
	public @ResponseBody Event saveEvent(Event event,EventCat eventCat) {
		event.setEventCat(eventCat);
		Event result = service.insertData(event);
		if (result != null) {
			return result;
		}
		return null;
	}

	@PostMapping(path = "/eventUpdateEntry.controller")
	public String eventPreUpdate(@RequestParam(name = "eventID") Integer eventId, Model m) {
		Event event = service.select(eventId);
		m.addAttribute("event", event);
		return "event/eventsUpdate";
	}

	@PostMapping(path = "/eventUpdate.controller", produces = "application/json")
	public @ResponseBody Event eventUpdate(Event event, EventCat eventCat) {
		try {
			event.setEventCat(eventCat);
			Event result = service.update(event);
			System.out.println("Update Success");

			return result;
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Update Error");
			return null;
		}

	}

	@PostMapping(path = "/eventDelete.controller",produces = "application/json")
	public @ResponseBody Boolean eventDelete(@RequestParam Integer eventId) {
		System.out.println("eid"+eventId);
		Boolean result = service.delete(eventId);
		return result;
	}

}
