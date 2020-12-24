package main.java.jackey.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import main.java.hugo.model.MemberBasic;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.jackey.model.Event;
import main.java.jackey.model.EventDetail;
import main.java.jackey.model.EventLike;
import main.java.jackey.model.service.EventDetailService;
import main.java.jackey.model.service.EventLikeService;
import main.java.jackey.model.service.EventService;

@RestController
public class EventLikeController {

	@Autowired
	EventLikeService likeService;
	@Autowired
	EventService eventService;
	@Autowired
	MemberBasicServiceImpl memberService;
	@Autowired
	EventDetailService detailService;

	@PostMapping(value = "checkLike", produces = "application/json")
	public Map<String, Object> checkLike(@RequestParam Integer eventId, @RequestParam Integer memberId) {
		Map<String, Object> map = new HashMap<>();
		Boolean checkLike = likeService.checkLike(eventId, memberId);
		Long count = likeService.countLikeByEvent(eventId);
		map.put("count", count);
		if (checkLike) {
			map.put("liked", true);
		} else {
			map.put("liked", false);
		}
		return map;
	}

	@PostMapping(value = "addLike", produces = "application/json")
	public Map<String, Object> addLike(@RequestParam Integer eventId,
			@RequestParam(name = "memberId", required = false) Integer memberId) {
		Map<String, Object> map = new HashMap<>();
		Event event = eventService.select(eventId);
		EventLike eventLike = new EventLike();
		eventLike.setEvent(event);
		eventLike.setMemberId(memberId);
		Boolean result = likeService.insert(eventLike);
		
		if (result) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String time = sdf.format(new Date());
		EventDetail detail = detailService.selectByEventNTime(eventId, time);
		if (detail == null) {
			detail=new EventDetail();
		}
		Long likeCount = likeService.countLikeByEvent(eventId);
		detail.setLikeCount(likeCount);
		detail.setEvent(event);
		detailService.update(detail);
		return map;
	}

	@PostMapping(value = "removeLike", produces = "application/json")
	public Map<String, Object> removeLike(@RequestParam Integer eventId,
			@RequestParam(name = "memberId", required = false) Integer memberId) {
		Map<String, Object> map = new HashMap<>();
		EventLike like = likeService.select(eventId, memberId);
		boolean result = likeService.delete(like.getLikeId());
		if (result) {
			map.put("success", result);
		} else {
			map.put("success", result);
		}
		return map;
	}

}
