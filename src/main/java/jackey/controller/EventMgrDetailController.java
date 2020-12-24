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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import main.java.hugo.model.MemberBasic;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.jackey.model.Event;
import main.java.jackey.model.EventComment;
import main.java.jackey.model.service.EventCommentService;
import main.java.jackey.model.service.EventService;

@Controller
public class EventMgrDetailController {
	
	@Autowired
	EventService eventService;
	@Autowired
	EventCommentService commentService;
	@Autowired
	MemberBasicServiceImpl memberService;
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	
	@GetMapping("/eventDetail/{eventId}")
	public String eventDetailPage(@PathVariable Integer eventId,Model m) {
		Event event = eventService.select(eventId);
		m.addAttribute("event",event);
		return "event/eventDetail";
	}
	
	@PostMapping(value = "/commentList",produces = "application/json")
	public @ResponseBody Map<String, Object> commentList(@RequestParam Integer eventId){
		Map<String, Object> map = new HashMap<>();
		List<EventComment> comment = commentService.selectByEvent(eventId);
		List<String> name = new ArrayList<String>();
		System.out.println(comment.toString());
		if (comment != null ) {
			
			for (EventComment eventComment : comment) {
				Integer memberId = eventComment.getMemberId();
				if (memberId != 0) {
					MemberBasic member = memberService.select(memberId);
					name.add(member.getName());
				}else {
					name.add("查無此人");
				}
			}
			map.put("name",name);
			map.put("comment", comment);
		}
		return map;
		
	}
	
}
