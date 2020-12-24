package main.java.sixsix.dao;

import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.java.sixsix.model.Homestay;
import main.java.sixsix.model.Hotel_Order;
import main.java.sixsix.model.Hotel_type;

@Service
public class RegistServiceimpt implements RegistDAO{

	@Autowired
	private RegistDAOimpt DAO;
	
	@Override
	public void mathPageNum(String pla, String add) {
		DAO.mathPageNum(pla, add);
	}


	@Override
	public List<Homestay> selectSomething(String pla, String add, int nowpage) throws SQLException {
		return DAO.selectSomething(pla, add, nowpage);
	}


	@Override
	public Homestay changeSomething(String change) throws SQLException {
		return DAO.changeSomething(change);
	}


	@Override
	public void updataData(Homestay upt) {
		DAO.updataData(upt);
	}


	@Override
	public void insertData(Homestay insertHome) {
		DAO.insertData(insertHome);
	}


	@Override
	public boolean deleteData(String del) {
		return DAO.deleteData(del);
	}
	
	@Override
	public int[][] selectYearMonth(){
		return DAO.selectYearMonth();
	}
	
	@Override
	public Homestay selectOneData(String houseid) {	
		return DAO.selectOneData(houseid);
	}
	
	@Override
	public int[] processHotelnum(String houseid,List<String> days) {
		return DAO.processHotelnum(houseid, days);
	}
	
	@Override
	public Hotel_Order processBookingHotelCheckOK(Integer memberId,String houseid,int houseType,int daySize,String memberTotalDays) throws Exception{
		return DAO.processBookingHotelCheckOK(memberId,houseid,houseType,daySize,memberTotalDays);

	}
	
	@Override
	public List<Hotel_Order> searchMemberTotalOrder(Integer memberId){
		return DAO.searchMemberTotalOrder(memberId);
	}
	
	@Override
	public Hotel_Order searchHotelOrder(String orderid) {
		return DAO.searchHotelOrder(orderid);
	}
	
	@Override
	public Hotel_type searchHotelType(String hoteltypeId) {
		return DAO.searchHotelType(hoteltypeId);
	}
	
	@Override
	public String processPayMoney(String money,String housename, String orderid) {
		return DAO.processPayMoney(money,housename,orderid);
	}
	
	@Override
	public ArrayList<Integer> countEveryMonthDollar() {
		return DAO.countEveryMonthDollar();
	}
	
	@Override
	public ArrayList<Integer> countEveryMonthNum(){
		return DAO.countEveryMonthNum();
	}
	
	@Override
	public void processBokkingHotelRandom(Integer memberId) throws ParseException{
		DAO.processBokkingHotelRandom(memberId);
		
	}
	
	@Override
	public Integer countOrder() {
		return DAO.countOrder();
	}
	
	@Override
	public Integer countCommentNum(String houseid) {
		return DAO.countCommentNum(houseid);
	}
	
	@Override
	public List<Hotel_Order> countComment(String houseid){
		return DAO.countComment(houseid);
	}
	
	@Override
	public double countStarNum(String houseid) {
		return DAO.countStarNum(houseid);
	}
	
	@Override
	public Integer searchMemberNowHotelOrder(Integer memberId,String houseid) {
		return DAO.searchMemberNowHotelOrder(memberId, houseid);
	}
	
	@Override
	public List<String> searchMemberChangeHotelOrder(Integer memberId,String houseid){
		return DAO.searchMemberChangeHotelOrder(memberId, houseid);
	}
	
	@Override
	public List<Hotel_Order> searchMemberSubmit1HotelOrderComment(Integer memberId,String houseid,String star,String commentt){
		return DAO.searchMemberSubmit1HotelOrderComment(memberId, houseid, star, commentt);
	}
	
	@Override
	public List<Integer> countEveryPlaceHotelNum(){
		return DAO.countEveryPlaceHotelNum();
	}
	
	@Override
	public List<Integer> countAreaEveryPlaceHotelNum(){
		return DAO.countAreaEveryPlaceHotelNum();
	}
	
	@Override
	public List<Integer> countEveryHouseTypeNum(String houseid){
		return DAO.countEveryHouseTypeNum(houseid);
	}
}
