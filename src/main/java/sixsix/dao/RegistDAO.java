package main.java.sixsix.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Component;

import main.java.sixsix.model.Homestay;
import main.java.sixsix.model.Hotel_Order;
import main.java.sixsix.model.Hotel_type;


public interface RegistDAO {
	public void mathPageNum(String pla, String add);
	public List<Homestay> selectSomething(String pla, String add, int nowpage) throws SQLException;
	public Homestay changeSomething(String change) throws SQLException;
	public void updataData(Homestay upt);
	public void insertData(Homestay insertHome);
	public boolean deleteData(String del);
	public int[][] selectYearMonth();
	public Homestay selectOneData(String houseid);
	public int[] processHotelnum(String houseid, List<String> days);
	public Hotel_Order processBookingHotelCheckOK(Integer memberId,String houseid,int houseType,int daySize,String memberTotalDays) throws Exception;
	public List<Hotel_Order> searchMemberTotalOrder(Integer memberId);
	public Hotel_Order searchHotelOrder(String orderid);
	public Hotel_type searchHotelType(String hoteltypeId);
	public String processPayMoney(String money,String housename, String orderid);
	public ArrayList<Integer> countEveryMonthDollar();
	public ArrayList<Integer> countEveryMonthNum();
	public void processBokkingHotelRandom(Integer memberId) throws ParseException;
	public Integer countOrder();
	public Integer countCommentNum(String houseid);
	public List<Hotel_Order> countComment(String houseid);
	public double countStarNum(String houseid);
	public Integer searchMemberNowHotelOrder(Integer memberId,String houseid);
	public List<String> searchMemberChangeHotelOrder(Integer memberId,String houseid);
	public List<Hotel_Order> searchMemberSubmit1HotelOrderComment(Integer memberId,String houseid,String star,String commentt);
	public List<Integer> countEveryPlaceHotelNum();
	public List<Integer> countAreaEveryPlaceHotelNum();
	public List<Integer> countEveryHouseTypeNum(String houseid);
}
