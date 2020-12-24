package main.java.jackey.model.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.java.hugo.model.MemberBasic;
import main.java.jackey.model.EventFavorite;
import main.java.jackey.model.dao.EventFavoriteDao;

@Service
public class EventFavoriteService {
	
	@Autowired
	EventFavoriteDao eventFavoriteDao;
	
	public List<EventFavorite> selectByEvent(Integer eventId) {
		return eventFavoriteDao.selectByEvent(eventId);
	}

	public List<MemberBasic> selectByMember(Integer memberId) {
		return eventFavoriteDao.selectByMember(memberId);
	}
	
	public Boolean checkFavorite(Integer eventId, Integer memberId) {
		return eventFavoriteDao.checkFavorite(eventId, memberId);
	}
	
	public Long countByEvent(Integer eventId) {
		return eventFavoriteDao.countLikeByEvent(eventId);
	}

	public Boolean insert(EventFavorite eventFavorite) {
		return eventFavoriteDao.insert(eventFavorite);
	}

	public Boolean delete(Integer favoriteId) {
		return eventFavoriteDao.delete(favoriteId);
	}

	public EventFavorite update(EventFavorite eventFavorite) {
		return eventFavoriteDao.update(eventFavorite);
	}
}
