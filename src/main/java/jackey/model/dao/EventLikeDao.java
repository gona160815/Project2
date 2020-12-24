package main.java.jackey.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.hugo.model.MemberBasic;
import main.java.jackey.model.EventLike;

@Repository("eventLikeDao")
public class EventLikeDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public EventLike select(Integer likeId) {
		Session session = getSession();
		return session.get(EventLike.class, likeId);
	}
	public EventLike select(Integer eventId,Integer memberId) {
		Session session = getSession();
		Query<EventLike> query = session.createQuery("From EventLike Where eventId=?1 and memberId=?2",EventLike.class);
		query.setParameter(1, eventId);
		query.setParameter(2, memberId);
		try {
			EventLike like = query.uniqueResult();
			return like;
		} catch (Exception e) {
			return null;
		}
	}

	public List<EventLike> selectByEvent(Integer eventId) {
		Session session = getSession();
		Query<EventLike> query = session.createQuery("from EventLike where eventId=?1", EventLike.class);
		query.setParameter(1, eventId);
		List<EventLike> list = query.list();
		return list;
	}

	public List<MemberBasic> selectByMember(Integer memberId) {
		Session session = getSession();
		Query<MemberBasic> query = session.createQuery("from EventLike where memberId=?1", MemberBasic.class);
		query.setParameter(1, memberId);
		List<MemberBasic> list = query.list();
		return list;
	}

	public List<MemberBasic> selectAllByMember(Integer memberId) {
		Session session = getSession();
		Query<MemberBasic> query = session.createQuery("from EventLike where memberId=?1", MemberBasic.class);
		query.setParameter(1, memberId);
		List<MemberBasic> list = query.list();
		return list;
	}

	public Long countLikeByEvent(Integer eventId) {
		Session session = getSession();
		Query<Long> query = session.createQuery("select count(e) from EventLike e Where eventId=?1", Long.class);
		query.setParameter(1, eventId);
		Long count = query.uniqueResult();
		return count;
	}

	public Boolean checkLike(Integer eventId, Integer memberId) {
		Session session = getSession();
		Query<EventLike> query = session.createQuery("from EventLike where eventId=?1 and memberId=?2",
				EventLike.class);
		query.setParameter(1, eventId);
		query.setParameter(2, memberId);
		EventLike result = query.uniqueResult();
		if (result != null) {
			return true;
		}
		return false;
	}

	public Boolean insert(EventLike eventLike) {
		Session session = getSession();
		if (eventLike != null) {
			session.save(eventLike);
			return true;
		}
		return false;
	}

	public Boolean delete(Integer likeId) {
		Session session = getSession();
		EventLike result = session.get(EventLike.class, likeId);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	public EventLike update(EventLike eventLike) {
		Session session = getSession();
		EventLike result = session.get(EventLike.class, eventLike.getLikeId());
		if (result != null) {
			session.update(result);
			return result;
		}
		return null;
	}

}
