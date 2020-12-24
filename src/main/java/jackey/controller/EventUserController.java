package main.java.jackey.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.java.jackey.model.Event;
import main.java.jackey.model.dao.EventDao;
import main.java.jackey.model.service.EventService;

@Controller
public class EventUserController {

	@Autowired
	EventService service;
	
	
	@RequestMapping(path = "/event.controller", method = RequestMethod.GET)
	public String userEntryPage(@RequestParam(name = "pageNo") String pageNoStr,
			@RequestParam(name = "query") String query, @RequestParam(name = "categoryId") String categoryId, Model m) {
			
		int pageNo = 1;
		if (pageNoStr == null) {
			pageNo = 1;
		} else {
			try {
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (NumberFormatException e) {
				pageNo = 1;
			}
		}
		service.setPageNo(pageNo);
		if (categoryId != null) {
			service.setCategoryId(categoryId.trim());
			m.addAttribute("categoryId", String.valueOf(categoryId));
		}
		service.setQuery(query);
		service.setTotalPages(service.getTotalPages());
		ArrayList<Integer> pageNumList = service.getPageNumbers();
		List<Event> eList = service.getPage();
		m.addAttribute("queryList", eList);
		m.addAttribute("pageNo", String.valueOf(pageNo));
		m.addAttribute("totalPages", service.getTotalPages());
		m.addAttribute("query", query);
		m.addAttribute("pages", pageNumList);
		return "event/eventsUsers";
	}

}
