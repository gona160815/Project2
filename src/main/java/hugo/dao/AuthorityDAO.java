package main.java.hugo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.hugo.model.Authority;
@Repository("authorityDAO")
public class AuthorityDAO {
	
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
		
	}
	
	public Authority select(int id) {
		Authority authority = getSession().get(Authority.class, id);
		return authority;
	}

}
