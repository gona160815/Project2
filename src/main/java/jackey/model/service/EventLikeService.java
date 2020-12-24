package main.java.jackey.model.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.model.MemberBasic;
import main.java.jackey.model.EventLike;
import main.java.jackey.model.dao.EventLikeDao;

@Service
public class EventLikeService {
	
	@Autowired
	private EventLikeDao eventLikeDao;

	public EventLike select(Integer likeId) {
		return eventLikeDao.select(likeId);
	}
	public EventLike select(Integer eventId,Integer memberId) {
		return eventLikeDao.select(eventId, memberId);
	}

	public List<EventLike> selectByEvent(Integer eventId) {
		return eventLikeDao.selectByEvent(eventId);
	}

	public List<MemberBasic> selectByMember(Integer memberId) {
		return eventLikeDao.selectByMember(memberId);
	}

	public List<MemberBasic> selectAllByMember(Integer memberId) {
		return eventLikeDao.selectAllByMember(memberId);
	}

	public Long countLikeByEvent(Integer eventId) {
		return eventLikeDao.countLikeByEvent(eventId);
	}

	public Boolean checkLike(Integer eventId, Integer memberId) {
		return eventLikeDao.checkLike(eventId, memberId);
	}

	public Boolean insert(EventLike eventLike) {
		return eventLikeDao.insert(eventLike);
	}

	public boolean delete(Integer likeId) {
		return eventLikeDao.delete(likeId);
	}

	public EventLike update(EventLike eventLike) {
		return eventLikeDao.update(eventLike);
	}
	
}
