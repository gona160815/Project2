package main.java.hugo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.MemberLevelDAO;
import main.java.hugo.model.MemberLevel;
@Service("memberLevelServicImpl")
public class MemberLevelServicImpl implements IMemberLevelService {
	
	@Autowired @Qualifier("memberLevelDAO")
	private MemberLevelDAO memberLevelDAO; 
	
	@Override
	public MemberLevel select(int id) {
		return memberLevelDAO.select(id);
	}

}
