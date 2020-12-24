package main.java.jackey.model.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.java.jackey.model.EventComment;
import main.java.jackey.model.dao.EventCommentDao;

@Service
@Transactional
public class EventCommentService {

	@Autowired
	EventCommentDao eventCommentDao;

	public EventComment select(Integer commentId) {
		return eventCommentDao.select(commentId);
	}

	public List<EventComment> selectAll() {
		return eventCommentDao.selectAll();
	}

	public List<EventComment> selectByEvent(Integer eventId) {
		return eventCommentDao.selectByEvent(eventId);
	}

	public EventComment insert(EventComment eventComment) {
		return eventCommentDao.insert(eventComment);
	}

	public Boolean userDelete(Integer commentId) {
		return eventCommentDao.userDelete(commentId);
	}

	public Boolean mgrDelete(Integer commentId) {
		return eventCommentDao.mgrDelete(commentId);
	}

	public EventComment update(EventComment eventComment) {
		return eventCommentDao.update(eventComment);
	}
	
	public Boolean checkCommentByMember(Integer commentId, Integer memberId) {
		return eventCommentDao.checkCommentByMember(commentId, memberId);
	}

	public Long countCommentByEvent(Integer eventId) {
		return eventCommentDao.countCommentByEvent(eventId);
	}
}
