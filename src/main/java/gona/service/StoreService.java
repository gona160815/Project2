package main.java.gona.service;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.java.gona.dao.StoreDao;
import main.java.gona.model.Area;
import main.java.gona.model.RbStock;
import main.java.gona.model.RbType;
import main.java.gona.model.RentalBike;
import main.java.gona.model.Store;

@Service
public class StoreService {

	@Autowired //自動搜尋方法
	private StoreDao storeDao;
	
	public int getPageNo() {
		return storeDao.getPageNo();
	}
	
	public void setPageNo(int pageNo) {
		storeDao.setPageNo(pageNo);
	}
	
	public long getRecordCounts() {
		return storeDao.getRecordCounts();
	}
	
	public int getTotalPages() {
		return storeDao.getTotalPages();
	}
	
	public int getRecordsPerPage() {
		return storeDao.getRecordsPerPage();
	}
	
	public void setRecordsPerPage(int recordsPerPage) {
		storeDao.setRecordsPerPage(recordsPerPage);
	}
	
	public List<Store> getPageStores() {
		return storeDao.getPageStores();
	}
	
	public List<Area> getArea() {
		return storeDao.getArea();
	}
	
	public void setTagName(String tagName) {
		storeDao.setTagName(tagName);
	}
	
	public String getTagName() {
		return storeDao.getTagName();
	}
	
	public String getAreaSelect() {
		return storeDao.getAreaSelect();
	}

	public  Store selectOne(String store_id) {			
		return storeDao.selectOne(store_id);
	}
	
	public Store add(Store storeBean) {
		return storeDao.add(storeBean);
	}
	
	public  boolean delete(String store_id) {
		return storeDao.delete(store_id);
	}
	
	public Store update(String store_id,Store storeBean) {
		return storeDao.update(store_id,storeBean);
	}
	
	public List<Store> selectByArea(int st_area,String st_address){
		return storeDao.selectByArea(st_area,st_address);
	}
	
//篩選特定門市的庫存-----
	
	public List<RbStock> selectStockByStore(String store_id){
		return storeDao.selectStockByStore(store_id);
	}
	
//腳踏車庫存CRUD---------
	
	public RbStock selectRbStock(String rbStockId) {
		return storeDao.selectRbStock(rbStockId);
	}
		
	public RbStock insertRbStock(RbStock rbStock) {
		return storeDao.insertRbStock(rbStock);
	}
		
	public boolean deleteRbStock(String rbStockId) {
		return storeDao.deleteRbStock(rbStockId);
	}
		
	public void updateRbStock(RbStock rbStock) {
		storeDao.updateRbStock(rbStock);
	}

//得到所有店家---------------------------
	
	public List<Store> getAllStore(){
		return storeDao.getAllStore();
	}
		
//建立所有店家的下拉式選單---------------
		
	 public String getAllStoreSelect() { 	 
	 	return storeDao.getAllStoreSelect();
	}
//從店家搜尋腳踏車(含尺寸)-----------------------
	 
	 public List<RentalBike> getBikeByStore(String storeId){
		 return storeDao.getBikeByStore(storeId);		
	 } 
	 
//用areaId找到地區-------------------------------------------
	 
	 public Area selectAreaById(int areaId){
		 return storeDao.selectAreaById(areaId);		
	 } 

//從店家搜尋腳踏車(不含尺寸，用TYPE分類)---------------
	 public List<RbType> getTypeByStore(String storeId){
		 return storeDao.getTypeByStore(storeId);	 
	 }


}
