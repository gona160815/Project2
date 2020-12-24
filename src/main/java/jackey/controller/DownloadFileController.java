package main.java.jackey.controller;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import main.java.jackey.model.service.EventDetailService;

@Controller
public class DownloadFileController {
	
	@Autowired
	EventDetailService detailService;
	
	@GetMapping("/downloadExcel")
	@ResponseBody
	public void downloadExcel(HttpServletResponse response) {
		
		XSSFWorkbook workbook = new XSSFWorkbook();
		XSSFSheet sheet = workbook.createSheet("Chart Data");
		Map<String, Object> map = detailService.getRecent30DaysDetails();
		Object[] object;
		for (int i = 0; i < map.size(); i++) {
			object = (Object[]) map.get("last" + i + "day");
		}
		Object[][] detailsData = {
			{"日期","評論數","按讚數","瀏覽次數"},
			
		};
		
	}
}
