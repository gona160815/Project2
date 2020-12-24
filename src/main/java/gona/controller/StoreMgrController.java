package main.java.gona.controller;

import static org.hamcrest.CoreMatchers.nullValue;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.lang.invoke.StringConcatFactory;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.io.FilenameUtils;
import org.apache.jasper.tagplugins.jstl.core.If;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import main.java.gona.dao.StoreDao;
import main.java.gona.model.Area;
import main.java.gona.model.RbSize;
import main.java.gona.model.RbStock;
import main.java.gona.model.RentalBike;
import main.java.gona.model.SimpleBike;
import main.java.gona.model.Store;
import main.java.gona.service.RentalBikeService;
import main.java.gona.service.StoreService;
import main.java.sixsix.model.Homestay;

@Controller
@SessionAttributes({"loginOK","ShoppingCart"})
public class StoreMgrController {

	@Autowired
	StoreService service;
	@Autowired 
	RentalBikeService rbService;

	@RequestMapping(path = "/maintainStorePre.controller", method = RequestMethod.GET)
	public String storeMgrPre(Model m) {

		List<Store> sList = service.getAllStore(); // 用List裝一頁的店家物件		
		m.addAttribute("stores_DPP", sList);
		return "rental/maintainStore";
	}

	@RequestMapping(path = "/storePreInsert", method = RequestMethod.GET)
	public String storePreInsert(Model m) {

		service.setTagName("areaID"); // 處理地區標籤
		String areaTag = service.getAreaSelect(); // 將地區標籤弄成選單

		m.addAttribute("SelectAreaSelect", areaTag);// 處理地區標籤

		return "rental/insertStore";
	}

	@RequestMapping(path = "/storePreUpdate", method = RequestMethod.GET)
	public String storePreUpdate(@RequestParam(name="storeID") String storeId,Model m) {
				
		Store upBean = service.selectOne(storeId);
		m.addAttribute("upBean", upBean);

		service.setTagName("areaID"); // 處理地區標籤
		String areaTag = service.getAreaSelect(); // 將地區標籤弄成選單

		m.addAttribute("SelectAreaSelect", areaTag);// 處理地區標籤

		return "rental/updateStore";
	}
	
	@RequestMapping(path="/storeInsert.controller", method = RequestMethod.POST)
	public String storeInsert(@RequestParam(name="sname") String sname,
			@RequestParam(name="pic1") MultipartFile pic1,@RequestParam(name="sadd") String sadd,
			@RequestParam(name="area") String area,@RequestParam(name="semail") String semail,
			@RequestParam(name="stel") String stel,@RequestParam(name="bgTime") String bgTime,
			@RequestParam(name="edTime") String edTime,@RequestParam(name="ckholiday") String[] ckholiday,
			Model m) throws Exception {
		
		String oldFileName = pic1.getOriginalFilename();
		String suffix = FilenameUtils.getExtension(oldFileName);
		String fileName = null; //圖片檔案名稱
		
		fileName = "st_"+System.currentTimeMillis()+"."+suffix; // 根據時間戳建立檔案名稱
		
		File dirPath = new File("C://storeImage"); //決定上傳路徑(本機)
		
		if(!dirPath.exists()) { //如果該資料夾不存在變創造一個
			dirPath.mkdirs();
		}
		
		String imgsrc = dirPath+"/"+fileName; //檔案名稱
		File saveFile = new File(imgsrc); //圖片路徑
		pic1.transferTo(saveFile); //把圖片給存到這個路徑	
		
		StringBuilder sbHoliday = new StringBuilder();
		for(int i = 0;i<ckholiday.length;i++) {
			if(i!=ckholiday.length-1) {
				sbHoliday.append(ckholiday[i]);
				sbHoliday.append("、");
			}else if(i==ckholiday.length-1) {
				sbHoliday.append(ckholiday[i]);
			}
		}
		
		String sholiday = sbHoliday.toString();
		int areaID = Integer.parseInt(area);
		Area areaBean = service.selectAreaById(areaID);
		
		Store stBean = new Store(sname,areaBean,sadd,stel,semail,bgTime,edTime,sholiday,fileName);
		service.add(stBean);
		
		return "rental/InsertSuccess";
	}
	
