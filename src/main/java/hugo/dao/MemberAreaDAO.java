package main.java.hugo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.hugo.model.MemberArea;

@Repository("memberAreaDAO")
public class MemberAreaDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();

	}

	public MemberArea select(int id) {
		return getSession().get(MemberArea.class, id);
	}

	public MemberArea insert(MemberArea memberArea) {
		getSession().save(memberArea);
		return memberArea;
	}
}
