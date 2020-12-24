package main.java.xxx30514.model;

import java.sql.Blob;
import java.time.LocalDateTime;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.jackey.model.EventComment;
import main.java.jackey.util.GlobalService;
@Repository("bikeerrorDao")
public class BikeErrorDAO {
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
		sql = "select count(*) from BikeError";
		Query<Long> reCount = session.createQuery(sql, Long.class);
		count = reCount.uniqueResult();
		System.out.println("總筆數" + count);
		return count;
	}

	public int getTotalPages() { // 總頁數
		totalPages = (int) (Math.ceil(getRecordCounts() / (double) recordsPerPage));
		return totalPages;
	}

	public int getSearchTotalPages(String status,String s) { // 總頁數
		totalPages = (int) (Math.ceil(getSearchRecordCounts(status,s) / (double) recordsPerPage));
		return totalPages;
	}
	public int getStatusSearchTotalPages(String status) { // 總頁數
		totalPages = (int) (Math.ceil(getSearchStatusCounts(status)/ (double) recordsPerPage));
		return totalPages;
	}

	public List<BikeError> selectAllBikeErrors() {// 全部查詢
		int startPageNo = (pageNo - 1) * recordsPerPage;
		Session session = getSession();
		
		Query<BikeError> query = session.createQuery("from BikeError order by  BE_ID", BikeError.class);
		query.setFirstResult(startPageNo);
		query.setMaxResults(recordsPerPage);
		System.out.println("第一筆資料" + startPageNo);
		List<BikeError> list = query.list();
		return list;
	}
	public List<BikeError> selectByMemberID(Integer memberId){
		Session session = getSession();
		Query<BikeError> query = session.createQuery("from BikeError Where  MEMBER_ID=?1 order by BE_ID desc",BikeError.class);
		query.setParameter(1, memberId);
		List<BikeError> list = query.list();
		return list;
	}

	public List<RestArea> detailRestAreas(Integer reID) {// 尚未使用
		Session session = getSession();
		Query<RestArea> query = session.createQuery("from RestArea  where RE_ID=?0", RestArea.class);
		query.setParameter(0, reID);
		List<RestArea> list = query.list();
		return list;
	}

	public long getSearchRecordCounts(String status,String s) {
		long count = 0;
		String sql;
		Session session = getSession();
		sql = "select count(*) from BikeError where BE_STATUS like ?0 and( BE_TITLE like ?1 or BE_DESCRIPTION like ?2 or BE_TAG like ?3 or MEMBER_ID like ?4 or BE_ID like ?5 or BE_REPLY like ?6)";
		Query<Long> query = session.createQuery(sql, Long.class);
		query.setParameter(0, "%" + status + "%");
		query.setParameter(1, "%" + s + "%");
		query.setParameter(2, "%" + s + "%");
		query.setParameter(3, "%" + s + "%");
		query.setParameter(4, "%" + s + "%");
		query.setParameter(5, "%" + s + "%");
		query.setParameter(6, "%" + s + "%");
		count = query.uniqueResult();
		System.out.println("總筆數" + count);
		return count;
	}
	public long getSearchStatusCounts(String status) {
		long count = 0;
		String sql;
		Session session = getSession();
		sql = "select count(*) from BikeError where BE_STATUS =?0";
		Query<Long> query = session.createQuery(sql, Long.class);
		query.setParameter(0,status);
		count = query.uniqueResult();
		System.out.println("總筆數" + count);
		return count;
	}

	public List<BikeError> selectBikeErrorStatus(String status) {// 狀態查詢
		int startPageNo = (pageNo - 1) * recordsPerPage;
		Session session = getSession();
		Query<BikeError> query = session.createQuery(
				"from BikeError where BE_STATUS=?0  order by BE_ID",
				BikeError.class);
		query.setParameter(0,status);
		
		query.setFirstResult(startPageNo);
		query.setMaxResults(recordsPerPage);
		List<BikeError> list = query.list();
		System.out.println(totalPages);
//		for (RestArea bk:list) {
//			System.out.println(bk.getName());
//			System.out.println(bk.getLatitude());
//			System.out.println(bk.getCity());
//		}
//		session.getTransaction().commit();
		return list;

	}
	public List<BikeError> selectBikeErrors(String status,String keyWord) {// 關鍵字查詢
		int startPageNo = (pageNo - 1) * recordsPerPage;
		Session session = getSession();
		Query<BikeError> query = session.createQuery(
				"from BikeError where BE_STATUS like ?0 and(BE_TITLE like ?1 or BE_DESCRIPTION like ?2 or BE_TAG like ?3 or MEMBER_ID like ?4 or BE_ID like ?5 or BE_REPLY like ?6)  order by BE_ID",
				BikeError.class);
		query.setParameter(0, "%" + status + "%");
		query.setParameter(1, "%" + keyWord + "%");
		query.setParameter(2, "%" + keyWord + "%");
		query.setParameter(3, "%" + keyWord + "%");
		query.setParameter(4, "%" + keyWord + "%");
		query.setParameter(5, "%" + keyWord + "%");
		query.setParameter(6, "%" + keyWord + "%");
		query.setFirstResult(startPageNo);
		query.setMaxResults(recordsPerPage);
		List<BikeError> list = query.list();
		System.out.println(totalPages);
//		for (RestArea bk:list) {
//			System.out.println(bk.getName());
//			System.out.println(bk.getLatitude());
//			System.out.println(bk.getCity());
//		}
//		session.getTransaction().commit();
		return list;

	}

	public boolean deleteBikeError(Integer beID) {// 刪除資料
		Session session = sessionFactory.getCurrentSession();
		BikeError result = session.get(BikeError.class, beID);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}

	public BikeError insertBikeError(BikeError bean) {// 新增資料
		Session session = getSession();
//		RestArea result = session.get(RestArea.class,bean.getId());
		// 不存在才新增
//		if (result == null) {
		session.save(bean);
		return bean;
//		}
//		return null;
	}

	public BikeError updateBikeError(Integer id, String title, String tag, String description, Integer memberid,String status,String reply,LocalDateTime endtime) {// 修改資料
		Session session = getSession();
		BikeError result = session.get(BikeError.class, id);
		if (result != null) {
			result.setId(id);
			result.setTitle(title);
			result.setDescription(description);
			result.setTag(tag);
			result.setMemberid(memberid);
			result.setStatus(status);
			result.setReply(reply);
			result.setEndtime(endtime);
		}
		return result;
	}
}
