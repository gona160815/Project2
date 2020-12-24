package main.java.xxx30514.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("restService")
public class RestServie {
	@Autowired
	private RestareaDAO rDao;
	public RestServie(RestareaDAO rDao) {
		this.rDao=rDao;
	}
	
	//pages
	public int getPageNo() {
		return rDao.getPageNo();
	}
	
	public void setPageNo(int pageNo) {
		rDao.setPageNo(pageNo);
	}
	
	public long getRecordCounts() {
		return rDao.getRecordCounts();
	}
	public long getSearchRecordCounts(String s,String s1) {
		return rDao.getSearchRecordCounts(s, s1);
	}
	public int getTotalPages() {
		return rDao.getTotalPages();
	}
	public int getSearchTotalPages(String s,String s1) {
		return rDao.getSearchTotalPages(s, s1);
	}
	public int getRecordsPerPage() {
		return rDao.getRecordsPerPage();
	}
	
	public void setRecordsPerPage(int recordsPerPage) {
		rDao.setRecordsPerPage(recordsPerPage);
	}
	
	//CRUD
	public List<RestArea> selectRestArea(String s,String s1 ){
		return rDao.selectRestArea(s, s1);
	}
	public boolean deleteRestArea(Integer reID) {
		return rDao.deleteRestArea(reID);
	}
	public RestArea insertRestArea(RestArea bean) {
		return rDao.insertRestArea(bean);
	}
	public RestArea updateRestArea(Integer id, String name, String address, String tel, String city, String town) {
		return rDao.updateRestArea(id, name, address, tel, city, town);
	}

	public List<RestArea> selectAllRestAreas(){
		return rDao.selectAllRestAreas();
	}
	public List<RestArea>  detailRestAreas(Integer reID){
		return rDao.detailRestAreas(reID);
	}
	
	public RestArea select(Integer id) {
			return rDao.select(id);
	}
}
