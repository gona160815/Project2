package main.java.jackey.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.hugo.model.MemberBasic;
import main.java.jackey.model.Event;
import main.java.jackey.model.service.EventService;

@Controller
@SessionAttributes({ "loginOK" })
public class EventQueryController {

	@Autowired
	EventService service;

	@GetMapping("/event.query")
	public String eventQueryEntryPage(
			@RequestParam(name = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(name = "query", required = false, defaultValue = "") String query,
			@RequestParam(name = "categoryId", required = false, defaultValue = "") String categoryId, Model m) {
		service.setCategoryId(categoryId);
		service.setPageNo(pageNo);
		service.setQuery(query);
		System.out.println("-----------"+categoryId);
		service.setTotalPages(service.getTotalPages());
		List<Event> list = service.getPage();
		List<Integer> pageNumList = service.getPageNumbers();

		m.addAttribute("query", query);
		m.addAttribute("lists", list);
		m.addAttribute("pageNo", pageNo);
		m.addAttribute("totalPages", service.getTotalPages());
		m.addAttribute("pages", pageNumList);
		m.addAttribute("count", service.getRecordCounts());
		return "event/event_query";
	}

	@PostMapping(value = "/querylist")
	public ModelAndView queryList(@RequestParam(name = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(name = "query", required = false, defaultValue = "") String query,
			@RequestParam(name = "categoryId", required = false, defaultValue = "") String categoryId) {
		ModelAndView mav = new ModelAndView();
		service.setCategoryId(categoryId);
		service.setPageNo(pageNo);
		service.setQuery(query);
		service.setTotalPages(service.getTotalPages());
		List<Event> list = service.getPage();
		List<Integer> pageNumList = service.getPageNumbers();

		mav.addObject("query", query);
		mav.addObject("lists", list);
		mav.addObject("pageNo", pageNo);
		mav.addObject("totalPages", service.getTotalPages());
		mav.addObject("pages", pageNumList);
		mav.addObject("count", service.getRecordCounts());
		mav.setViewName("event/queryList");

		return mav;
	}

	@PostMapping(value = "/queryLists", produces = "application/json")
	public @ResponseBody Map<String, Object> queryLists(
			@RequestParam(name = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(name = "query", required = false, defaultValue = "") String query,
			@RequestParam(name = "categoryId", required = false, defaultValue = "") String categoryId, Model m) {
		Map<String, Object> map = new HashMap<>();

		MemberBasic memberBasic = (MemberBasic) m.getAttribute("loginOK");
		if (memberBasic != null) {
			map.put("login", true);
		} else {
			map.put("login", false);
		}
		service.setCategoryId(categoryId);
		service.setPageNo(pageNo);
		service.setQuery(query);
		service.setTotalPages(service.getTotalPages());
		List<Event> list = service.getPage();
		List<Integer> pageNumList = service.getPageNumbers();
		
		map.put("categoryId",categoryId);
		map.put("query", query);
		map.put("lists", list);
		map.put("pageNo", pageNo);
		map.put("totalPages", service.getTotalPages());
		map.put("pages", pageNumList);
		map.put("count", service.getRecordCounts());

		return map;
	}

}
