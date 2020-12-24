package main.java.hugo.service;

import java.util.List;

import main.java.hugo.model.MyFavorite;

public interface IMyFavoriteService {
	public MyFavorite selectByInfoId(Integer memberId,Integer typeId,String infoId);
	public Boolean insert(MyFavorite myFavorite);
	public Boolean delete(Integer memberId,Integer typeId,String infoId);
	public List<MyFavorite> selectByAddTime(Integer memberId);
	public List<MyFavorite> selectByType(Integer memberId);
	public Boolean checkFavorite(Integer memberId, Integer typeId, String infoId);
	public Integer countFavorate(Integer typeId,String infoId);
	public List<MyFavorite> selectByAddTimeASC(Integer memberId);
}
