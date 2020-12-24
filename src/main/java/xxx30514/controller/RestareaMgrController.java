package main.java.xxx30514.controller;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import main.java.xxx30514.model.Bike;
import main.java.xxx30514.model.RestArea;
import main.java.xxx30514.model.RestServie;

@Controller
public class RestareaMgrController {
	@Autowired
	RestServie Rservice;
	@RequestMapping(path = "/REMgrEntry.controller", method = RequestMethod.GET)//後臺驛站管理
	public String RestAreaMgrIndexEntry(@RequestParam(name = "pageNo") String pageNo,Model m) {
		
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
		Rservice.setPageNo(startPageNo);
		List<RestArea> result = Rservice.selectAllRestAreas();
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", Rservice.getTotalPages());
		m.addAttribute("queryResult", result);
		return "bike/bike_supply";
	}
	@RequestMapping(path = "/REMgrSearch.controller", method = RequestMethod.GET) //後端驛站搜尋結果
	public String bikeRoadSearch(@RequestParam(name = "search") String keyWord,
			@RequestParam(name = "pageNo") String pageNo,
			@RequestParam(name = "city") String restCity,Model m) {
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
		Rservice.setPageNo(startPageNo);
		String str="";
		switch (restCity) {
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
		case "22":str="連江縣";break;
		}
		List<RestArea> result= Rservice.selectRestArea(str, keyWord);//用集合裝資料
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", Rservice.getSearchTotalPages(str, keyWord));
		m.addAttribute("queryResult", result);
		m.addAttribute("search",keyWord);
		m.addAttribute("city",restCity);
		return "bike/bike_supply";
	}
	@RequestMapping(path = "/REMgrInsertEntry.controller", method = RequestMethod.GET)//導向後台新增表單
	public String restAreaInsertEntry() {
		return "bike/restareainsert";
	}

	@RequestMapping(path = "/REMgrUpdateEntry.controller", method = RequestMethod.POST)//導向後台更新表單
	public String restAreaUpdateEntry(@RequestParam(name = "changeid") String id, Model m) {
		m.addAttribute("changeid", id);
		return "bike/restareaupdate";
	}

	@RequestMapping(path = "/REMgrDetailEntry.controller", method = RequestMethod.POST)//後臺驛站細節資料頁面
	public String restAreaMgrDetailEntry(@RequestParam(name = "changeid") String id,Model m) {
		m.addAttribute("changeid",id);
		return "bike/bike_supply_detail";
	}

	@RequestMapping(path = "/REDelete.controller", method = RequestMethod.POST)//刪除驛站
	public String restAreaDelete(@RequestParam(name = "id") Integer reID, Model m) {
		m.addAttribute("id", reID);
		Rservice.deleteRestArea(reID);
		System.out.println(reID);
		int startPageNo = 1;
		Rservice.setPageNo(startPageNo);
		List<RestArea> result = Rservice.selectAllRestAreas();
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", Rservice.getTotalPages());
		m.addAttribute("queryResult", result);
		return "bike/bike_supply";
	}
//	@RequestMapping(path = "/REDetail.controller", method = RequestMethod.GET)
//	public String bikeDetail(@RequestParam(name = "id") Integer reID, Model m) {
//		m.addAttribute("changeid", reID);
//		Rservice.detailRestAreas(reID);
//		System.out.println(reID);
//		List<RestArea> result = Rservice.detailRestAreas(reID);
//		m.addAttribute("queryResult", result);
//		return "bike/bike_detail";
//	}

	@RequestMapping(path = "/REInsert.controller", method = RequestMethod.POST)//新增驛站
	public String restAreaInsert( @RequestParam(name = "name") String reName,
			@RequestParam(name = "address") String reAddress, @RequestParam(name = "tel") String reTel,
			@RequestParam(name = "city") String reCity, @RequestParam(name = "town") String reTown,Model m) {
		RestArea reBean = new RestArea(reCity, reTown, reName, reAddress, reTel);
		Rservice.insertRestArea(reBean);
		m.addAttribute("insertResult", reBean);
		return "bike/restareainsertresult";
	}

	@RequestMapping(path = "/REUpdate.controller", method = RequestMethod.POST)//更新驛站
	public String restAreaUpdate(@RequestParam(name = "id") Integer reID, @RequestParam(name = "name") String reName,
			@RequestParam(name = "address") String reAddress, @RequestParam(name = "tel") String reTel,
			@RequestParam(name = "city") String reCity, @RequestParam(name = "town") String reTown,Model m) {
		RestArea reBean  = new RestArea(reID,reCity, reTown, reName, reAddress, reTel);
		Rservice.updateRestArea(reID, reName, reAddress, reTel, reCity, reTown);
		m.addAttribute("updateResult", reBean);
		return "bike/restareaupdateresult";
	}
	
}
