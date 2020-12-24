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

@Repository("restareaDao")
public class RestareaDAO {

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
		sql = "select count(*) from RestArea";
		Query<Long> reCount = session.createQuery(sql, Long.class);
		count = reCount.uniqueResult();
		System.out.println("總筆數" + count);
		return count;
	}

	public int getTotalPages() { // 總頁數
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}

	public int getSearchTotalPages(String s, String s1) { // 總頁數
		totalPages = (int) (Math.ceil(getSearchRecordCounts(s, s1) / (double) recordsPerPage));
		return totalPages;
	}

	public List<RestArea> selectAllRestAreas() {// 全部查詢
		int startPageNo = (pageNo - 1) * recordsPerPage;
		Session session = getSession(); 
		//hql 查實體名 非表名 RestArea=bean name
		Query<RestArea> query = session.createQuery("from RestArea order by  RE_ID", RestArea.class);
		query.setFirstResult(startPageNo);
		query.setMaxResults(recordsPerPage);
		System.out.println("第一筆資料" + startPageNo);
		List<RestArea> list = query.list();
		return list;
	}

	public List<RestArea> detailRestAreas(Integer reID) {// 尚未使用
		Session session = getSession(); 
		Query<RestArea> query = session.createQuery("from RestArea  where RE_ID=?0", RestArea.class);
		query.setParameter(0, reID);
		List<RestArea> list = query.list();
		return list;
	}

	public long getSearchRecordCounts(String s, String s1) {
		long count = 0;
		String sql;
		Session session = getSession();
		sql = "select count(*) from RestArea  where RE_city like ?0 and( RE_name like ?1 or RE_town like ?2 or RE_address like ?3 or RE_tel like ?4)";
		Query<Long> query = session.createQuery(sql, Long.class);
		query.setParameter(0, "%" + s + "%");
		query.setParameter(1, "%" + s1 + "%");
		query.setParameter(2, "%" + s1 + "%");
		query.setParameter(3, "%" + s1 + "%");
		query.setParameter(4, "%" + s1 + "%");
		count = query.uniqueResult();
		System.out.println("總筆數" + count);
		return count;
	}

	public List<RestArea> selectRestArea(String city, String keyWord) {// 關鍵字查詢
		int startPageNo = (pageNo - 1) * recordsPerPage;
		Session session = getSession();
		Query<RestArea> query = session.createQuery(
				"from RestArea where RE_city like ?0 and( RE_name like ?1 or RE_town like ?2 or RE_address like ?3 or RE_tel like ?4)  order by RE_ID",
				RestArea.class);
		query.setParameter(0, "%" + city + "%");
		query.setParameter(1, "%" + keyWord + "%");
		query.setParameter(2, "%" + keyWord + "%");
		query.setParameter(3, "%" + keyWord + "%");
		query.setParameter(4, "%" + keyWord + "%");
		query.setFirstResult(startPageNo);
		query.setMaxResults(recordsPerPage);
		List<RestArea> list = query.list();
		System.out.println(totalPages);
//		for (RestArea bk:list) {
//			System.out.println(bk.getName());
//			System.out.println(bk.getLatitude());
//			System.out.println(bk.getCity());
//		}
//		session.getTransaction().commit();
		return list;

	}

	public boolean deleteRestArea(Integer reID) {// 刪除資料
		Session session = sessionFactory.getCurrentSession();
		RestArea result = session.get(RestArea.class, reID);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	public RestArea insertRestArea(RestArea bean) {// 新增資料
		Session session = getSession();
//		RestArea result = session.get(RestArea.class,bean.getId());
		// 不存在才新增
//		if (result == null) {
			session.save(bean);
			return bean;
//		}
//		return null;
	}

	public RestArea updateRestArea(Integer id, String name, String address, String tel, String city, String town) {// 修改資料
		Session session = getSession();
		RestArea result = session.get(RestArea.class, id);
		if (result != null) {
			result.setId(id);
			result.setCity(city);
			result.setTown(town);
			result.setName(name);
			result.setAddress(address);
			result.setTel(tel);
		}
		return result;
	}
	
	public RestArea select(Integer id) {
		if (id != null || id != 0) {
			RestArea restArea = getSession().get(RestArea.class, id);
			return restArea;
		}else {
			return null;
		}
	}

}
