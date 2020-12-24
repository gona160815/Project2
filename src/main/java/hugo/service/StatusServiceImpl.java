package main.java.hugo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.StatusDAO;
import main.java.hugo.model.Status;
@Service("statusServiceImpl")
public class StatusServiceImpl implements IStatusService {
	@Autowired @Qualifier("statusDAO")
	private StatusDAO statusDAO;
	
	@Override
	public Status select(int id) {
		return statusDAO.select(id);
	}

}
