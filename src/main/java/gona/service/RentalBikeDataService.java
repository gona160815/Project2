package main.java.gona.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import main.java.gona.dao.RentalBikeDataDao;

@Service
public class RentalBikeDataService {
	
	@Autowired
	private RentalBikeDataDao rentalBikeDataDao;
	
//==============依照地區年度銷售額=================================================

	public Map<String, ArrayList<Integer>> getAnnualSaleByArea(){
		return rentalBikeDataDao.getAnnualSaleByArea();	
	}
	
//==============各家分店年度營業額=================================================
	
	public Map<String,ArrayList> getAnnualSaleByStore(){
		return rentalBikeDataDao.getAnnualSaleByStore();
	}

//==============各車種年度銷售額==================================================
	
	public Map<String,ArrayList> getAnnualSaleByBike(){
		return rentalBikeDataDao.getAnnualSaleByBike();
	}
}
