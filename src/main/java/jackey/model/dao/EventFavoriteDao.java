package main.java.jackey.model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.hugo.model.MemberBasic;
import main.java.jackey.model.EventFavorite;
import main.java.jackey.model.EventLike;

@Repository("eventFavoriteDao")
public class EventFavoriteDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public List<EventFavorite> selectByEvent(Integer eventId) {
		Session session = getSession();
		Query<EventFavorite> query = session.createQuery("from EventFavorite where eventId=?1", EventFavorite.class);
		query.setParameter(1, eventId);
		List<EventFavorite> list = query.list();
		return list;
	}

	public List<MemberBasic> selectByMember(Integer memberId) {
		Session session = getSession();
		Query<MemberBasic> query = session.createQuery("from EventFavorite where memberId=?1", MemberBasic.class);
		query.setParameter(1, memberId);
		List<MemberBasic> list = query.list();
		return list;
	}

	public Long countLikeByEvent(Integer eventId) {
		Session session = getSession();
		Query<Long> query = session.createQuery("select count(e) from EventFavorite e Where eventId=?1", Long.class);
		query.setParameter(1, eventId);
		Long count = query.uniqueResult();
		return count;
	}
	
	public Boolean checkFavorite(Integer eventId, Integer memberId) {
		Session session = getSession();
		Query<EventFavorite> query = session.createQuery("from EventFavorite where eventId=?1 and memberId=?2",
				EventFavorite.class);
		query.setParameter(1, eventId);
		query.setParameter(2, memberId);
		EventFavorite result = query.uniqueResult();
		if (result != null) {
			return true;
		}
		return false;
	}
	
	public Boolean insert(EventFavorite eventFavorite) {
		Session session = getSession();
		if (eventFavorite != null) {
			session.save(eventFavorite);
			return true;
		}
		return false;
	}

	public Boolean delete(Integer favoriteId) {
		Session session = getSession();
		EventFavorite result = session.get(EventFavorite.class, favoriteId);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	public EventFavorite update(EventFavorite eventFavorite) {
		Session session = getSession();
		EventFavorite result = session.get(EventFavorite.class, eventFavorite.getFavoriteId());
		if (result != null) {
			session.update(result);
			return result;
		}
		return null;
	}

}
