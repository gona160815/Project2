package main.java.jackey.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import main.java.jackey.model.ActName;
import main.java.jackey.model.Event;
import main.java.jackey.model.EventDetail;
import main.java.jackey.model.service.ActNameService;
import main.java.jackey.model.service.EventDetailService;
import main.java.jackey.model.service.EventService;

@Controller
public class InitDetail {

	@Autowired
	EventDetailService detailService;
	@Autowired
	EventService eventService;
	@Autowired
	ActNameService actNameService;

	@GetMapping(value = "/initDetail")
	public String setDetails() {
		Integer startEvent = 4728;
		Integer endEvent = 4735;
		EventDetail detail = null;
		Calendar calendar = Calendar.getInstance();
		for (int i = 0; i <= 11; i++) {
			calendar.set(Calendar.MONTH, i);
			for (int j = 1; j <= 31; j++) {
				calendar.set(Calendar.DATE, j);
				Date date = calendar.getTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String day = sdf.format(date);
				for (int k = startEvent; k <= endEvent; k++) {
					Long randomNumsCom = (long) (Math.random() * 10) + 1;
					Long randomNumsLike = (long) (Math.random() * 15) + 1;
					Long randomNumsView = (long) (Math.random() * 20) + 1;
					detail = new EventDetail();
					Event event = eventService.select(k);
					detail.setEvent(event);
					detail.setCommentCount(randomNumsCom);
					detail.setLikeCount(randomNumsLike);
					detail.setViewCount(randomNumsView);
					detail.setTime(day);
					detailService.update(detail);
				}
			}

		}
		System.out.println("init detail success");

		return "redirect:/event";
	}

//	@SuppressWarnings("null")
	@GetMapping(value = "/initActName")
	public String setActName() {
		ActName actName = null;
		Calendar calendar = Calendar.getInstance();
		Random rand;
		for (int i = 0; i <= 11; i++) {
			calendar.set(Calendar.MONTH, i);
			for (int j = 1; j <= 31; j++) {
				calendar.set(Calendar.DATE, j);
				Date date = calendar.getTime();
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				String day = sdf.format(date);
				System.out.println(day);
				rand = new Random();
				int price = rand.nextInt(10000);
				System.out.println(Integer.valueOf(price));
				System.out.println("price"+price);
				actName = new ActName();
				actName.setPrice(price);
				actName.setName("TEST"+day);
				actName.setStatus(1);
				actName.setMemberId(1407);
				actName.setOrderTime(day);
				actNameService.insert(actName);
				
//				Long randomNumsLike = (long) (Math.random() * 15) + 1;
//				Long randomNumsView = (long) (Math.random() * 20) + 1;
				
				
//				detail = new EventDetail();
//				Event event = eventService.select(k);
//				detail.setEvent(event);
//				detail.setCommentCount(randomNumsCom);
//				detail.setLikeCount(randomNumsLike);
//				detail.setViewCount(randomNumsView);
//				detail.setTime(day);
//				detailService.update(detail);
//				}
			}

		}
		System.out.println("init detail success");

		return "redirect:/event";
	}

	@GetMapping("/deleteDetail")
	public String delete() {
		for (int i = 1400252; i <= 1416320; i++) {
			EventDetail eventDetail = detailService.select(i);
			if (eventDetail != null) {
				detailService.delete(eventDetail);
				System.out.println(i);
			}
		}

		return "redirect:/event";
	}

}
