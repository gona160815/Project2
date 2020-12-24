package main.java.jackey.model.service;

import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.java.jackey.model.EventDetail;
import main.java.jackey.model.dao.EventDetailDao;

@Service
@Transactional
public class EventDetailService {

	@Autowired
	EventDetailDao eventDetailDao;

	public EventDetail selectByEventNTime(Integer eventId, String time) {
		return eventDetailDao.selectByEventNTime(eventId, time);
	}

	public Boolean update(EventDetail eventDetail) {
		return eventDetailDao.update(eventDetail);
	}

	public Boolean insert(EventDetail eventDetail) {
		return eventDetailDao.insert(eventDetail);
	}
	
	public void delete(EventDetail eventDetail) {
		eventDetailDao.delete(eventDetail);
	}
	
	public EventDetail select(Integer detailId) {
		return eventDetailDao.select(detailId);
	}

	public List<EventDetail> getTopLikes() {
		return eventDetailDao.getTopLikes();
	}

	public List<EventDetail> getTopViews() {
		return eventDetailDao.getTopViews();
	}

	public List<EventDetail> getTopComments() {
		return eventDetailDao.getTopComments();
	}
	
	public Map<String,Object> getTodayData() {
		return eventDetailDao.getTodayData();
	}

	public Map<String, Object> getRecent7DaysDetails() {
		return eventDetailDao.getRecent7DaysDetails();
	}
	
	public Map<String, Object> getRecent30DaysDetails() {
		return eventDetailDao.getRecent30DaysDetails();
	}
	
	public Map<String, Object> getMonthlyDetails() {
		return eventDetailDao.getMonthlyDetails();
	}
	public Map<String, Object> getMonthlyDetailsByEvent(Integer eventId) {
		return eventDetailDao.getMonthlyDetailsByEvent(eventId);
	}
	
	public Map<String, Object> getRecent7DaysByEvent(Integer eventId) {
		return eventDetailDao.getRecent7DaysByEvent(eventId);
	}
	
	public Map<String, Object> getRecent30DaysByEvent(Integer eventId) {
		return eventDetailDao.getRecent30DaysByEvent(eventId);
	}
	
	public Map<String, Object> getTodayDataByEvent(Integer eventId) {
		return eventDetailDao.getTodayDataByEvent(eventId);
	}
	
	
}
