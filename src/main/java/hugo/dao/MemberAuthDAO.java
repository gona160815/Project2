package main.java.hugo.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import main.java.hugo.model.Authority;
import main.java.hugo.model.MemberAuth;
import main.java.hugo.model.MemberLevel;
import main.java.hugo.model.Status;

@Repository("memberAuthDAO")
public class MemberAuthDAO {
	@Autowired
	@Qualifier("sessionFactory")
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();

	}

	// insert new table
	public MemberAuth insert(MemberAuth memberAuth) {
		getSession().save(memberAuth);
		return memberAuth;
	}

	// alter statusId to 2(already checked)
	public MemberAuth updateStatus(int id, int stausId) {
		MemberAuth result = getSession().get(MemberAuth.class, id);
		if (result != null) {
			result.setStatusId(stausId);
		}
		return result;
	}

	public MemberAuth select(int id) {
		MemberAuth result = getSession().get(MemberAuth.class, id);
		return result;
	}

	public boolean delete(int id) {
		MemberAuth select = getSession().get(MemberAuth.class, id);
		if (select != null) {

			Status status = (Status) getSession().get(Status.class, 2);
			MemberLevel memberLevel = (MemberLevel) getSession().get(MemberLevel.class, 1);
			Authority authority = (Authority) getSession().get(Authority.class, 2);

			status.getMemberAuths().remove(status);
			memberLevel.getMemberAuths().remove(memberLevel);
			authority.getMemberAuths().remove(authority);
			status.setMemberAuths(null);
			memberLevel.setMemberAuths(null);
			authority.setMemberAuths(null);
			getSession().delete(select);
			return true;
		}
		return false;
	}
}
