package main.java.xxx30514.model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.jackey.util.GlobalService;

@Repository("bikeDao")
public class BikeDAO {
	
//	private Session session;
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
	public int getSearchTotalPages(String s,String s1) { //總頁數
		totalPages = (int) (Math.ceil(getSearchRecordCounts(s, s1) / (double) recordsPerPage));
		return totalPages;
	}
	
	
	public List<Bike> selectAllBikes(){//全部查詢
		int startPageNo = (pageNo - 1) * recordsPerPage;
		Session session = getSession();
		Query<Bike> query = session.createQuery("from Bike order by BK_ID",Bike.class);
		query.setFirstResult(startPageNo);
		query.setMaxResults(recordsPerPage);
		System.out.println("第一筆資料" + startPageNo);
		List<Bike> list = query.list();
		return list;
	}
	public List<Bike> selectAllBikeNoPages(){//全部查詢 nopage
		Session session = getSession();
		Query<Bike> query = session.createQuery("from Bike order by BK_ID",Bike.class);
		List<Bike> list = query.list();
		return list;
	}
	public List<Bike> detailBikes(String bkID){//尚未使用
		Session session = getSession();
		Query<Bike> query = session.createQuery("from Bike  where BK_ID=?0)",Bike.class);
		query.setParameter(0, bkID);
		List<Bike> list = query.list();
		return list;
	}
	public long getSearchRecordCounts(String s,String s1) {
		long count = 0;
		String sql;
		Session session = getSession();
		sql = "select count(*) from Bike where BK_city like ?0 and( BK_id like ?1 or BK_name like ?2 or BK_begin like ?3 or BK_goal like ?4 or BK_town like ?5 or BK_maintain like ?6 or BK_m like ?7 or BK_latitude like ?8 or BK_longitude like ?9)";
		Query<Long> query = session.createQuery(sql, Long.class);
		query.setParameter(0, "%" + s + "%");
		query.setParameter(1, "%" + s1 + "%");
		query.setParameter(2, "%" + s1 + "%");
		query.setParameter(3, "%" + s1 + "%");
		query.setParameter(4, "%" + s1 + "%");
		query.setParameter(5, "%" + s1 + "%");
		query.setParameter(6, "%" + s1 + "%");
		query.setParameter(7, "%" + s1 + "%");
		query.setParameter(8, "%" + s1 + "%");
		query.setParameter(9, "%" + s1 + "%");
		count = query.uniqueResult();
		System.out.println("總筆數" + count);
		return count;
	}
	
	public List<Bike> selectRoad(String s,String s1 ) {// 縣市+關鍵字查詢
		int startPageNo = (pageNo - 1) * recordsPerPage;
		Session session = getSession();
		Query<Bike> query = session.createQuery("from Bike where BK_city like ?0 and( BK_id like ?1 or BK_name like ?2 or BK_begin like ?3 or BK_goal like ?4 or BK_town like ?5 or BK_maintain like ?6 or BK_m like ?7 or BK_latitude like ?8 or BK_longitude like ?9)  order by BK_ID", Bike.class);
		query.setParameter(0, "%" + s + "%");
		query.setParameter(1, "%" + s1 + "%");
		query.setParameter(2, "%" + s1 + "%");
		query.setParameter(3, "%" + s1 + "%");
		query.setParameter(4, "%" + s1 + "%");
		query.setParameter(5, "%" + s1 + "%");
		query.setParameter(6, "%" + s1 + "%");
		query.setParameter(7, "%" + s1 + "%");
		query.setParameter(8, "%" + s1 + "%");
		query.setParameter(9, "%" + s1 + "%");
		query.setFirstResult(startPageNo);
		query.setMaxResults(recordsPerPage);
		List<Bike> list = query.list();
		System.out.println(totalPages);
//		for (Bike bk:list) {
//			System.out.println(bk.getName());
//			System.out.println(bk.getLatitude());
//			System.out.println(bk.getCity());
//		}
//		session.getTransaction().commit();
		return list;

	}

	public boolean deleteRoad(Integer bkID) {//刪除資料
	Session session =sessionFactory.getCurrentSession();
		Bike result = session.get(Bike.class,bkID);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	
	public Bike insertRoad(Bike bean) {//新增資料
		Session session = getSession();
//		Bike result = session.get(Bike.class, bean.getId());
		// 不存在才新增
//		if (result == null) {
			session.save(bean);
			return bean;
//		}
//		return null;
	}
	public Bike updateRoad(Integer  id, String name, String begin, 
			String goal, String city, String town, 
			String maintain, String m, String latitude, String longitude) {//修改資料
		Session session = getSession();
		Bike result = session.get(Bike.class, id);
		if (result != null) {
			result.setId(id);
			result.setName(name);
			result.setBegin(begin);
			result.setGoal(goal);
			result.setCity(city);
			result.setTown(town);
			result.setMaintain(maintain);
			result.setM(m);
			result.setLatitude(latitude);
			result.setLongitude(longitude);
		}
		return result;	
	}
	
	public Bike select(Integer id) {
		
		if (id != null || id !=0) {
			Bike bike = getSession().get(Bike.class,id);
			return bike;
		}else {
			return null;
		}
	}
	
	
		
}
