package main.java.jackey.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import main.java.gona.model.Area;
import main.java.jackey.model.Event;
import main.java.jackey.util.GlobalService;

@Repository("eventDao")
@Transactional
public class EventDao {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
//-----------------------------------------//

	private Integer pageNo = 0;
	private Integer totalPages = -1;
	private Integer recordsPerPage = GlobalService.RECORDS_PER_PAGE;
	private String query;
	private String categoryId;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	// ------------PAGE ---------------------------

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getQuery() {
		return this.query;
	}

	public void setQuery(String query) {
		this.query = query;
	}

	public Integer getPageNo() {
		return pageNo;
	}

	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}

	public Long getRecordCounts() {
		Long count;
		String sql;
		Session session = getSession();
		if (query.equals("") && categoryId.equals("")) {
			sql = "SELECT count(e) FROM Event e";
			Query<Long> eCount = session.createQuery(sql, Long.class);
			count = eCount.uniqueResult();
			return count;
		} else if (query.equals("") && !categoryId.equals("")) {
			sql = "SELECT count(e) FROM Event e Where categoryId=?1 ";
			Query<Long> eCount = session.createQuery(sql, Long.class);
			eCount.setParameter(1, categoryId);
			count = eCount.uniqueResult();
			return count;
		} else if (!query.equals("") && categoryId.equals("")) {
			sql = "SELECT count(e) FROM Event e WHERE Location like ?1 ";
			Query<Long> queryCount = session.createQuery(sql, Long.class);
			queryCount.setParameter(1, "%" + query + "%");
			count = queryCount.uniqueResult();
			return count;
		} else {
			sql = "SELECT count(e) FROM Event e WHERE Location like ?1 and categoryId=?2 ";
			Query<Long> queryCount = session.createQuery(sql, Long.class);
			queryCount.setParameter(1, "%" + query + "%");
			queryCount.setParameter(2, categoryId);
			count = queryCount.uniqueResult();
			return count;
		}
	}

	public Integer getTotalPages() {
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}

	public void setTotalPages(Integer totalPages) {
		this.totalPages = totalPages;
	}

	public Integer getRecordsPerPage() {
		return recordsPerPage;
	}

	public void setRecordsPerPage(Integer recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}

	public List<Event> getPage() {
		Integer startRecordNo = (pageNo - 1) * recordsPerPage;
		Session session = sessionFactory.getCurrentSession();
		if (query.equals("") && categoryId.equals("")) {
			Query<Event> result = session.createQuery("From Event ", Event.class);
			result.setFirstResult(startRecordNo);
			result.setMaxResults(recordsPerPage);
			List<Event> pageList = result.list();
			return pageList;
		} else if (query.equals("") && !categoryId.equals("")) {
			Query<Event> result = session.createQuery("From Event Where categoryId=?1", Event.class);
			result.setParameter(1, Integer.parseInt(categoryId));
			result.setFirstResult(startRecordNo);
			result.setMaxResults(recordsPerPage);
			List<Event> pageList = result.list();
			return pageList;
		} else if (!query.equals("") && categoryId.equals("")) {
			Query<Event> result = session.createQuery(
					"From Event Where EventId like ?1 or Location like ?1 or Title like ?1 or LocationName like ?1 or SHOWUNIT like ?1",
					Event.class);
			result.setParameter(1, "%" + query + "%");
			result.setFirstResult(startRecordNo);
			result.setMaxResults(recordsPerPage);
			List<Event> queryList = result.list();
			return queryList;
		} else {
			Query<Event> result = session.createQuery(
					"From Event Where EventId like ?1 or Location like ?1 or Title like ?1 or LocationName like ?1 or SHOWUNIT like ?1 and categoryId=?2 ",
					Event.class);
			result.setParameter(1, "%" + query + "%");
			result.setParameter(2, Integer.parseInt(categoryId));
			result.setFirstResult(startRecordNo);
			result.setMaxResults(recordsPerPage);
			List<Event> queryList = result.list();
			return queryList;
		}

	}

	public ArrayList<Integer> getPageNumbers() {
		Integer startPageNo = 1;
		Integer endPageNo = 1;
		if (pageNo <= 5) {
			startPageNo = 1;
			endPageNo = 10;
			if (totalPages <= 10) {
				startPageNo = 1;
				endPageNo = totalPages;
			}
		}
		if (pageNo > 5) {
			startPageNo = pageNo - 5;
			endPageNo = pageNo + 5;
			if (pageNo + 5 > totalPages) {
				startPageNo = pageNo - 5;
				endPageNo = totalPages;
			}
		}

		ArrayList<Integer> pageNumList = new ArrayList<Integer>();
		for (int i = startPageNo; i <= endPageNo; i++) {
			pageNumList.add(i);
		}
		return pageNumList;
	}

