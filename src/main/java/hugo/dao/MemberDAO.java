package main.java.hugo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;

import main.java.hugo.model.Member;

public class MemberDAO {

	private Session session;

	public MemberDAO(Session session) {
		this.session = session;
	}

	// 新增
	public Member insert(Member member) {
//		Member result = session.get(Member.class, member.getId());// 檢查是否有重複資料
//		System.out.println(member.getId());
//		if (result == null) {
			session.save(member);
			System.out.println("新增完成");
			return member;
//		}
//		return null;
	}

	// 查單筆(PK)
	public Member select(int id) {
		return session.get(Member.class, id);
	}

	// 茶單筆(自訂條件)
	public Member queryone(String email) {
		String hql = "from Member where email =?0";
		Query<Member> query = session.createQuery(hql, Member.class);
		query.setParameter(0, email);
		Member member = query.uniqueResult();
		return member;
	}

	// 更新
	public Member update(Member member) {
		Member result = session.get(Member.class, member.getId());
		if (result != null) {
			result.setArea(member.getArea());
			result.setFavor(member.getFavor());
			result.setName(member.getName());
			result.setPassword(member.getPassword());
			result.setTel(member.getTel());
		}
		return null;
	}

	// 查全部資料筆數
	public int countAll() {
		String hql = "select count(*) from Member";
		Query<Number> createQuery = session.createQuery(hql, Number.class);
		int num = (int) createQuery.uniqueResult().intValue();
		return num;
	}

	// 查地区資料筆數
	public int countArea(String area) {
		String hql = "select count(*) from Member where area=?0";
		Query<Number> createQuery = session.createQuery(hql, Number.class);
		createQuery.setParameter(0, area);
		int num = (int) createQuery.uniqueResult().intValue();
		return num;
	}

	// 查地区資料
	public List<Member> selectArea(String area) {
		String hql = "From Member where AREA=?0";
		Query<Member> createQuery = session.createQuery(hql, Member.class);
		createQuery.setParameter(0, area);
		List<Member> list = createQuery.list();
		return list;
	}

	// 删会员
	public boolean deleteMember(int memberid) {
		Member result = session.get(Member.class, memberid);
		if (result != null) {
			session.delete(result);
			return true;
		}
		return false;
	}
}
