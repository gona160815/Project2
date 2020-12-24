package main.java.hugo.service;

import static org.hamcrest.CoreMatchers.nullValue;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.MemberAuthDAO;
import main.java.hugo.model.MemberAuth;
@Service("memberAuthServiceImpl")
public class MemberAuthServiceImpl implements IMemberAuthService{
	@Autowired @Qualifier("memberAuthDAO")
	private MemberAuthDAO memberAuthDAO;
	
//	public MemberAuthServiceImpl(Session session) {
//		memberAuthDAO = new MemberAuthDAO(session);
//	}
	
	@Override
	public MemberAuth insert(MemberAuth memberAuth) {
		return memberAuthDAO.insert(memberAuth);
	}

	@Override
	public MemberAuth updateStatus(int id, int stausId) {
		return memberAuthDAO.updateStatus(id,stausId);
	}

	@Override
	public MemberAuth select(int id) {
		return memberAuthDAO.select(id);
	}

	@Override
	public boolean delete(int id) {
		return memberAuthDAO.delete(id);
	}

}
