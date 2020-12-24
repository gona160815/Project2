package main.java.jackey.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import main.java.jackey.model.Event;
import main.java.jackey.model.dao.EventDao;

@Service
@Transactional
public class EventService {

	@Autowired
	private EventDao eventDao;

	public String getCategoryId() {
		return eventDao.getCategoryId();
	}

	public void setCategoryId(String categoryId) {
		eventDao.setCategoryId(categoryId);
	}

	public String getQuery() {
		return eventDao.getQuery();
	}

	public void setQuery(String query) {
		eventDao.setQuery(query);
	}

	public Integer getPageNo() {
		return eventDao.getPageNo();
	}

	public void setPageNo(Integer pageNo) {
		eventDao.setPageNo(pageNo);
	}

	public Long getRecordCounts() {
		return eventDao.getRecordCounts();
	}

	public Integer getTotalPages() {
		return eventDao.getTotalPages();
	}

	public void setTotalPages(Integer totalPages) {
		eventDao.setTotalPages(totalPages);
		;
	}

	public Integer getRecordsPerPage() {
		return eventDao.getRecordsPerPage();
	}

	public void setRecordsPerPage(Integer recordsPerPage) {
		this.eventDao.setRecordsPerPage(recordsPerPage);
	}

	public List<Event> getPage() {
		return eventDao.getPage();
	}

	public ArrayList<Integer> getPageNumbers() {
		return eventDao.getPageNumbers();
	}

	public Event select(Integer eventId) {
		return eventDao.select(eventId);
	}

	public List<Event> selectAll() {
		return eventDao.selectAll();
	}
	
	public List<Event> getLatestEvents(){
		return eventDao.getLatestEvents();
	}
	
	public List<Long> countEventByCategory() {
		return eventDao.countEventByCategory();
	}
	
	public Map<String,Object> countEventByLocation() {
		return eventDao.countEventByLocation();
	}
	
	
	public Event insert(Event eBean) {
		return eventDao.insert(eBean);
	}

	public Event insertData(Event eBean) {
		return eventDao.insertData(eBean);
	}

	public Boolean delete(Integer eventId) {
		return eventDao.delete(eventId);
	}
	
	public Event update(Event event) {
		return eventDao.update(event);
	}

}
