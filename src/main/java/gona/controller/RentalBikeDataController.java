package main.java.gona.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.text.html.StyleSheet.ListPainter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import main.java.gona.service.RentalBikeDataService;
import main.java.gona.service.RentalBikeOrderService;
import main.java.gona.service.RentalBikeService;
import main.java.gona.service.StoreService;

@Controller
@SessionAttributes({"loginOK","ShoppingCart"})
public class RentalBikeDataController {
	
	@Autowired
	RentalBikeService rbService;
	@Autowired
	StoreService storeService;
	@Autowired
	RentalBikeOrderService rbOrderService;
	@Autowired
	RentalBikeDataService service;
	
	//依照地區的年度月份折線圖
	@PostMapping(path= "/monthSumByArea",produces = "application/json")
	public @ResponseBody Map<String, ArrayList<Integer>> monthSumByArea(){
		Map<String, ArrayList<Integer>> map = new HashMap<>();	
		map = service.getAnnualSaleByArea();
		return map;
	}
	
	//各家分店本周營業額
	@PostMapping(path= "/annualSaleByStore",produces = "application/json")
	public @ResponseBody Map<String,ArrayList> annualSaleByStore(){
		 Map<String,ArrayList> map = new HashMap<>();
		 map = service.getAnnualSaleByStore();
		 return map;
	}
	
	//各家分店本周營業額
	@PostMapping(path= "/annualSaleByBike",produces = "application/json")
	public @ResponseBody Map<String,ArrayList> annualSaleByBike(){
		 Map<String,ArrayList> map = new HashMap<>();
		 map = service.getAnnualSaleByBike();
		 return map;
	}
	

	

}
