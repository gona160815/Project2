package main.java.sixsix.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.sixsix.model.Homestay;
import main.java.sixsix.model.Homestay_Type;
import main.java.sixsix.model.Hotel_type;

@Repository
public class TryManyToMany {
	
	private SessionFactory session;
	
	public TryManyToMany() {
		
	}
	
	@Autowired
	public TryManyToMany(@Qualifier("sessionFactory")SessionFactory sessionstar) {
		this.session = sessionstar;
	}
	
	public Session getSession() {
		return session.getCurrentSession();
	}
	
	
	
	public void proccessTrytry(String homestayid , String hoteltypeid) {
		Homestay h1 = getSession().get(Homestay.class, homestayid);
		Hotel_type h2 = getSession().get(Hotel_type.class, hoteltypeid);
		
		h1.getHotel_type().add(h2);
		h2.getHomestay().add(h1);
		
		getSession().save(h1);
		
		
		
	}
	
	public void processInsertHotel() {
		
		String queryString = "from Homestay_Type";
		
		Query<Homestay_Type> query = getSession().createQuery(queryString, Homestay_Type.class);
		
		List<Homestay_Type> list = query.list();
		
		int randomNumber = 0;
		
		for(int i=0;i<list.size();i++) {
			randomNumber = (int) (Math.random() * 4) + 2;
			list.get(i).setNum(randomNumber);
			getSession().save(list.get(i));
		}
		
		
		
		
		
		System.out.println("完成新增============================================================");
	}
	
	public void processSelect() {
		
		String queryString = "from Homestay";
		
		Query<Homestay> q1 = getSession().createQuery(queryString,Homestay.class);
		
		String queryString1 = "from Hotel_type";
		
		Query<Hotel_type> q2 = getSession().createQuery(queryString1,Hotel_type.class);
		
		List<Homestay> list = q1.list();
		List<Hotel_type> list2 = q2.list();
		
		for(Homestay a:list) {
			for(Hotel_type b:list2) {
			a.getHotel_type().add(b);
			}
		}
		
		for(Hotel_type c:list2) {
			for(Homestay d:list) {
				c.getHomestay().add(d);
			}
			
		}
		
		for(Homestay a:list) {
			getSession().save(a);
		}
		
		
	}
	
	
	
}
