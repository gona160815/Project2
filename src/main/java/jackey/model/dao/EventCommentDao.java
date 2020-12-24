package main.java.jackey.model.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.jackey.model.EventComment;

@Repository("eventCommentDao")
@Transactional
public class EventCommentDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public EventComment select(Integer commentId) {
		Session session = getSession();
		return session.get(EventComment.class, commentId);
	}

	public List<EventComment> selectAll() {
		Session session = getSession();
		Query<EventComment> query = session.createQuery("from EventComment", EventComment.class);
		List<EventComment> list = query.list();
		return list;
	}

	public List<EventComment> selectByEvent(Integer eventId) {
		Session session = getSession();
		Query<EventComment> query = session.createQuery("from EventComment Where eventId=?1 order by time",
				EventComment.class);
		query.setParameter(1, eventId);
		List<EventComment> list = query.list();

		return list;
	}

	public Boolean checkCommentByMember(Integer commentId, Integer memberId) {
		try {
			Query<EventComment> query = getSession().createQuery("From EventComment where commentId=?1 and memberId=?2",
					EventComment.class);
			query.setParameter(1, commentId);
			query.setParameter(2, memberId);
			EventComment result = query.uniqueResult();
			if (result != null) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	public Long countCommentByEvent(Integer eventId) {
		Session session = getSession();
		Query<Long> query = session.createQuery("Select count(*) From EventComment Where eventId=?1", Long.class);
		query.setParameter(1, eventId);
		Long count = query.uniqueResult();
		return count;
	}

	public EventComment insert(EventComment eventComment) {
		Session session = getSession();
		session.save(eventComment);
		return eventComment;
	}

	public Boolean mgrDelete(Integer commentId) {
		Session session = getSession();
		EventComment result = session.get(EventComment.class, commentId);
		if (result != null) {
			result.setContent("此評論已被管理員刪除");
			session.update(result);
			return true;
		}
		return false;
	}

	public Boolean userDelete(Integer commentId) {
		Session session = getSession();
		EventComment result = session.get(EventComment.class, commentId);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	public EventComment update(EventComment eventComment) {
		Session session = getSession();
		EventComment result = session.get(EventComment.class, eventComment.getCommentId());
		if (result != null) {
			session.update(result);
			return result;
		}
		return null;
	}

}
