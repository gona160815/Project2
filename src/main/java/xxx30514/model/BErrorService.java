package main.java.xxx30514.model;

import static org.hamcrest.CoreMatchers.nullValue;

import java.sql.Blob;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("beService")
public class BErrorService {
	@Autowired
	private BikeErrorDAO beDao;

	public BErrorService(BikeErrorDAO beDao) {
		this.beDao = beDao;
	}

	// pages
	public int getPageNo() {
		return beDao.getPageNo();
	}

	public void setPageNo(int pageNo) {
		beDao.setPageNo(pageNo);
	}

	public long getRecordCounts() {
		return beDao.getRecordCounts();
	}

	public long getSearchRecordCounts(String statu,String s) {
		return beDao.getSearchRecordCounts(statu,s);
	}

	public int getTotalPages() {
		return beDao.getTotalPages();
	}

	public int getSearchTotalPages(String status,String s) {
		return beDao.getSearchTotalPages(status,s);
	}
	public int getStatusTotalPages(String status) {
		return beDao.getStatusSearchTotalPages(status);
	}

	public int getRecordsPerPage() {
		return beDao.getRecordsPerPage();
	}

	public void setRecordsPerPage(int recordsPerPage) {
		beDao.setRecordsPerPage(recordsPerPage);
	}

	// CRUD
//	public List<BikeError> selectRestArea(String s, String s1) {
//		return rDao.selectRestArea(s, s1);
//	}
	public List<BikeError> selectByMemberID(Integer memberID){
		return beDao.selectByMemberID(memberID);
	}
	public boolean deleteBikeError(Integer beID) {
		return beDao.deleteBikeError(beID);
	}

	public BikeError insertBikeError(BikeError bean) {
		return beDao.insertBikeError(bean);
	}

	public BikeError updateBikeError(Integer id, String title, String tag, String description, String status, Integer memberid,String reply,LocalDateTime endtime) {
		return beDao.updateBikeError(id, title, tag, description, memberid, status,reply,endtime);
	}

	public List<BikeError> selectAllBikeError() {
		return beDao.selectAllBikeErrors();
	}
	public List<BikeError> selectAllBikeErrorBase64() {
		 List<BikeError> list = beDao.selectAllBikeErrors();
		 List<BikeError> newlist = new ArrayList<BikeError>();
		 for (int i = 0; i <list.size(); i++) {
			Blob picture = list.get(i).getPicture();
			String base64String=null;
			if (picture!=null) {
				try {
					byte[] bytes = picture.getBytes(1, (int)picture.length());
					base64String = Base64.getEncoder().encodeToString(bytes);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
			}
			list.get(i).setPicString(base64String);
			newlist.add(list.get(i));
		}
		 return newlist;
	}
	public List<BikeError> selectMemberBikeErrorBase64(Integer memberId) {
		 List<BikeError> list = beDao.selectByMemberID(memberId);
		 List<BikeError> newlist = new ArrayList<BikeError>();
		 for (int i = 0; i <list.size(); i++) {
			Blob picture = list.get(i).getPicture();
			String base64String=null;
			if (picture!=null) {
				try {
					byte[] bytes = picture.getBytes(1, (int)picture.length());
					base64String = Base64.getEncoder().encodeToString(bytes);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
			}
			list.get(i).setPicString(base64String);
			newlist.add(list.get(i));
			System.out.println(base64String);
		}
		 return newlist;
	}
	public List<BikeError> selectBikeErrors(String status,String keyWord){
		return beDao.selectBikeErrors(status,keyWord);
	}
	public List<BikeError> selectBikeErrorStatus(String status){
		return beDao.selectBikeErrorStatus(status);
	}
//	public List<RestArea> detailRestAreas(Integer reID) {
//		return rDao.detailRestAreas(reID);
//	}
}