	@RequestMapping(path="/storeUpdate.controller", method = RequestMethod.POST)
	public String storeUpdate(@RequestParam(name="sname") String sname,
			@RequestParam(name="pic1") MultipartFile pic1,@RequestParam(name="sadd") String sadd,
			@RequestParam(name="area") String area,@RequestParam(name="semail") String semail,
			@RequestParam(name="stel") String stel,@RequestParam(name="bgTime") String bgTime,
			@RequestParam(name="edTime") String edTime,@RequestParam(name="storeID") String store_id,
			@RequestParam(name="ckholiday") String[] ckholiday,
			Model m) throws Exception {
		
		String oldFileName = pic1.getOriginalFilename();
		String suffix = FilenameUtils.getExtension(oldFileName);
		String fileName = null; //圖片檔案名稱
		
		fileName = "st_"+System.currentTimeMillis()+"."+suffix; // 根據時間戳建立檔案名稱
		
		File dirPath = new File("C://storeImage"); //決定上傳路徑(本機)
		
		if(!dirPath.exists()) { //如果該資料夾不存在變創造一個
			dirPath.mkdirs();
		}
		
		String imgsrc = dirPath+"/"+fileName; //檔案名稱
		File saveFile = new File(imgsrc); //圖片路徑
		pic1.transferTo(saveFile); //把圖片給存到這個路徑	
		
		StringBuilder sbHoliday = new StringBuilder();
		for(int i = 0;i<ckholiday.length;i++) {
			if(i!=ckholiday.length-1) {
				sbHoliday.append(ckholiday[i]);
				sbHoliday.append("、");
			}else if(i==ckholiday.length-1) {
				sbHoliday.append(ckholiday[i]);
			}
		}
		
		String sholiday = sbHoliday.toString();
		int areaID = Integer.parseInt(area);	
		Area areaBean = service.selectAreaById(areaID);
		
		Store stBean = new Store(sname,areaBean,sadd,stel,semail,bgTime,edTime,sholiday,fileName);
		service.update(store_id,stBean);
		
		return "rental/updateSuccess";
	}
	

	@RequestMapping(path = "/storeDelete.controller", method = RequestMethod.GET)
	public String storeDelete(@RequestParam(name = "storeID") String storeID) {
		service.delete(storeID);
		return "redirect:/maintainStorePre.controller?pageNo=1";
	}

	@RequestMapping(path = "/MaintainStoreSelect.controller", method = RequestMethod.GET)
	public String MaintainStoreSelect(@RequestParam(name = "pageNo") String pageNoStr, 
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

			return "rental/maintainStore";

	}
	
	//傳送庫存畫面
	@GetMapping(path="/maintainBikeStockPre")
	public String maintainBikeStockPre(@RequestParam(name="storeId") String storeId,Model m) {
		List<RbStock> rbList = service.selectStockByStore(storeId);
		Store store = service.selectOne(storeId);
		m.addAttribute("stockBean",rbList);
		m.addAttribute("store",store);
		return "rental/maintainBikeStock";	
	}
	
	//新增腳踏車庫存(前置)
	@GetMapping(path = "/insertBikeStockPre")
	public String insertBikeStockPre(@RequestParam(name="storeId") String storeId,Model m) {
		String bikeTypeSelect = rbService.getRbTypeSelect();//腳踏車種類選單
		Store store = service.selectOne(storeId);
		m.addAttribute("bikeTypeSelect", bikeTypeSelect);
		m.addAttribute("store", store);	
		return "rental/insertBikeStock";
	}
	
	//新增腳踏車庫存(儲存)
	@PostMapping(path="/insertBikeStock")
	public String insertBikeStock(@RequestParam(name="storeId") String storeId,
		@RequestParam(name="rbSize") String rbSize,
		@RequestParam(name="stock") Integer stock) {
		Store store = service.selectOne(storeId);
		RentalBike rb = rbService.selectBike(rbSize);
		RbStock rbStock = new RbStock(stock,rb,store);
		System.out.println("測試測試"+rbSize);
		System.out.println("測試測試"+storeId);
		System.out.println("測試測試"+stock);
		service.insertRbStock(rbStock);
		return "redirect:/Success";
	}
	
	//傳送更新畫面(顯示)
	@GetMapping(path="/Success")
	public String updateSuccess() {
		return "rental/updateSuccess";
	}
	
	//腳踏車種類連動選單Ajax
	@GetMapping(value = "/rentalbikeByType.json",produces = "application/json")
	public @ResponseBody Map<String, Object> bikeByType(@RequestParam(name="typeId") String typeId){
		Map<String,Object> map = new HashMap<>();
		List<SimpleBike> sList = rbService.getSimpleBikeByType(typeId);
		map.put("sList",sList);
		return map;
	}
	
	//腳踏車尺寸連動選單Ajax
	@GetMapping(value = "/sizeByRb.json",produces = "application/json")
	public @ResponseBody Map<String, Object> sizeByRb(@RequestParam(name="rbId") String rbId){
		Map<String,Object> map = new HashMap<>();
		List<RentalBike> rbList = rbService.getAllBikeSize(rbId);
		map.put("rbList",rbList);
		return map;
	}  

		
}
	
	
	
