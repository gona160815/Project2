package main.java.xxx30514.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import main.java.xxx30514.model.RestArea;
import main.java.xxx30514.model.RestServie;

@Controller
public class RestareaController {
	@Autowired
	RestServie Rservice;
	@RequestMapping(path = "/REEntry.controller", method = RequestMethod.GET)//前端顯示首頁
	public String RestAreaIndexEntry(@RequestParam(name = "pageNo") String pageNo,Model m) {
		
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
		return "bike/bikeRestArea";
	}
	@RequestMapping(path = "/RestAreaDetailEntry.controller", method = RequestMethod.GET)//前端驛站細節資訊
	public String restAreaDetailEntry(@RequestParam(name = "changeid") Integer id,Model m) {
		m.addAttribute("changeid",id);
		return "bike/bikeRestArea_detail";
	}
	@RequestMapping(path = "/RestAreaSearch.controller", method = RequestMethod.GET) //前端驛站搜尋
	public String restAreaSearch(@RequestParam(name = "search") String keyWord,
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
		Rservice.setPageNo(startPageNo);
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
		case "22":str="連江縣";break;
		}
		List<RestArea> result= Rservice.selectRestArea(str, keyWord);//用集合裝資料
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", Rservice.getSearchTotalPages(str, keyWord));
		m.addAttribute("queryResult", result);
		m.addAttribute("search",keyWord);
		m.addAttribute("city",bikeCity);
		return "bike/bikeRestArea";
	}
}
