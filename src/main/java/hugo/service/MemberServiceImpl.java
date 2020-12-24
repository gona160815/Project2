package main.java.hugo.service;

import java.util.List;

import org.hibernate.Session;

import main.java.hugo.dao.MemberDAO;
import main.java.hugo.model.Member;

public class MemberServiceImpl implements IMemberService{
	
	private MemberDAO memberDAO; 
	
	public	MemberServiceImpl(Session session) {
		memberDAO = new MemberDAO(session);
	}
	
	@Override
	public Member insert(Member member) {
		return memberDAO.insert(member);	
	}
	
	@Override
	public Member select(int id) {
		return memberDAO.select(id);
	}

	@Override
	public Member queryone(String email) {
		return memberDAO.queryone(email);
	}

	@Override
	public Member update(Member member) {
		return memberDAO.update(member);
	}

	@Override
	public int countAll() {
		return memberDAO.countAll();
	}

	@Override
	public int countArea(String area) {
		return memberDAO.countArea(area);
	}

	@Override
	public List<Member> selectArea(String area) {
		return memberDAO.selectArea(area);
	}

	@Override
	public boolean deleteMember(int memberid) {
		return memberDAO.deleteMember(memberid);
	}
	
	
	
}
