package main.java.hugo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.FavorDAO;
import main.java.hugo.model.Favor;

@Service("favorServiceImpl")
public class FavorServiceImpl implements IFavorService {
	@Autowired
	@Qualifier("favorDAO")
	private FavorDAO favorDAO;

	@Override
	public Favor select(int id) {
		return favorDAO.select(id);
	}

}
