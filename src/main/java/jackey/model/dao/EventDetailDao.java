package main.java.jackey.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.jackey.model.EventDetail;

@Repository("eventDetailDao")
@Transactional
public class EventDetailDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public EventDetail selectByEventNTime(Integer eventId, String time) {
		Session session = getSession();
		try {
			Query<EventDetail> query = session.createQuery("From EventDetail Where eventId=?1 and time=?2",
					EventDetail.class);
			query.setParameter(1, eventId);
			query.setParameter(2, time);
			EventDetail result = query.uniqueResult();
			return result;
		} catch (Exception e) {
			return null;
		}
	}

	public List<EventDetail> getTopLikes() {
		Query<EventDetail> query = getSession().createQuery("From EventDetail order by likeCount desc",
				EventDetail.class);
		query.setFirstResult(1);
		query.setMaxResults(10);
		List<EventDetail> list = query.list();
		return list;
	}

	public List<EventDetail> getTopViews() {
		Query<EventDetail> query = getSession().createQuery("From EventDetail order by viewCount desc",
				EventDetail.class);
		query.setFirstResult(1);
		query.setMaxResults(10);
		List<EventDetail> list = query.list();
		return list;
	}

	public List<EventDetail> getTopComments() {
		Query<EventDetail> query = getSession().createQuery("From EventDetail order by commentCount desc",
				EventDetail.class);
		query.setFirstResult(1);
		query.setMaxResults(10);
		List<EventDetail> list = query.list();
		return list;
	}

	public Map<String,Object> getTodayData() {
		Map<String,Object> map =new HashMap<>();
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		SimpleDateFormat lastSdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = lastSdf.format(date);
		
		Query query = getSession()
				.createQuery("select sum(commentCount) ,sum(likeCount) ,sum(viewCount) From EventDetail where time =?1 ");
		query.setParameter(1, today);
		List<Object[]> list = query.list();
		Object object[]  = list.get(0);
		for (int i = 0; i < object.length; i++) {
			map.put("todayData", object);
		}
		return map;
	}
	
	public Map<String, Object> getTodayDataByEvent(Integer eventId) {
		Map<String, Object> map = new HashMap<>();
		Calendar calendar = Calendar.getInstance();
		Date date = calendar.getTime();
		SimpleDateFormat lastSdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = lastSdf.format(date);
		
		Query query = getSession()
				.createQuery("select sum(commentCount) ,sum(likeCount) ,sum(viewCount) From EventDetail where time =?1 and eventId=?2 ");
		query.setParameter(1, today);
		query.setParameter(2, eventId);
		List<Object[]> list = query.list();
		Object object[]  = list.get(0);
		for (int i = 0; i < object.length; i++) {
			map.put("todayData", object);
		}
		
		return map;
	}

