package main.java.hugo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.MemberAdvancedDAO;
import main.java.hugo.model.MemberAdvanced;
@Service("memberAdvancedServiceImpl")
public class MemberAdvancedServiceImpl implements IMemberAdvancedService{
	@Autowired @Qualifier("memberAdvancedDAO")
	MemberAdvancedDAO memberAdvancedDAO;

//	public MemberAdvancedServiceImpl(Session session) {
//		memberAdvancedDAO = new MemberAdvancedDAO(session);
//	}
	@Override
	public MemberAdvanced select(int id) {
		return memberAdvancedDAO.select(id);
	}

	@Override
	public MemberAdvanced insert(MemberAdvanced memberAdvanced) {
		return memberAdvancedDAO.insert(memberAdvanced);
	}

	@Override
	public void update(MemberAdvanced memberAdvanced) {
		memberAdvancedDAO.update(memberAdvanced);
	}

	@Override
	public List<MemberAdvanced> selectAll() {
		return memberAdvancedDAO.selectAll();
	}
}
