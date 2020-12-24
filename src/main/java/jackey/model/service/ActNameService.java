package main.java.jackey.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.java.jackey.model.ActName;
import main.java.jackey.model.dao.ActNameDao;

@Service
public class ActNameService {
	@Autowired
	ActNameDao actNameDao;
	
	public List<ActName> selectAll(){
		return actNameDao.selectAll();
	}
	
	public List<ActName> selectByMember(Integer memberId) {
		return actNameDao.selectByMember(memberId);
	}

	public ActName selectActNameById(Integer actNameId) {
		return actNameDao.selectActNameById(actNameId);
	}

	public ActName selectActNameByName(Integer memberId, String name) {
		return actNameDao.selectActNameByName(memberId, name);
	}

	public ActName insert(ActName actName) {
		return actNameDao.insert(actName);
	}

	public Boolean delete(Integer actNameId) {
		return actNameDao.delete(actNameId);
	}

	public void update(ActName actName) {
		actNameDao.update(actName);
	}

	public String payOrder(String actNameId, String orderTime, String price, String name) {
		return actNameDao.payOrder(actNameId, orderTime, price, name);
	}

	public String getQuery() {
		return actNameDao.getQuery();
	}

	public void setQuery(String query) {
		actNameDao.setQuery(query);
	}

	public Integer getPageNo() {
		return actNameDao.getPageNo();
	}

	public void setPageNo(Integer pageNo) {
		actNameDao.setPageNo(pageNo);
	}

	public Long getRecordCounts() {
		return actNameDao.getRecordCounts();
	}

	public Integer getTotalPages() {
		return actNameDao.getTotalPages();
	}

	public void setTotalPages(Integer totalPages) {
		actNameDao.setTotalPages(totalPages);
	}

	public Integer getRecordsPerPage() {
		return actNameDao.getRecordsPerPage();
	}

	public void setRecordsPerPage(Integer recordsPerPage) {
		actNameDao.setRecordsPerPage(recordsPerPage);
	}

	public List<ActName> getPage() {
		return actNameDao.getPage();
	}

	public ArrayList<Integer> getPageNumbers() {
		return actNameDao.getPageNumbers();
	}

	public List<ActName> getMgrPublishActivity() {
		return actNameDao.getMgrPublishActivity();
	}

	public Map<String, Object> countRevenue() {
		return actNameDao.countRevenue();
	}

}
