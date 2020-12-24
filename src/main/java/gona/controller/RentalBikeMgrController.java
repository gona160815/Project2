package main.java.gona.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import main.java.gona.model.RbType;
import main.java.gona.model.RentalBike;
import main.java.gona.model.SimpleBike;
import main.java.gona.model.Store;
import main.java.gona.service.RentalBikeService;
import main.java.gona.service.StoreService;

@Controller
@SessionAttributes({"loginOK","ShoppingCart"})
public class RentalBikeMgrController {
	
	@Autowired
	RentalBikeService service;
	
	@Autowired
	StoreService storeService;
	
	//獲取所有種類清單
	@GetMapping(path="/MaintainBikePre.controller")
	public ModelAndView getAllRbType() {
		List<RbType> types = service.getAllType();
		return new ModelAndView("rental/maintainBike","type_DPP",types);
	}
	
	//從種類清單再下去挑腳踏車
	@GetMapping(path="/rentalBike")
	public ModelAndView getSimpleBikeByType(@RequestParam(name="typeId") String typeId) {
		List<SimpleBike> bikes = service.getSimpleBikeByType(typeId);
		return new ModelAndView("rental/maintainSimBike","bike_DPP",bikes);	
	}
	
	//從腳踏車再下去挑尺寸
	@GetMapping(path="/bikeSize")
	public ModelAndView getBikeSize(@RequestParam(name="simRbId") String simRbId) {
		List<RentalBike> bikes = service.getAllBikeSize(simRbId);
		return new ModelAndView("rental/maintainAllBike","bike_DPP",bikes);	
	}
	
	//更新種類
	@GetMapping(path="/updateBikePre")
	public ModelAndView getBikeTypeById(@RequestParam(name="typeId") String typeId) {
		RbType type = service.selectType(typeId);
		return new ModelAndView("rental/updateBikeType","bikeTypeBean",type);
	}
	
	// 更新種類 傳送更新成功畫面(前置)
	@PostMapping(path="/UpdateBike")
	public String bikeUpdate(@ModelAttribute(value="bikeTypeBean") RbType typeBean) {
		service.updateType(typeBean);
		return "redirect:/updateSuccess";
	}
	
	//傳送更新畫面(顯示)
	@GetMapping(path="/updateSuccess")
	public String updateSuccess() {
		return "rental/updateSuccess";
	}
	
	//更新腳踏車(不包含尺寸　前置)
	@GetMapping(path="/updateSimBikePre")
	public ModelAndView getSimBikeById(@RequestParam(name="simRbId") String simRbId) {
		SimpleBike simpleBike = service.selectSimBike(simRbId);
		return new ModelAndView("rental/updateSimBike","simBikeTypeBean",simpleBike);
	}
	
	//更新腳踏車(不包含尺寸) 
	@PostMapping(path="/UpdateSimBike")
	public String updateSimBike(@ModelAttribute(value="simBikeTypeBean") SimpleBike simBikeTypeBean) {
		service.updateSimBike(simBikeTypeBean);
		return "redirect:/updateSuccess";
	}
	
	//傳送使用者瀏覽畫面(前置)
	@GetMapping(path="/BikeTypeUser")
	public String getAllBikeData(Model model) {
		List<RbType> types = service.getAllType();
		String storeSelect = storeService.getAllStoreSelect();
		model.addAttribute("type_DPP",types);
		model.addAttribute("storeSelect",storeSelect);
		return "rental/bikeTypeUser";
	}
	
	//轉傳blob圖片
	@GetMapping(path="/getImg")
	public ResponseEntity<byte[]>  showImg(@RequestParam("typeId") String typeId)throws IOException {
		RbType rs = service.selectType(typeId);
		Blob typeImg = rs.getTypeImg();
		byte[] imageContent = service.blobToBytes(typeImg);
		HttpHeaders headers = new HttpHeaders();
		return ResponseEntity .ok().contentType(MediaType.IMAGE_JPEG).body(imageContent);		
	}
	
	//傳送腳踏車清單給Ajax(無用)
	@GetMapping(value = "/bikeByType.json",produces = "application/json")
	public @ResponseBody Map<String, Object> bikeByType(@RequestParam(name="typeId") String typeId){
			Map<String,Object> map = new HashMap<>();
			List<RentalBike> rbList = service.getAllBikeByType(typeId);
			map.put("rbList",rbList);
			return map;
	}

	//傳送門市資訊給腳踏車Ajax
	@PostMapping(value = "/bikeByStore.json",produces = "application/json")
	public @ResponseBody Map<String, Object> bikeByStore(@RequestParam(name="simRbId") String simRbId){
			Map<String,Object> map = new HashMap<>();
			List<Store> bikeStore = service.getStoreByBike(simRbId);
			map.put("sList",bikeStore);
			return map;
	}
	
	//傳送腳踏車資料Ajax
	@PostMapping(value = "/bikeBySimId.json",produces = "application/json")
	public @ResponseBody Map<String, Object> bikeBySimId(@RequestParam(name="simRbId") String simRbId){
			Map<String,Object> map = new HashMap<>();
			SimpleBike simBike = service.selectSimBike(simRbId);
			map.put("simBike",simBike);
			return map;
	}
	
	//用ID篩選庫存(Ajax)
	@PostMapping(value = "/selectStock",produces = "application/json")
	public @ResponseBody Map<String, Object> selectStock(@RequestParam(name="rbId") String rbId,@RequestParam(name="storeId") String storeId,
			@RequestParam(name="bgDate") String bgDate,@RequestParam(name="edDate") String edDate){
		Map<String,Object> map = new HashMap<>();
		Integer rbStockInt = service.rbStockInt(rbId,storeId,bgDate,edDate);
		map.put("rbStockInt",rbStockInt);
		return map;
	}
	
	

}
