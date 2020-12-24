package main.java.hugo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.hugo.model.MemberLevel;
@Repository("memberLevelDAO")
public class MemberLevelDAO {
	
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
		
	}
	public MemberLevel select(int id) {
		MemberLevel memberLevel = getSession().get(MemberLevel.class, id);
		return memberLevel;
	}

}
