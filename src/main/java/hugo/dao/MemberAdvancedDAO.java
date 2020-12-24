package main.java.hugo.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.hugo.model.MemberAdvanced;
import main.java.hugo.model.MemberBasic;
@Repository("memberAdvancedDAO")
public class MemberAdvancedDAO {

	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	

	public Session getSession() {
		return sessionFactory.getCurrentSession();
		
	}

	public MemberAdvanced select(int id) {
		MemberAdvanced result = getSession().get(MemberAdvanced.class, id);
		return result;
	}

	public MemberAdvanced insert(MemberAdvanced memberAdvanced) {
		getSession().save(memberAdvanced);
		return memberAdvanced;
	}
	
	public void update(MemberAdvanced memberAdvanced) {
		getSession().update(memberAdvanced);
	}
	
	public List<MemberAdvanced> selectAll(){
		String hql = "From MemberAdvanced order by memberId";
		Query<MemberAdvanced> createQuery = getSession().createQuery(hql, MemberAdvanced.class);
		List<MemberAdvanced> list = createQuery.list();
		return list;
	}
}
