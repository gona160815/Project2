package main.java.gona.service;

import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.java.gona.dao.RentalBikeDao;
import main.java.gona.model.RbStock;
import main.java.gona.model.RbType;
import main.java.gona.model.RentalBike;
import main.java.gona.model.SimpleBike;
import main.java.gona.model.Store;


@Service
public class RentalBikeService {
	 
	@Autowired
	private RentalBikeDao rentalBikeDao;
	
	public List<RentalBike> getAllBikes(){
		return rentalBikeDao.getAllBikes();
	}
	
//========腳踏車種類清單===========
	
	public List<RbType> getAllType(){
		return rentalBikeDao.getAllType();
	}
		
//========腳踏車CRUD===============
	
	public RentalBike selectBike(String rbId) {
		return rentalBikeDao.selectBike(rbId);
	}
	
	public RentalBike insertBike(RentalBike bike) {
		return rentalBikeDao.insertBike(bike);
	}

	public boolean deleteBike(String rbId) {
		return rentalBikeDao.deleteBike(rbId);
	}
	
	public void updateBike(RentalBike bike) {
		rentalBikeDao.updateBike(bike);
	}
//======簡單腳踏車CRUD=========================
	
	public SimpleBike selectSimBike(String simRbId) {
		return rentalBikeDao.selectSimBike(simRbId);
	}
		
	public SimpleBike insertSimBike(SimpleBike simpleBike) {
		return rentalBikeDao.insertSimBike(simpleBike);
	}
		
	public boolean deleteSimBike(String simRbId) {
		return rentalBikeDao.deleteSimBike(simRbId);
	}
		
	public void updateSimBike(SimpleBike simpleBike) {
		rentalBikeDao.updateSimBike(simpleBike);
	}
		
//========腳踏車種類CRUD============
	
	public RbType selectType(String typeId) {
		return rentalBikeDao.selectType(typeId);
	}
	
	public RbType insertType(RbType type) {
		return rentalBikeDao.insertType(type);
	}
	
	public boolean deleteType(String typeId) {
		return rentalBikeDao.deleteType(typeId);
	}
	
	public void updateType(RbType type) {
		rentalBikeDao.updateType(type);
	}
//======查詢在某種類底下的所有腳踏車===========
	
	public List<RentalBike> getAllBikeByType(String typeId){
		return rentalBikeDao.getAllBikeByType(typeId);
	}

	public List<RentalBike> getAllBikeByTypeDis(){
		return rentalBikeDao.getAllBikeByTypeDis();
	}
	
//======查詢在某種腳踏車下的所有尺寸==============
	
	public List<RentalBike> getAllBikeSize(String simRbId){
		return rentalBikeDao.getAllBikeSize(simRbId);
	}	

//======把圖片撈出來============================

	public byte[] blobToBytes(Blob blob) {
		return rentalBikeDao.blobToBytes(blob);
	}

//=====查詢簡單腳踏車清單(不包含SIZE)============================
	
	 public List<SimpleBike> getSimpleBikeByType(String typeId){
		 return rentalBikeDao.getSimpleBikeByType(typeId);
	 }

//===建立所有腳踏車種類的下拉式選單=========================================
		 
	 public String getRbTypeSelect() {
		 return rentalBikeDao.getRbTypeSelect();
	}
	 
//===判斷哪些店家擁有該腳踏車=================================================
	 
	 public List<Store> getStoreByBike(String simRbId){
		 return rentalBikeDao.getStoreByBike(simRbId);
	 }
	 
//===用RBID撈庫存========================================================
	 
	 public Integer rbStockInt(String rbId,String storeId,String bgDateStr, String edDateStr) {
		 return rentalBikeDao.rbStockInt(rbId,storeId,bgDateStr,edDateStr);		 
	}

}