//		-------detail---------------------
	public List<Event> getLatestEvents() {
		Query<Event> query = getSession().createQuery("From Event order by eventId desc", Event.class);
		query.setFirstResult(1);
		query.setMaxResults(10);
		List<Event> list = query.list();
		return list;
	}
	
	public List<Long> countEventByCategory() {
		List<Long> list = new ArrayList<Long>();
		for (int i = 1; i <= 3; i++) {
			Query<Long> catQuery = getSession().createQuery("Select count(*) From Event Where CategoryId =?1",Long.class);
			catQuery.setParameter(1, i);
			list.add(catQuery.uniqueResult());
		}
		return list;
	}
	
	public Map<String, Object> countEventByLocation() {
		Map<String, Object> map = new HashMap<String, Object>();
		List<Long> list = new ArrayList<Long>();
		
		Query<Area> areaQuery = getSession().createQuery("From Area",Area.class);
		List<Area> areaList = areaQuery.list();
		for (Area area : areaList) {
			Query<Long> locationQuery = getSession().createQuery("Select count(*) From Event Where Location like ?1",Long.class);
			locationQuery.setParameter(1, "%"+area.getArea_name()+"%");
			list.add(locationQuery.uniqueResult());
		}
		map.put("locationCount",list);
		map.put("area",areaList);
		return map;
	}
	
	

	// CRUD ---------------------------------------------

	public Event select(Integer eventId) {
		Session session = sessionFactory.getCurrentSession();
		try {
			Event event = session.get(Event.class, eventId);
			return event;
		} catch (Exception e) {
			return null;
		}
	}

	public List<Event> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		if (query == null) {
			Query<Event> queryEvent = session.createQuery("from Event", Event.class);
			List<Event> list = queryEvent.list();
			return list;
		} else {
			Query<Event> queryEvent = session.createQuery("from Event Where Location like ?1 or LocationName like ?1 or Title like ?1", Event.class);
			queryEvent.setParameter(1, "%" + query + "%");
			List<Event> queryList = queryEvent.list();
			return queryList;
		}
	}

	public Event insert(Event eBean) {
		Session session = sessionFactory.getCurrentSession();
		Event result = session.get(Event.class, eBean.getEventId());
		if (result == null) {
			session.save(eBean);
			System.out.println("Insert Success");
			return eBean;
		}
		return null;
	}

	public Event insertData(Event eBean) {
		Session session = sessionFactory.getCurrentSession();
		try {
			session.save(eBean);
		} catch (Exception e) {
			session.clear();
		}
		return eBean;
	}

	public Boolean delete(Integer eventId) {
		Session session = sessionFactory.getCurrentSession();
		Event result = session.get(Event.class, eventId);
		if (result != null) {
			session.delete(result);
			System.out.println("Delete success");
			return true;
		}
		return false;
	}

	public Event update(Event event) {
		Session session = sessionFactory.getCurrentSession();
		if (event != null) {
			session.update(event);
			return event;
		}
		return null;
	}
}