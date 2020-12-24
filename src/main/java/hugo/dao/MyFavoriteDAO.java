package main.java.hugo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.hugo.model.MyFavorite;

@Repository("myFavoriteDAO")
public class MyFavoriteDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	//用infoId反查我的最愛
	public MyFavorite selectByInfoId(Integer memberId,Integer typeId,String infoId) {
		Query<MyFavorite> query = getSession().createQuery("From MyFavorite Where memberId =?1 and infoId = ?2 and typeId =?3",MyFavorite.class);
		query.setParameter(1, memberId);
		query.setParameter(2, infoId);
		query.setParameter(3, typeId);
		return query.uniqueResult();
	}
	
	// 新增最愛
	public Boolean insert(MyFavorite myFavorite) {
		try {
			getSession().save(myFavorite);
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// 刪除最愛
	public Boolean delete(Integer memberId, Integer typeId, String infoId) {
		Query<MyFavorite> createQuery = getSession()
				.createQuery("From MyFavorite Where MEMBERID=?0 and TYPEID=?1 and INFOID=?2", MyFavorite.class);
		createQuery.setParameter(0, memberId);
		createQuery.setParameter(1, typeId);
		createQuery.setParameter(2, infoId);
		try {
			MyFavorite uniqueResult = createQuery.uniqueResult();
			if (null != uniqueResult) {
				getSession().delete(uniqueResult);
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	// 依時間排序最愛(進到遠)
	public List<MyFavorite> selectByAddTime(Integer memberId) {
		String hql = "From MyFavorite Where memberId=?0 order by addTime desc";
		Query<MyFavorite> createQuery = getSession().createQuery(hql, MyFavorite.class);
		createQuery.setParameter(0, memberId);
		List<MyFavorite> list = createQuery.list();
		return list;
	}
	

	// 依時間排序最愛(進到遠)
	public List<MyFavorite> selectByAddTimeASC(Integer memberId) {
		String hql = "From MyFavorite Where memberId=?0 order by addTime asc";
		Query<MyFavorite> createQuery = getSession().createQuery(hql, MyFavorite.class);
		createQuery.setParameter(0, memberId);
		List<MyFavorite> list = createQuery.list();
		return list;
	}

	// 依種類排序最愛
	public List<MyFavorite> selectByType(Integer memberId) {
		String hql = "From MyFavorite Where memberId=?0 order by typeId";
		Query<MyFavorite> createQuery = getSession().createQuery(hql, MyFavorite.class);
		createQuery.setParameter(0, memberId);
		List<MyFavorite> list = createQuery.list();
		return list;
	}

	// 進入頁判斷是否加過我的最愛
	public Boolean checkFavorite(Integer memberId, Integer typeId, String infoId) {
		Query<MyFavorite> query = getSession()
				.createQuery("from MyFavorite where memberId=?1 and typeId=?2 and infoId=?3", MyFavorite.class);
		query.setParameter(1, memberId);
		query.setParameter(2, typeId);
		query.setParameter(3, infoId);
		try {
			MyFavorite result = query.uniqueResult();
			if (result != null) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	// 計算被加入我的最愛次數
	public Integer countFavorate(Integer typeId, String infoId) {
		Query<Integer> query = getSession().createQuery("from MyFavorite where typeId=?1 and infoId?2", Integer.class);
		query.setParameter(1, typeId);
		query.setParameter(2, infoId);
		Integer count = query.uniqueResult();
		return count;
	}

}
