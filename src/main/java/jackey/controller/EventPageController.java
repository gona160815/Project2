package main.java.jackey.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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

import main.java.hugo.model.MemberBasic;
import main.java.hugo.service.MyFavoriteServiceImpl;
import main.java.jackey.model.ActName;
import main.java.jackey.model.Event;
import main.java.jackey.model.EventDetail;
import main.java.jackey.model.service.ActNameService;
import main.java.jackey.model.service.EventCommentService;
import main.java.jackey.model.service.EventDetailService;
import main.java.jackey.model.service.EventLikeService;
import main.java.jackey.model.service.EventService;

@Controller
@SessionAttributes({ "loginOK" })
public class EventPageController {

	@Autowired
	EventService eventService;
	@Autowired
	EventDetailService detailService;
	@Autowired
	EventCommentService commentService;
	@Autowired
	EventLikeService likeService;
	@Autowired
	ActNameService actNameService;
	

	@GetMapping("/event")
	public String eventEntryPage(Model m) {
		List<Event> latestEvents = eventService.getLatestEvents();
		List<Event> topCommentsList = new ArrayList<Event>();
		List<Event> topLikesList = new ArrayList<Event>();
		List<Event> topViewsList = new ArrayList<Event>();
		List<EventDetail> comments = detailService.getTopComments();
		List<ActName> actNames = actNameService.getMgrPublishActivity();
		
		for (EventDetail eventDetail : comments) {
			Event event = eventDetail.getEvent();
			if (event != null) {
				Integer eventId = event.getEventId();
				Event topCommentEvent = eventService.select(eventId);
				topCommentsList.add(topCommentEvent);
			}
		}
		List<EventDetail> likes = detailService.getTopLikes();
		for (EventDetail eventDetail : likes) {
			Event event = eventDetail.getEvent();
			if (event != null) {
				Integer eventId = event.getEventId();
				Event topLikeEvent = eventService.select(eventId);
				topLikesList.add(topLikeEvent);
			}
		}
		List<EventDetail> views = detailService.getTopViews();
		for (EventDetail eventDetail : views) {
			Event event = eventDetail.getEvent();
			if (event != null) {
				Integer eventId = event.getEventId();
				Event topViewEvent = eventService.select(eventId);
				topViewsList.add(topViewEvent);
			}
		}
		m.addAttribute("actNames",actNames);
		m.addAttribute("latests", latestEvents);
		m.addAttribute("comments", topCommentsList);
		m.addAttribute("likes", topLikesList);
		m.addAttribute("views", topViewsList);
		return "event/event";
	}
	
	

	@GetMapping(value = "/event.json", produces = "application/json")
	public @ResponseBody Map<String, Object> getEventPage(
			@RequestParam(name = "pageNo", required = false, defaultValue = "1") Integer pageNo,
			@RequestParam(name = "query", required = false, defaultValue = "") String query,
			@RequestParam(name = "categoryId", required = false, defaultValue = "") String categoryId) {
		eventService.setCategoryId(categoryId);
		eventService.setPageNo(pageNo);
		eventService.setQuery(query);
		List<Event> list = eventService.getPage();
		List<Integer> pageNumList = eventService.getPageNumbers();
		Map<String, Object> map = new HashMap<>();

		map.put("list", list);
		map.put("pageNo", pageNo);
		map.put("totalPages", eventService.getTotalPages());
		map.put("pages", pageNumList);
		return map;

	}

	@GetMapping(value = "/event/{eventId}")
	public String showEventDetail(@PathVariable Integer eventId, Model m) {
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(date);
		System.out.println("time" + time);
		Long likeCount = likeService.countLikeByEvent(eventId);
		Long commentCount = commentService.countCommentByEvent(eventId);
		Event event = eventService.select(eventId);
		EventDetail eventDetail = detailService.selectByEventNTime(eventId, time);
		if (eventDetail == null) {
			eventDetail = new EventDetail();
			eventDetail.setViewCount((long) 1);
		} else {
			eventDetail.setViewCount(eventDetail.getViewCount() + 1);
		}
		eventDetail.setEvent(event);
		eventDetail.setLikeCount(likeCount);
		eventDetail.setCommentCount(commentCount);
		eventDetail.setTime(time);
		detailService.update(eventDetail);
		m.addAttribute("event", event);
		return "event/eventUI_detail";
	}

	@PostMapping(value = "/checkLogin")
	public @ResponseBody Map<String, Object> checkLogin(Model m) {
		Map<String, Object> map = new HashMap<>();
		MemberBasic login = (MemberBasic) m.getAttribute("loginOK");
		if (login != null) {
			map.put("login", true);
			map.put("member", login);
		} else {
			map.put("login", false);
		}
		return map;
	}

}
