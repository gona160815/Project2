package main.java.jackey.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.jackey.model.EventFavorite;
import main.java.jackey.model.service.EventFavoriteService;
import main.java.jackey.model.service.EventService;

@RestController
public class EventFavoriteController {

	@Autowired
	EventFavoriteService favoriteService;
	@Autowired
	EventService eventService;
	@Autowired
	MemberBasicServiceImpl memberService;

//	@PostMapping(value = "checkFavorite", produces = "application/json")
	public Map<String, Object> checkLike(@RequestParam Integer eventId, @RequestParam Integer memberId) {
		Map<String, Object> map = new HashMap<>();
		Boolean checkFavorite = favoriteService.checkFavorite(eventId, memberId);
		Long count = favoriteService.countByEvent(eventId);
		map.put("count", count);
		if (checkFavorite) {
			map.put("favorite", true);
		} else {
			map.put("favorite", false);
		}
		return map;
	}

	@PostMapping(value = "addFavorite", produces = "application/json")
	public Map<String, Object> addLike(@RequestParam Integer eventId,
			@RequestParam(name = "memberId", required = false) Integer memberId) {
		Map<String, Object> map = new HashMap<>();
		EventFavorite favorite = new EventFavorite();
		favorite.setEventId(eventId);
		favorite.setMemberId(memberId);
		Boolean result = favoriteService.insert(favorite);
		if (result) {
			map.put("success", true);
		} else {
			map.put("success", false);
		}
		return map;
	}

}
