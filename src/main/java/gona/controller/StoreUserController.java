package main.java.gona.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.gona.model.RbType;
import main.java.gona.model.RentalBike;
import main.java.gona.model.Store;
import main.java.gona.service.StoreService;
import main.java.hugo.test.Test;

@Controller
@SessionAttributes({"loginOK","ShoppingCart"})
public class StoreUserController {
	
	@Autowired
	StoreService service;
	
	@GetMapping(path="/test")
	public String Test() {
		return "rental/bikeOrderDetail";
	}
	
	@RequestMapping(path = "/bikeStorePre.controller", method = RequestMethod.GET)
	public String storeMgrPre(@RequestParam(name = "pageNo") String pageNoStr, Model m) {

		int pageNo = 1;
		if (pageNoStr == null) {
			pageNo = 1;
		} else {
			try {
				pageNo = Integer.parseInt(pageNoStr.trim());
			} catch (NumberFormatException e) {
				pageNo = 1;
			}
		}
		
		service.setPageNo(pageNo); //獲得當前頁面(預設1)
		List<Store> sList = service.getPageStores(); //用List裝一頁的店家物件
		service.setTagName("areaID"); //處理地區標籤
		String areaTag = service.getAreaSelect(); //將地區標籤弄成選單
		
		m.addAttribute("pageNo",String.valueOf(pageNo));
		m.addAttribute("totalPages",service.getTotalPages());
		m.addAttribute("SelectAreaSelect", areaTag);
		m.addAttribute("stores_DPP",sList);

		return "rental/bikeStore";
	}
	
	@GetMapping(path = "/bikeStoreSelect.controller")
	public String bikeStoreSelect(@RequestParam(name = "pageNo") String pageNoStr, 
			@RequestParam(name="area") String strAreaId,@RequestParam(name="areaAdd") String areaAdd,Model m) {
		
		int pageNo = 1;
			if (pageNoStr == null) {
				pageNo = 1;
			} else {
				try {
					pageNo = Integer.parseInt(pageNoStr.trim());
				} catch (NumberFormatException e) {
					pageNo = 1;
				}
			}
	
			service.setPageNo(pageNo); // 獲得當前頁面(預設1)

			int areaId = 0;
			areaId = Integer.parseInt(strAreaId);			
			String address = null;
			address = areaAdd;
			
			List<Store> sList = service.getPageStores(); // 用List裝一頁的店家物件
			sList=service.selectByArea(areaId,address);
			System.out.println("搜尋數字"+areaId);
			System.out.println("搜尋字串"+address);
			
			service.setTagName("areaID"); // 處理地區標籤
			String areaTag = service.getAreaSelect(); // 將地區標籤弄成選單

			m.addAttribute("pageNo", String.valueOf(pageNo));
			m.addAttribute("totalPages", service.getTotalPages());
			m.addAttribute("SelectAreaSelect", areaTag);
			m.addAttribute("stores_DPP", sList);
			
			return "rental/bikeStore";

	}
	
	
	//查詢某家店底下有哪些庫存(含尺寸)
	@GetMapping(path = "/bikeByStore")
	public String bikeByStore(Model m, @RequestParam(name = "storeId") String storeId) {
		List<RbType> bikes = service.getTypeByStore(storeId);
		Store store = service.selectOne(storeId);
		m.addAttribute("bikeBean",bikes);
		m.addAttribute("store",store);
		return "rental/bikeByStore";
	}
	
	//傳送店家資料到詳細畫面
	@GetMapping(value="/storeDetail")
	public ModelAndView storeDetail(@RequestParam(name = "storeId") String storeId) {
		Store store = service.selectOne(storeId);
		return new ModelAndView("rental/storeDetail","store",store);
	}
	
	
	
	

}
