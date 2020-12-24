package main.java.jackey.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import main.java.jackey.model.EventActivity;
import main.java.jackey.util.GlobalService;

@Repository("eventActivityDao")
@Transactional
public class EventActivityDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public EventActivity selectActivity(Integer activityId) {
		try {
			EventActivity eventActivity = getSession().get(EventActivity.class, activityId);
			return eventActivity;
		} catch (Exception e) {
			return null;
		}
	}

	public List<EventActivity> selectByActName(String name, Integer memberId) {
		Query<EventActivity> query = getSession()
				.createQuery("From EventActivity Where name =?1 and memberId=?2 order by actDate", EventActivity.class);
		query.setParameter(1, name);
		query.setParameter(2, memberId);
		return query.list();
	}

	public List<EventActivity> getOrderByMember(Integer memberId, String orderTime) {
		Query<EventActivity> query = getSession().createQuery(
				"From EventActivity Where MemberId =?1 and OrderTime =?2 Order by ActDate", EventActivity.class);
		query.setParameter(1, memberId);
		query.setParameter(2, orderTime);
		List<EventActivity> list = query.list();
		return list;
	}

	// 判斷是否有此行程，刪除原有的，新增成新的行程(前端已經先判斷過一次是否覆蓋)
	public EventActivity insert(EventActivity eventActivity) {
//		if (eventActivity != null) {
//			List<EventActivity> eventActivityList = selectByActName(eventActivity.getName(),
//					eventActivity.getMemberId());
//			if (eventActivityList != null) {
//				for (EventActivity activity : eventActivityList) {
//					getSession().delete(activity);
//					getSession().save(eventActivity);
//				}
//			}else {
		getSession().save(eventActivity);
//			}
		return eventActivity;
//		} else {
//			return null;
//		}
	}

	public EventActivity update(EventActivity eventActivity) {
		if (eventActivity != null) {
			getSession().update(eventActivity);
			return eventActivity;
		}
		return null;
	}

	public Boolean delete(Integer activityId) {
		try {
			EventActivity eventActivity = getSession().get(EventActivity.class, activityId);
			if (eventActivity != null) {
				getSession().delete(eventActivity);
				return true;
			}
		} catch (Exception e) {
			System.out.println("null activity");
			return null;
		}
		return null;
	}

	public List<EventActivity> getMgrPublishActivity(String name) {

		Query<EventActivity> query = getSession().createQuery("From EventActivity Where memberId=?1 and name =?2",
				EventActivity.class);
		query.setParameter(1, GlobalService.MGRID);
		query.setParameter(2, name);
		return query.list();
	}

//	ANALYZE

	public List<Long> countType() {
		List<Long> list = new ArrayList<Long>();
		for (int i = 1; i <= 5; i++) {
			Query<Long> query = getSession().createQuery("Select count(*) From EventActivity Where typeId =?1",
					Long.class);
			query.setParameter(1, i);
			list.add(query.uniqueResult());
		}
		return list;
	}
//	public Map<String, Object> countType(){
//		Map<String, Object> map = new HashMap<String, Object>();
//		for (int i = 1; i <= 5; i++) {
//			Query<Integer> query = getSession().createQuery("Select count(*) From EventActivity Where typeId =?1",Integer.class);
//			query.setParameter(1, i);
//			if (i == 1) {
//				map.put("hotel",query.uniqueResult());
//			}
//			if (i == 2) {
//				map.put("rental",query.uniqueResult());
//			}
//			if (i == 3) {
//				map.put("event",query.uniqueResult());
//			}
//			if (i == 4) {
//				map.put("bike",query.uniqueResult());
//			}
//			if (i == 5) {
//				map.put("restarea",query.uniqueResult());
//			}
//		}
//		return map;
//	}
}
