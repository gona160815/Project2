package main.java.jackey.model.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutOneTime;
import main.java.jackey.model.ActName;
import main.java.jackey.util.GlobalService;

@Repository("actNameDao")
@Transactional
public class ActNameDao {
	public static AllInOne all;
	
	
	private Integer pageNo = 0;
	private Integer totalPages = -1;
	private Integer recordsPerPage = GlobalService.RECORDS_PER_PAGE;
	private String query;
	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	private Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	
	
	
	// CRUD
	public List<ActName> selectAll(){
		Query<ActName> actQuery = getSession().createQuery("From ActName order by ActNameId",ActName.class);
		return actQuery.list();
	}
	
	
	public ActName selectActNameById(Integer actNameId) {
		try {
			Query<ActName> query = getSession().createQuery("From ActName Where actNameId =?1 ", ActName.class);
			query.setParameter(1, actNameId);
			ActName result = query.uniqueResult();
			if (result != null) {
				return result;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

	public ActName selectActNameByName(Integer memberId, String name) {
		try {
			Query<ActName> query = getSession().createQuery("From ActName Where memberId =?1 and name=?2 ",
					ActName.class);
			query.setParameter(1, memberId);
			query.setParameter(2, name);
			ActName result = query.uniqueResult();
			if (result != null) {
				return result;
			} else {
				return null;
			}
		} catch (Exception e) {
			return null;
		}
	}

	public List<ActName> selectByMember(Integer memberId) {
		Query<ActName> query = getSession().createQuery("From ActName Where memberId =?1 order by ActNameId", ActName.class);
		query.setParameter(1, memberId);
		return query.list();
	}

	public ActName insert(ActName actName) {
		if (actName != null) {
			ActName result = selectActNameByName(actName.getMemberId(), actName.getName());
			if (result != null) {
				result.setOrderTime(actName.getOrderTime());
				result.setPrice(actName.getPrice());
				getSession().update(result);
				return result;
			} else {
				getSession().save(actName);
				return actName;
			}
		} else {
			return null;
		}
	}

	public Boolean delete(Integer actNameId) {
		try {
			ActName actName = getSession().get(ActName.class, actNameId);
			if (actName != null) {
				getSession().delete(actName);
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			return false;
		}
	}

	public void update(ActName actName) {
		if (actName != null) {
			getSession().update(actName);
		}
	}
	
// CHECK OUT SETTING
	public String payOrder(String actNameId, String orderTime, String price, String name) {
		all = new AllInOne("");
		AioCheckOutOneTime obj = new AioCheckOutOneTime();
		obj.setMerchantTradeNo(actNameId);
		obj.setMerchantTradeDate(orderTime);
		obj.setTotalAmount(price);
		obj.setTradeDesc("test Description");
		obj.setItemName(name);
		obj.setReturnURL("http://211.23.128.214:5000");
		obj.setClientBackURL("http://localhost:8080/EEIT124Team1FinalProject/myActivity");
		obj.setNeedExtraPaidInfo("N");
		obj.setRedeem("Y");
		String form = all.aioCheckOut(obj, null);
		return form;
	}
	
	//  MGR  PAGE 
	
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
		if (query.equals("")) {
			sql = "SELECT count(a) FROM ActName a Where memberId = ?1";
			Query<Long> actCount = session.createQuery(sql, Long.class);
			actCount.setParameter(1, GlobalService.MGRID);
			count = actCount.uniqueResult();
			return count;
		} else {
			sql = "SELECT count(a) FROM ActName a WHERE name like ?1 or actNameId like ?1 and memberId =?2";
			Query<Long> queryCount = session.createQuery(sql, Long.class);
			queryCount.setParameter(1, "%" + query + "%");
			queryCount.setParameter(2, GlobalService.MGRID);
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

	public List<ActName> getPage() {
		Integer startRecordNo = (pageNo - 1) * recordsPerPage;
		Session session = sessionFactory.getCurrentSession();
		if (query.equals("")) {
			Query<ActName> result = session.createQuery("From ActName Where memberId =?1 order by ActNameId", ActName.class);
			result.setParameter(1, GlobalService.MGRID);
			result.setFirstResult(startRecordNo);
			result.setMaxResults(recordsPerPage);
			List<ActName> pageList = result.list();
			return pageList;
		} else {
			Query<ActName> result = session.createQuery(
					"From ActName Where ActNameId like ?1 or Name like ?1 and memberId =?2 order by ActNameId",
					ActName.class);
			result.setParameter(1, "%" + query + "%");
			result.setParameter(2, GlobalService.MGRID);
			result.setFirstResult(startRecordNo);
			result.setMaxResults(recordsPerPage);
			List<ActName> queryList = result.list();
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
	
	public List<ActName> getMgrPublishActivity(){
		
		Query<ActName> query = getSession().createQuery("From ActName Where memberId=?1 order by actNameId",ActName.class);
		query.setParameter(1, GlobalService.MGRID);
		return query.list();
	}
	
//	ACT ANALYZE
	
	public Map<String, Object> countRevenue(){
		Map<String, Object> map = new HashMap<String, Object>();
		String weekHql = "Select sum(price) From ActName Where orderTime =?1 and status = 1";
		String monthHql = "Select sum(price) From ActName Where orderTime =?1 and status = 1";
		String yearHql = "Select sum(price) From ActName Where orderTime Between ?1 and ?2 and status = 1";
		List<Long> weekRevenue = new ArrayList<Long>();
		List<Long> monthRevenue = new ArrayList<Long>();
		List<Long> yearRevenue = new ArrayList<Long>();
		List<String> weekDate = new ArrayList<String>();
		List<String> monthDate = new ArrayList<String>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
//		WEEK REVENUE
		for (int i = 0; i <= 6; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, -i);
			Date lastSevenDate = calendar.getTime();
			SimpleDateFormat lastSdf = new SimpleDateFormat("yyyy-MM-dd");
			String lastSeven = lastSdf.format(lastSevenDate);
			Query<Long> weekQuery = getSession().createQuery(weekHql,Long.class);
			weekQuery.setParameter(1, lastSeven);
			weekDate.add(lastSeven);
			weekRevenue.add(weekQuery.uniqueResult());
		}
//		MONTH REVENUE
		for (int i = 0; i <= 29; i++) {
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.DATE, -i);
			Date lastDate = calendar.getTime();
			String lastThirty = sdf.format(lastDate);
			Query<Long> monthQuery = getSession().createQuery(monthHql,Long.class);
			monthQuery.setParameter(1, lastThirty);
			monthRevenue.add(monthQuery.uniqueResult());
			monthDate.add(lastThirty);
		}
//		YEAR REVENUE
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
			String startMonth = sdf.format(startMonthlyDate);
			String endMonth = sdf.format(endMonthlyDate);

			Query<Long> yearQuery = getSession().createQuery(yearHql,Long.class);
			yearQuery.setParameter(1, startMonth);
			yearQuery.setParameter(2, endMonth);
			yearRevenue.add(yearQuery.uniqueResult());
			
		}
		map.put("weekDate",weekDate);
		map.put("weekRevenue",weekRevenue);
		map.put("monthDate",monthDate);
		map.put("monthRevenue", monthRevenue);
		map.put("yearRevenue", yearRevenue);
		return map;
	}
	
}
