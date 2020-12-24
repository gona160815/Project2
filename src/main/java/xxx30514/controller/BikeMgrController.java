package main.java.xxx30514.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import main.java.xxx30514.model.Bike;
import main.java.xxx30514.model.BikeService;

@Controller
public class BikeMgrController {
	@Autowired
	BikeService Bservice;

	@RequestMapping(path = "/bikeMgrEntry.controller", method = RequestMethod.GET)
	public String BiKeIndexEntry(@RequestParam(name = "pageNo") String pageNo,Model m) {
		
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
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", Bservice.getTotalPages());
		m.addAttribute("queryResult", result);
		return "bike/bike";
	}

	@RequestMapping(path = "/bikeMgrInsertEntry.controller", method = RequestMethod.GET)
	public String BiKeInsertEntry() {
		return "bike/newbikeinsert";
	}

	@RequestMapping(path = "/bikeMgrUpdateEntry.controller", method = RequestMethod.POST)
	public String BiKeUpdateEntry(@RequestParam(name = "changeid") String id, Model m) {
		m.addAttribute("changeid", id);
		return "bike/newbikeupdate";
	}

	@RequestMapping(path = "/bikeMgrDetailEntry.controller", method = RequestMethod.POST)
	public String BiKeDetailEntry(@RequestParam(name = "changeid") String id,Model m) {
		m.addAttribute("changeid",id);
		return "bike/bike_detail";
	}

	@RequestMapping(path = "/bikeDelete.controller", method = RequestMethod.POST)
	public String bikeDelete(@RequestParam(name = "id") Integer bkID, Model m) {
		m.addAttribute("id", bkID);
		Bservice.deleteRoad(bkID);
		System.out.println(bkID);
		int startPageNo = 1;
		Bservice.setPageNo(startPageNo);
		List<Bike> result = Bservice.selectAll();
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", Bservice.getTotalPages());
		m.addAttribute("queryResult", result);
		return "bike/bike";
	}
//	@RequestMapping(path = "/bikeDetail.controller", method = RequestMethod.GET)
//	public String bikeDetail(@RequestParam(name = "id") String bkID, Model m) {
//		m.addAttribute("changeid", bkID);
//		Bservice.detailBikes(bkID);
//		System.out.println(bkID);
//		List<Bike> result = Bservice.detailBikes(bkID);
//		m.addAttribute("queryResult", result);
//		return "bike/bike_detail";
//	}

	@RequestMapping(path = "/bikeInsert.controller", method = RequestMethod.POST)
	public String bikeInsert(@RequestParam(name = "name") String bkName,
			@RequestParam(name = "begin") String bkBegin, @RequestParam(name = "goal") String bkGoal,
			@RequestParam(name = "city") String bkCity, @RequestParam(name = "town") String bkTown,
			@RequestParam(name = "maintain") String bkMaintain, @RequestParam(name = "m") String bkM,
			@RequestParam(name = "latitude") String bkLatitude, @RequestParam(name = "longitude") String bkLongitude,
			Model m) {
		Bike bkBean = new Bike(bkName, bkBegin, bkGoal, bkCity, bkTown, bkMaintain, bkM, bkLatitude, bkLongitude);
		Bservice.insertRoad(bkBean);
		m.addAttribute("insertResult", bkBean);
		return "bike/newbikeinsertresult";
	}

	@RequestMapping(path = "/bikeUpdate.controller", method = RequestMethod.POST)
	public String bikeUpdate(@RequestParam(name = "id") Integer bkID, @RequestParam(name = "name") String bkName,
			@RequestParam(name = "begin") String bkBegin, @RequestParam(name = "goal") String bkGoal,
			@RequestParam(name = "city") String bkCity, @RequestParam(name = "town") String bkTown,
			@RequestParam(name = "maintain") String bkMaintain, @RequestParam(name = "m") String bkM,
			@RequestParam(name = "latitude") String bkLatitude, @RequestParam(name = "longitude") String bkLongitude,
			Model m) {
		Bike bkBean = new Bike(bkID, bkName, bkBegin, bkGoal, bkCity, bkTown, bkMaintain, bkM, bkLatitude, bkLongitude);
		Bservice.updateRoad(bkID, bkName, bkBegin, bkGoal, bkCity, bkTown, bkMaintain, bkM, bkLatitude, bkLongitude);
		m.addAttribute("updateResult", bkBean);
		return "bike/newbikeupdateresult";
	}
	@RequestMapping(path = "/bikeMgrRoadSearch.controller", method = RequestMethod.GET) //後台車道搜尋結果
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
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", Bservice.getSearchTotalPages(str, keyWord));
		m.addAttribute("queryResult", result);
		m.addAttribute("search",keyWord);
		m.addAttribute("city",bikeCity);
		return "bike/bike";
	}
}
