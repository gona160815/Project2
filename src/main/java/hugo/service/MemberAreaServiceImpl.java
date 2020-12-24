package main.java.hugo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.MemberAreaDAO;
import main.java.hugo.model.MemberArea;
@Service("memberAreaServiceImpl")
public class MemberAreaServiceImpl implements IMemberAreaService{
	@Autowired @Qualifier("memberAreaDAO")
	private MemberAreaDAO memberAreaDAO;
	@Override
	public MemberArea select(int id) {
		return memberAreaDAO.select(id);
	}
	@Override
	public MemberArea insert(MemberArea memberArea) {
		return memberAreaDAO.insert(memberArea);
	}


}
