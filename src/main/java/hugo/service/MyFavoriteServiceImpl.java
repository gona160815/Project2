package main.java.hugo.service;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import main.java.hugo.dao.MyFavoriteDAO;
import main.java.hugo.model.MyFavorite;
@Service("myFavoriteImpl")
public class MyFavoriteServiceImpl implements IMyFavoriteService {
	
	
	@Autowired @Qualifier("myFavoriteDAO")
	private MyFavoriteDAO myFavoriteDAO; 
	
	@Override
	public MyFavorite selectByInfoId(Integer memberId,Integer typeId,String infoId) {
		return myFavoriteDAO.selectByInfoId(memberId,typeId, infoId);
	}
	
	@Override
	public Boolean insert(MyFavorite myFavorite) {
		return myFavoriteDAO.insert(myFavorite);
	}

	@Override
	public Boolean delete(Integer memberId,Integer typeId,String infoId) {
		return myFavoriteDAO.delete(memberId,typeId,infoId);
	}

	@Override
	public List<MyFavorite> selectByAddTime(Integer memberId) {
		return myFavoriteDAO.selectByAddTime(memberId);
	}

	@Override
	public List<MyFavorite> selectByType(Integer memberId) {
		return myFavoriteDAO.selectByType(memberId);
	}

	@Override
	public Boolean checkFavorite(Integer memberId, Integer typeId, String infoId) {
		return myFavoriteDAO.checkFavorite(memberId, typeId, infoId);
	}

	@Override
	public Integer countFavorate(Integer typeId, String infoId) {
		return myFavoriteDAO.countFavorate(typeId, infoId);
	}

	@Override
	public List<MyFavorite> selectByAddTimeASC(Integer memberId) {
		return myFavoriteDAO.selectByAddTimeASC(memberId);
	}
	
	
}
