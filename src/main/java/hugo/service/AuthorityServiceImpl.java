package main.java.hugo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.AuthorityDAO;
import main.java.hugo.dao.IAuthorityService;
import main.java.hugo.model.Authority;
@Service("authorityServiceImpl")
public class AuthorityServiceImpl implements IAuthorityService{
	
	@Autowired @Qualifier("authorityDAO")
	private AuthorityDAO authorityDAO;

	@Override
	public Authority select(int id) {
		return authorityDAO.select(id);
	} 
	
	
}
