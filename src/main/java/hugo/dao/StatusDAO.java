package main.java.hugo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.hugo.model.Status;
@Repository("statusDAO")
public class StatusDAO {
	
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
		
	}
	
	public Status select(int id) {
		Status result = getSession().get(Status.class, id);
		return result;
	}

}
