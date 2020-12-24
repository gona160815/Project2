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
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import main.java.hugo.model.MemberAdvanced;
import main.java.hugo.model.MemberBasic;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.jackey.model.Event;
import main.java.jackey.model.EventComment;
import main.java.jackey.model.EventDetail;
import main.java.jackey.model.service.EventCommentService;
import main.java.jackey.model.service.EventDetailService;
import main.java.jackey.model.service.EventService;

@RestController
@SessionAttributes({ "loginOK" })
public class EventCommentController {

	@Autowired
	EventCommentService commentService;
	@Autowired
	EventService eventService;
	@Autowired
	MemberBasicServiceImpl memberService;
	@Autowired
	EventDetailService detailService;

	@InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	@GetMapping(value = "eventComments")
	public Map<String, Object> commentList(@RequestParam Integer eventId) {

		Map<String, Object> map = new HashMap<>();
		List<EventComment> comments = commentService.selectByEvent(eventId);
		List<String> nameList = new ArrayList<String>();
		List<MemberBasic> memberList = new ArrayList<MemberBasic>();
		List<String> nickNameList = new ArrayList<String>();
		List<String> introList = new ArrayList<String>();
		for (EventComment eventComment : comments) {
			if (eventComment.getMemberId() != 0) {
				MemberBasic member = memberService.select(eventComment.getMemberId());
				String name = member.getName();
				nameList.add(name);
				memberList.add(member);
				MemberAdvanced memberAdvanced = member.getMemberAdvanced();
				if (null != memberAdvanced) {
					String nickName = memberAdvanced.getNickName();
					String intro = memberAdvanced.getIntro();
					if (null != nickName) {
						nickNameList.add(nickName);
					} else {
						nickNameList.add("已驗證會員");
					}
					if (null != intro) {
						introList.add(intro);
					} else {
						introList.add("這位朋友很懶，沒留下任何訊息。");
					}
				} else {
					nickNameList.add("未驗證會員");
					introList.add("這位朋友很懶，沒留下任何訊息。");
				}

			} else {
				nameList.add("查無此人");
			}
		}
		map.put("member",memberList);
		map.put("name", nameList);
		map.put("comment", comments);
		map.put("nickName", nickNameList);
		map.put("intro", introList);
		return map;
	}

	@PostMapping(value = "addComment")
	public Map<String, Object> getComment(@RequestParam Integer eventId, @RequestParam Integer memberId,
			@RequestParam Date time, @RequestParam String content) {

//		check LOGINOK
		Map<String, Object> map = new HashMap<>();
		Event event = eventService.select(eventId);
		EventComment comment = new EventComment();
		MemberBasic member = memberService.select(memberId);
		comment.setEvent(event);
		comment.setTime(time);
		comment.setMemberId(memberId);
		comment.setContent(content);
		commentService.insert(comment);
		MemberAdvanced memberAdvanced = member.getMemberAdvanced();
		if (null != memberAdvanced) {
			String nickName = memberAdvanced.getNickName();
			String intro = memberAdvanced.getIntro();
			if (null != nickName) {
				map.put("nickName", nickName);
			} else {
				map.put("nickName", "已驗證會員");
			}
			if (null != intro) {
				map.put("intro", intro);
			} else {
				map.put("intro", "這位朋友很懶，沒留下任何訊息。");
			}
		} else {
			map.put("nickName", "未驗證會員");
			map.put("intro", "這位朋友很懶，沒留下任何訊息。");
		}
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String commentTime = sdf.format(comment.getTime());
		map.put("comment", comment);
		map.put("commentTime", commentTime);
		map.put("member", member);
		SimpleDateFormat detailSdf = new SimpleDateFormat("yyyy-MM-dd");
		String detailTime = detailSdf.format(new Date());
		Long commentCount = commentService.countCommentByEvent(eventId);
		EventDetail detail = detailService.selectByEventNTime(eventId, detailTime);
		if (detail == null) {
			detail = new EventDetail();
		}
		detail.setEvent(event);
		detail.setCommentCount(commentCount);
		detailService.update(detail);
		return map;
	}

	@PostMapping(value = "mgrDeleteComment")
	public Boolean mgrDeleteComment(@RequestParam Integer commentId) {
		Boolean result = commentService.mgrDelete(commentId);
		return result;
	}
	
	@PostMapping(value = "checkCommentByMember")
	public Boolean checkCommentByMember(Integer commentId,Integer memberId) {
		Boolean result = commentService.checkCommentByMember(commentId, memberId);
		return result;
	}
	
	@PostMapping(value = "userDeleteComment")
	public Boolean userDeleteComment(@RequestParam Integer commentId) {
		Boolean result = commentService.userDelete(commentId);
		return result;
	}

}
