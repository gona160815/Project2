package main.java.hugo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.id.enhanced.TableStructure;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import main.java.hugo.model.MemberAuth;
import main.java.hugo.model.MemberBasic;
@Transactional
@Repository("memberBasicDAO")
public class MemberBasicDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();

	}

	public MemberBasic insert(MemberBasic memberBasic) {

		System.out.println("IDIDID=" + memberBasic.getFavorId());

		getSession().save(memberBasic);
		System.out.println("新增完成");
		return memberBasic;
	}

	public MemberBasic queryone(String email) {
		String hql = "from MemberBasic where email =?0";
		Query<MemberBasic> query = getSession().createQuery(hql, MemberBasic.class);
		query.setParameter(0, email);
		System.out.println("eeee :"+email);
		MemberBasic memberBasic = query.uniqueResult();
		return memberBasic;
	}

	public int countAll() {
		String hql = "select count(*) from MemberBasic";
		Query<Number> createQuery = getSession().createQuery(hql, Number.class);
		int num = (int) createQuery.uniqueResult().intValue();
		return num;
	}

	public MemberBasic update(MemberBasic memberBasic) {
		MemberBasic result = getSession().get(MemberBasic.class, memberBasic.getMemberId());
		if (result != null) {
			result.setAreaId(memberBasic.getAreaId());
			result.setFavorId(memberBasic.getFavorId());
			result.setName(memberBasic.getName());
			result.setPassword(memberBasic.getPassword());
			result.setTel(memberBasic.getTel());
			return result;
		}
		return result;
	}

	// 用ID查基本表格
	public MemberBasic select(int id) {
		MemberBasic result = getSession().get(MemberBasic.class, id);
		return result;
	}

	// 以地區查詢基本表格(會員)
	public List<MemberBasic> selectArea(int areaId) {
		String hql = "From MemberBasic where AREAID=?0 order by memberId";
//		String hql2 = "Select mb,ma.birthday From MemberBasic mb,MemberAdvanced ma where mb.memberid = ma.memberid and mb.AREAID=?0";
		Query<MemberBasic> createQuery = getSession().createQuery(hql, MemberBasic.class);
		createQuery.setParameter(0, areaId);
		List<MemberBasic> list = createQuery.list();
		return list;
	}

	// 以地區查詢合併表格(會員)
	public List<Object> selectAreaJoinAdvanced(int areaId) {
//			String hql = "select MemberBasic,Favor from MemberBasic,Favor where MemberBasic.favorid = Favor.favorid and MemberBasic.AREAID=?0";
//			String hql = "Select new map(memberb as mb,f.favor as fr) From MemberBasic memberb, Favor f where memberb.favorId = f.favorId and AREAID=?0";
		String hql = "From MemberBasic as mb,Favor as fr where mb.favorId = fr.favorId and AREAID=?0";
		Query createQuery = getSession().createSQLQuery(hql);
		createQuery.setParameter(0, areaId);
		List<Object> list = createQuery.list();
		return list;

	}

//	public Set<MemberBasic> selectByArea(int areaId) {
//		MemberArea memberArea = getSession().get(MemberArea.class, areaId);//找出AREA物件
//		Set<MemberBasic> memberBasics = memberArea.getMemberBasics();//取得會員集合
//		return memberBasics;
//	}

	// 更新基本資料
	public void updateBasicInfo(MemberBasic memberBasic) {
		getSession().update(memberBasic);
//		update(memberBasic);
	}

	// 以姓別查詢
	public List<MemberBasic> selectGender(String gender) {
		String hql = "From MemberBasic where GENDER=?0 order by memberId";
//		String hql2 = "Select mb,ma.birthday From MemberBasic mb,MemberAdvanced ma where mb.memberid = ma.memberid and mb.AREAID=?0";
		Query<MemberBasic> createQuery = getSession().createQuery(hql, MemberBasic.class);
		createQuery.setParameter(0, gender);
		List<MemberBasic> list = createQuery.list();
		return list;
	}

//	以帳號狀態查詢
	public List<MemberAuth> selectStatus(Integer statusId) {
		String hql = "From MemberAuth where STATUSID=?0 and AuthorityId=1 order by memberId";
//		String hql2 = "Select mb,ma.birthday From MemberBasic mb,MemberAdvanced ma where mb.memberid = ma.memberid and mb.AREAID=?0";
		Query<MemberAuth> createQuery = getSession().createQuery(hql, MemberAuth.class);
		createQuery.setParameter(0, statusId);
		List<MemberAuth> list = createQuery.list();
		return list;
	}

	// 以偏好查詢
	public List<MemberBasic> selectFavor(Integer favorId) {
		String hql = "From MemberBasic where FavorId=?0 order by memberId";
//		String hql2 = "Select mb,ma.birthday From MemberBasic mb,MemberAdvanced ma where mb.memberid = ma.memberid and mb.AREAID=?0";
		Query<MemberBasic> createQuery = getSession().createQuery(hql, MemberBasic.class);
		createQuery.setParameter(0, favorId);
		List<MemberBasic> list = createQuery.list();
		return list;
	}

	// 全域搜尋
	public List<MemberBasic> allRangeQuery(String query) {
		String hql = "From MemberBasic where Email like ?0 or Name like ?1 or Tel like ?2 order by memberId";
		Query<MemberBasic> createQuery = getSession().createQuery(hql, MemberBasic.class);
		createQuery.setParameter(0, "%" + query + "%");
		createQuery.setParameter(1, "%" + query + "%");
		createQuery.setParameter(2, "%" + query + "%");
		List<MemberBasic> list = createQuery.list();
		return list;
	}

	// 依身分查詢
	public List<MemberAuth> selectAuthority(Integer authorityId) {
		String hql = "From MemberAuth where AuthorityId=?0 order by memberId";
		Query<MemberAuth> createQuery = getSession().createQuery(hql, MemberAuth.class);
		createQuery.setParameter(0, authorityId);
		List<MemberAuth> list = createQuery.list();
		return list;
	}

	// find all
	public List<MemberBasic> selectAll() {
		String hql = "From MemberBasic order by memberId";
		Query<MemberBasic> createQuery = getSession().createQuery(hql, MemberBasic.class);
		List<MemberBasic> list = createQuery.list();
		return list;
	}
	
	//get every area of member
	public List<MemberBasic> getEveryAreaOfMember(Integer areaId){
		String hql = "From MemberBasic Where AREAID=?0 order by memberId";
		Query<MemberBasic> createQuery = getSession().createQuery(hql, MemberBasic.class);
		createQuery.setParameter(0, areaId);
		List<MemberBasic> list = createQuery.list();
		return list;
	}
	//get every day of member
		public List<MemberBasic> getEveryDayOfMember(String dateStart,String dateEnd){
			String hql = "From MemberBasic Where REGISTTIME Between?0 and?1 order by memberId";
			Query<MemberBasic> createQuery = getSession().createQuery(hql, MemberBasic.class);
			createQuery.setParameter(0, dateStart);
			createQuery.setParameter(1, dateEnd);
			List<MemberBasic> list = createQuery.list();
			return list;
		}
	//delete MGR
	public boolean deleteMGR(Integer memberId) {
		MemberBasic memberBasic = getSession().get(MemberBasic.class, memberId);
		try {
			if (null != memberBasic) {
				getSession().delete(memberBasic);
				return true;
			}
		} catch (Exception e) {
			return false;
		}
		return false;
	}
	
	
	public void logOut() {
		getSession().flush();
	}
	
}
