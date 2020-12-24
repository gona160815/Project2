package main.java.jackey.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.java.jackey.model.EventActivity;
import main.java.jackey.model.dao.EventActivityDao;

@Service
@Transactional
public class EventActivityService {
	@Autowired
	EventActivityDao eventActivityDao;
	
	public EventActivity selectActivity(Integer activityId) {
		return eventActivityDao.selectActivity(activityId);
	}
	
	public List<EventActivity> selectByActName(String name, Integer memberId) {
		return eventActivityDao.selectByActName(name, memberId);
	}

	public List<EventActivity> getOrderByMember(Integer memberId, String orderTime) {
		return eventActivityDao.getOrderByMember(memberId, orderTime);
	}

	public EventActivity insert(EventActivity eventActivity) {
		return eventActivityDao.insert(eventActivity);
	}

	public EventActivity update(EventActivity eventActivity) {
		return eventActivityDao.update(eventActivity);
	}

	public Boolean delete(Integer activityId) {
		return eventActivityDao.delete(activityId);
	}
	public List<Long> countType(){
		return eventActivityDao.countType();
	}
//	public Map<String, Object> countType(){
//		return eventActivityDao.countType();
//	}

}
