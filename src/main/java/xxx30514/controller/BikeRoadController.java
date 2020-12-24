package main.java.xxx30514.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


import main.java.xxx30514.model.Bike;
import main.java.xxx30514.model.BikeDAO;
import main.java.xxx30514.model.BikeService;
import main.java.xxx30514.model.HotBike;
import main.java.xxx30514.model.HotBikeService;
import main.java.xxx30514.util.QRCodeGenerator;

@Controller
public class BikeRoadController {
	@Autowired
	BikeService Bservice;
	@Autowired
	HotBikeService HotBikeService;
	@RequestMapping(path = "/hotBikeDetail.controller", method = RequestMethod.GET)
	public String BiKeIndexEntry(@RequestParam(name = "id") Integer id,Model m) {
		HotBike hotBikes= HotBikeService.select(id);
		m.addAttribute("queryResult",hotBikes);
		return "bike/hotBikeRoadUI_detail";
	}
//	@RequestMapping(path = "/bikeInsertForm.controller", method = RequestMethod.GET)
//	public String BiKeInsertEntry() {
//		return "bike/bikeInsert";
//	}
//	@RequestMapping(path = "/bikeUpdateForm.controller", method = RequestMethod.GET)
//	public String BiKeUpdateEntry(@RequestParam(name = "changeid") String id,Model m) {
//		m.addAttribute("changeid",id);
//		return "bike/bikeUpdate";
//	}
	@RequestMapping(path = "/bikeRoadSearch.controller", method = RequestMethod.GET) //前端車道搜尋結果
	public String bikeRoadSearch(@RequestParam(name = "search") String keyWord,
			@RequestParam(name = "pageNo") String pageNo,
			@RequestParam(name = "city") String bikeCity,Model m) {
		int startPageNo = 1;//第一頁開始
		if (pageNo == null) {
			startPageNo = 1;
		} else {
			try {
				startPageNo = Integer.parseInt(pageNo.trim());
			} catch (NumberFormatException e) {
				startPageNo = 1;
			}
		}
		Bservice.setPageNo(startPageNo);
		String str="";
		switch (bikeCity) {
		case "0":str="";break;
		case "1":str="台北市";break;
		case "2":str="新北市";break;
		case "3":str="基隆市";break;
		case "4":str="桃園市";break;
		case "5":str="新竹市";break;
		case "6":str="新竹縣";break;
		case "7":str="苗栗縣";break;
		case "8":str="台中市";break;
		case "9":str="彰化縣";break;
		case "10":str="南投縣";break;
		case "11":str="雲林縣";break;
		case "12":str="嘉義市";break;
		case "13":str="嘉義縣";break;
		case "14":str="台南市";break;
		case "15":str="高雄市";break;
		case "16":str="屏東縣";break;
		case "17":str="宜蘭縣";break;
		case "18":str="花蓮縣";break;
		case "19":str="台東縣";break;
		case "20":str="澎湖縣";break;
		case "21":str="金門縣";break;
		}
		List<Bike> result= Bservice.selectRoad(str, keyWord);//用集合裝資料
		List<HotBike> hotBikes=HotBikeService.selectAllHotBikeNoPages();
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", Bservice.getSearchTotalPages(str, keyWord));
		m.addAttribute("queryResult", result);
		m.addAttribute("search",keyWord);
		m.addAttribute("city",bikeCity);
		m.addAttribute("hot", hotBikes);
		return "bike/bikeRoadUI";
	}
	@RequestMapping(path = "/newBikeIndexEntry.controller", method = RequestMethod.GET) //前端車道首頁
	public String newBikeRoadIndex(@RequestParam(name = "pageNo") String pageNo,Model m) {
		int startPageNo = 1;//第一頁開始
		if (pageNo == null) {
			startPageNo = 1;
		} else {
			try {
				startPageNo = Integer.parseInt(pageNo.trim());
			} catch (NumberFormatException e) {
				startPageNo = 1;
			}
		}
		Bservice.setPageNo(startPageNo);
		List<Bike> result = Bservice.selectAll();
		List<HotBike> hotBikes=HotBikeService.selectAllHotBikeNoPages();
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", Bservice.getTotalPages());
		m.addAttribute("queryResult", result);
		m.addAttribute("hot", hotBikes);
		return "bike/bikeRoadUI";
	}
	@RequestMapping(path = "/bikeIndexDetailEntry.controller", method = RequestMethod.GET)//前端車道細節資料
	public String BiKeDetailEntry(@RequestParam(name = "changeid") String id,Model m) {
		m.addAttribute("changeid",id);
		return "bike/bikeRoadUI_detail";
	}
	
}