//	public Map<String, Object> getRecent7DaysDetails() {
//		Map<String, Object> map = new HashMap<String, Object>();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//		String today = sdf.format(new Date());
//		Calendar calendar = Calendar.getInstance();
//		calendar.add(Calendar.DATE, -7);
//		Date lastDate = calendar.getTime();
//		SimpleDateFormat lastSdf = new SimpleDateFormat("yyyy-MM-dd");
//		String lastSeven = lastSdf.format(lastDate);
//		Query<Long> commentQuery = getSession().createQuery(
//				"select sum(commentCount) from EventDetail where time BETWEEN ?1 and ?2", Long.class);
//		commentQuery.setParameter(1, today);
//		commentQuery.setParameter(2, lastSeven);
//		Long commentCounts = commentQuery.uniqueResult();
//		Query<Long> viewQuery = getSession()
//				.createQuery("select sum(viewCount) from EventDetail where time BETWEEN ?1 and ?2", Long.class);
//		commentQuery.setParameter(1, today);
//		commentQuery.setParameter(2, lastSeven);
//		Long viewCounts = viewQuery.uniqueResult();
//		Query<Long> likeQuery = getSession()
//				.createQuery("select sum(likeCount) from EventDetail where time BETWEEN ?1 and ?2", Long.class);
//		commentQuery.setParameter(1, today);
//		commentQuery.setParameter(2, lastSeven);
//		Long likeCounts = likeQuery.uniqueResult();
//
//		map.put("commentCounts", commentCounts);
//		map.put("likeCounts", likeCounts);
//		map.put("viewCounts", viewCounts);
//		return map;
//	}
	public Map<String, Object> getRecent7DaysDetails() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> sizeList = new ArrayList<Object>();
		try {
			for (int i = 0; i <= 7; i++) {
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.DATE, -i);
				Date lastDate = calendar.getTime();
				SimpleDateFormat lastSdf = new SimpleDateFormat("yyyy-MM-dd");
				String lastSeven = lastSdf.format(lastDate);
				Query commentQuery = getSession().createQuery(
						"select time,sum(commentCount) as commentCount,sum(likeCount) as likeCount,sum(viewCount) as viewCount"
								+ " from EventDetail where time =?1 Group by time");
				commentQuery.setParameter(1, lastSeven);
				List<Object[]> list = commentQuery.list();
				sizeList.add(list);
				Object obj[] = list.get(0);
				map.put("length", obj.length);
				for (int j = 0; j < obj.length; j++) {
					if (list != null) {
						map.put("last" + i + "day", list.get(0));
					} else {
						map.put("error", "day" + i + "no data");
					}
				}
			}

		} catch (Exception e) {
			map.put("error", "exception");
		} finally {
			map.put("size", sizeList.size());
		}

		return map;
	}

	public Map<String, Object> getRecent7DaysByEvent(Integer eventId) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> sizeList = new ArrayList<Object>();
		try {
			for (int i = 0; i <= 6; i++) {
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.DATE, -i);
				Date lastDate = calendar.getTime();
				SimpleDateFormat lastSdf = new SimpleDateFormat("yyyy-MM-dd");
				String lastSeven = lastSdf.format(lastDate);
				Query commentQuery = getSession().createQuery(
						"select time,sum(commentCount) as commentCount,sum(likeCount) as likeCount,sum(viewCount) as viewCount"
								+ " from EventDetail where time =?1 and eventId =?2 Group by time");
				commentQuery.setParameter(1, lastSeven);
				commentQuery.setParameter(2, eventId);
				List<Object[]> list = commentQuery.list();
				sizeList.add(list);
				Object obj[] = list.get(0);
				map.put("length", obj.length);
				for (int j = 0; j < obj.length; j++) {
					if (list != null) {
						map.put("last" + i + "day", list.get(0));
					} else {
						map.put("error", "day" + i + "no data");
					}
				}
			}

		} catch (Exception e) {
			map.put("error", "exception");
		} finally {
			map.put("size", sizeList.size());
		}

		return map;
	}

	public Map<String, Object> getRecent30DaysDetails() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Object> sizeList = new ArrayList<Object>();
		try {
			for (int i = 0; i <= 29; i++) {
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.DATE, -i);
				Date lastDate = calendar.getTime();
				SimpleDateFormat lastSdf = new SimpleDateFormat("yyyy-MM-dd");
				String lastThirty = lastSdf.format(lastDate);
				Query query = getSession().createQuery(
						"select time,sum(commentCount) as commentCount,sum(likeCount) as likeCount,sum(viewCount) as viewCount"
								+ " from EventDetail where time =?1 Group by time");
				query.setParameter(1, lastThirty);
				List<Object[]> list = query.list();
				sizeList.add(list);
				Object obj[] = list.get(0);
				map.put("length", obj.length);
				for (int j = 0; j < obj.length; j++) {
					if (list != null) {
						map.put("last" + i + "day", list.get(0));
					} else {
						map.put("error", "day" + i + "no data");
					}
				}
			}
		} catch (Exception e) {
//			map.put("error", "exception");
			e.printStackTrace();
		} finally {
			map.put("size", sizeList.size());
		}

		return map;
	}
	
	public Map<String, Object> getRecent30DaysByEvent(Integer eventId) {
		Map<String, Object> map = new HashMap<>();
		List<Object> sizeList = new ArrayList<Object>();
		try {
			for (int i = 0; i <= 29; i++) {
				Calendar calendar = Calendar.getInstance();
				calendar.add(Calendar.DATE, -i);
				Date lastDate = calendar.getTime();
				SimpleDateFormat lastSdf = new SimpleDateFormat("yyyy-MM-dd");
				String lastThirty = lastSdf.format(lastDate);
				Query query = getSession().createQuery(
						"select time,sum(commentCount) as commentCount,sum(likeCount) as likeCount,sum(viewCount) as viewCount"
								+ " from EventDetail where time =?1 and eventId =?2 Group by time");
				query.setParameter(1, lastThirty);
				query.setParameter(2, eventId);
				List<Object[]> list = query.list();
				sizeList.add(list);
				Object obj[] = list.get(0);
				map.put("length", obj.length);
				for (int j = 0; j < obj.length; j++) {
					if (list != null) {
						map.put("last" + i + "day", list.get(0));
					} else {
						map.put("error", "day" + i + "no data");
					}
				}
			}
		} catch (Exception e) {
			map.put("error", "require more data");
		} finally {
			map.put("size", sizeList.size());
		}

		
		
		return map;
	}

	public Map<String, Object> getMonthlyDetails() {
		Map<String, Object> map = new HashMap<>();
		Calendar startCalendar = Calendar.getInstance();
		Calendar endCalendar = Calendar.getInstance();
		for (int i = 0; i <= 11; i++) {
			startCalendar.set(Calendar.MONTH, 0);
			startCalendar.set(Calendar.DATE, 1);
			startCalendar.add(Calendar.MONTH, i);
			endCalendar.set(Calendar.MONTH, 0);
			endCalendar.set(Calendar.DATE, 1);
			endCalendar.add(Calendar.MONTH, i + 1);
			Date startMonthlyDate = startCalendar.getTime();
			Date endMonthlyDate = endCalendar.getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String startMonth = sdf.format(startMonthlyDate);
			String endMonth = sdf.format(endMonthlyDate);

			Query query = getSession().createQuery(
					"select sum(commentCount) as commentCount,sum(likeCount) as likeCount,sum(viewCount) as viewCount"
							+ " from EventDetail where time Between ?1 and ?2");
			query.setParameter(1, startMonth);
			query.setParameter(2, endMonth);
			List<Object[]> list = query.list();
			Object obj[] = list.get(0);
			map.put("length", obj.length);
			for (int j = 0; j < obj.length; j++) {
				if (list != null) {
					map.put("month" + i, list.get(0));
				} else {
					map.put("error", "month" + i + "no data");
				}
			}
		}

		return map;
	}
	public Map<String, Object> getMonthlyDetailsByEvent(Integer eventId) {
		Map<String, Object> map = new HashMap<>();
		Calendar startCalendar = Calendar.getInstance();
		Calendar endCalendar = Calendar.getInstance();
		for (int i = 0; i <= 11; i++) {
			startCalendar.set(Calendar.MONTH, 0);
			startCalendar.set(Calendar.DATE, 1);
			startCalendar.add(Calendar.MONTH, i);
			endCalendar.set(Calendar.MONTH, 0);
			endCalendar.set(Calendar.DATE, 1);
			endCalendar.add(Calendar.MONTH, i + 1);
			Date startMonthlyDate = startCalendar.getTime();
			Date endMonthlyDate = endCalendar.getTime();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String startMonth = sdf.format(startMonthlyDate);
			String endMonth = sdf.format(endMonthlyDate);
			
			Query query = getSession().createQuery(
					"select sum(commentCount) as commentCount,sum(likeCount) as likeCount,sum(viewCount) as viewCount"
							+ " from EventDetail where time Between ?1 and ?2 and eventId =?3");
			query.setParameter(1, startMonth);
			query.setParameter(2, endMonth);
			query.setParameter(3, eventId);
			List<Object[]> list = query.list();
			Object obj[] = list.get(0);
			map.put("length", obj.length);
			for (int j = 0; j < obj.length; j++) {
				if (list != null) {
					map.put("month" + i, list.get(0));
				} else {
					map.put("error", "month" + i + "no data");
				}
			}
		}
		
		return map;
	}

	public Boolean update(EventDetail eventDetail) {
		Session session = getSession();
		session.saveOrUpdate(eventDetail);
		return true;
	}

	public Boolean insert(EventDetail eventDetail) {
		Session session = getSession();
		if (eventDetail != null) {
			session.save(eventDetail);
			return true;
		} else {
			return null;
		}
	}
	
	public void delete(EventDetail eventDetail) {
		getSession().delete(eventDetail);
	}
	
	public EventDetail select(Integer detailId) {
		try {
			EventDetail eventDetail = getSession().get(EventDetail.class, detailId);
			return eventDetail; 
		} catch (Exception e) {
			return null;
		}
	}

}
