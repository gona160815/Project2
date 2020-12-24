package main.java.xxx30514.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.jackey.util.GlobalService;

@Repository("hotBikeDao")
public class HotBikeDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	private int pageNo = 0;
	private int totalPages = -1;
	private int recordsPerPage = GlobalService.RECORDS_PER_PAGE;
	
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getRecordsPerPage() {
		return recordsPerPage;
	}
	public void setRecordsPerPage(int recordsPerPage) {
		this.recordsPerPage = recordsPerPage;
	}
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public long getRecordCounts() {
		long count = 0;
		String sql;
		Session session = getSession();
		sql = "select count(*) from Bike";
		Query<Long> bkCount = session.createQuery(sql, Long.class);
		count = bkCount.uniqueResult();
		System.out.println("總筆數" + count);
		return count;
	}
	
	public int getTotalPages() { //總頁數
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}
	
	
	public List<HotBike> selectAllHotBikes(){//全部查詢
		int startPageNo = (pageNo - 1) * recordsPerPage;
		Session session = getSession();
		Query<HotBike> query = session.createQuery("from HotBike order by BK_ID",HotBike.class);
		query.setFirstResult(startPageNo);
		query.setMaxResults(recordsPerPage);
		System.out.println("第一筆資料" + startPageNo);
		List<HotBike> list = query.list();
		return list;
	}
	public List<HotBike> selectAllHotBikeNoPages(){//全部查詢 nopage
		Session session = getSession();
		Query<HotBike> query = session.createQuery("from HotBike order by HB_ID",HotBike.class);
		List<HotBike> list = query.list();
		return list;
	}
	public HotBike select(Integer id) {
		if (id != null || id != 0) {
			HotBike hotBike = getSession().get(HotBike.class, id);
			return hotBike;
		}else {
			return null;
		}
	}
}
