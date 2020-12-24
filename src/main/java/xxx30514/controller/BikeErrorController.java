package main.java.xxx30514.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.sql.rowset.serial.SerialBlob;

import org.apache.commons.io.FileUtils;
import org.apache.commons.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.sun.mail.handlers.image_jpeg;

import main.java.hugo.model.MemberBasic;
import main.java.hugo.service.MemberBasicServiceImpl;
import main.java.jackey.model.Event;
import main.java.jackey.model.EventComment;
import main.java.xxx30514.model.BErrorService;
import main.java.xxx30514.model.Bike;
import main.java.xxx30514.model.BikeError;
import main.java.xxx30514.model.RestArea;

@Controller
@SessionAttributes({ "loginOK" })
public class BikeErrorController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	BErrorService bErrorService;
	@Autowired
	MemberBasicServiceImpl memberService;

	@RequestMapping(path = "/bikeErrorMgrEntry.controller", method = RequestMethod.GET)
	public String BiKeErrorMgrEntry(@RequestParam(name = "pageNo") String pageNo,Model m) {

		int startPageNo = 1;// 第一頁開始
		if (pageNo == null) {
			startPageNo = 1;
		} else {
			try {
				startPageNo = Integer.parseInt(pageNo.trim());
			} catch (NumberFormatException e) {
				startPageNo = 1;
			}
		}
		bErrorService.setPageNo(startPageNo);
		List<BikeError> result = bErrorService.selectAllBikeErrorBase64();
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", bErrorService.getTotalPages());
		m.addAttribute("queryResult", result);
		return "bike/bikeErrorMgrIndex";
	}

	@RequestMapping(path = "/bikeErrorInsertEntry.controller", method = RequestMethod.GET) // 導向回報表單
	public String BiKeInsertEntry() {
		return "bike/bikeErrorInsert";
	}
	@RequestMapping(path = "/bikeErrorSearchEntry.controller", method = RequestMethod.POST) // 查詢回報紀錄
	public String BiKeSearchEntry(@RequestParam(name = "memberid")Integer memberID, @RequestParam(name = "pageNo") String pageNo,Model m) {
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
		List<BikeError> result = bErrorService.selectMemberBikeErrorBase64(memberID);
		bErrorService.setPageNo(startPageNo);
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages",bErrorService.getTotalPages());
		m.addAttribute("queryResult", result);
		
		return "bike/bikeErrorSearch";
	}
	@RequestMapping(path = "/bikeErrorInsert.controller", method = RequestMethod.POST) // 回報錯誤
	public String restAreaInsert(@RequestParam(name = "title") String title,
			@RequestParam(name = "memberid") Integer memberid, @RequestParam(name = "description") String description,
			@RequestParam(name = "tag") String tag, @RequestParam(name = "picture") MultipartFile mFile, Model m)
			throws Exception {
		byte[] picture =  mFile.getBytes();
		String encodeBase64String = Base64.encodeBase64String(picture);
		System.out.println(picture);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String datetime = now.format(formatter);
		System.out.println(datetime);
		LocalDateTime starttime = LocalDateTime.parse(datetime, formatter);
		System.out.println(starttime);
		LocalDateTime endtime = null;
		String status = "待處理";
		String reply = "";
		Blob pic = new SerialBlob(mFile.getBytes());
		BikeError beBean = new BikeError(title, description,reply,tag,memberid, status, pic, starttime, endtime);
		bErrorService.insertBikeError(beBean);
		List<BikeError> result = bErrorService.selectByMemberID(memberid);
		m.addAttribute("insertResult", beBean);
		m.addAttribute("pic", encodeBase64String);
		m.addAttribute("queryResult", result);
		System.out.println(picture);
		System.out.println(encodeBase64String);
		System.out.println(mFile);
		return "bike/bikeErrorReport";
	}
	@RequestMapping(path = "/bikeErrorDetailEntry.controller", method = RequestMethod.POST)
	public String BiKeErrorDetailEntry(@RequestParam(name = "changeid") Integer id,Model m) {
		m.addAttribute("changeid",id);
		return "bike/bikeErrorReport_detail";
	}
	@RequestMapping(path = "/bikeErrorSearchDetailEntry.controller", method = RequestMethod.POST)
	public String BiKeErrorSearchDetailEntry(@RequestParam(name = "changeid") String id,Model m) {
		m.addAttribute("changeid",id);

		return "bike/bikeErrorSearchReport_detail";
	}
	@RequestMapping(path = "/bikeErrorDelete.controller", method = RequestMethod.POST)
	public String BiKeErrorDelete(@RequestParam(name = "id") Integer beID,Model m) {
		m.addAttribute("id",beID);
		bErrorService.deleteBikeError(beID);
		System.out.println(beID);
		int startPageNo = 1;
		bErrorService.setPageNo(startPageNo);
		List<BikeError> result = bErrorService.selectAllBikeError();
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages", bErrorService.getTotalPages());
		m.addAttribute("queryResult", result);
		return "bike/bikeErrorMgrIndex";
	}
	@RequestMapping(path = "/bikeErrorMgrSearch.controller", method = RequestMethod.GET) //後端搜尋結果
	public String bikeErrorSearch(@RequestParam(name = "search") String keyWord,@RequestParam(name = "status") String status,
			@RequestParam(name = "pageNo") String pageNo,Model m) {
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
		bErrorService.setPageNo(startPageNo);
		String str="";
		switch (status) {
		case "0":str="";break;
		case "1":str="待處理";break;
		case "2":str="處理中";break;
		case "3":str="已結案";break;
		}
		List<BikeError> result=bErrorService.selectBikeErrors(str,keyWord);//用集合裝資料
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages",bErrorService.getSearchTotalPages(str,keyWord));
		m.addAttribute("queryResult", result);
		m.addAttribute("search",keyWord);
		m.addAttribute("status",status);
		return "bike/bikeErrorMgrIndex";
	}
	@RequestMapping(path = "/bikeErrorMgrDetailEntry.controller", method = RequestMethod.POST) //後台細節
	public String biKeErrorMgrDetailEntry(@RequestParam(name = "changeid") String id,@RequestParam(name = "picString") String picture ,Model m) {
		m.addAttribute("changeid",id);		
		
		return "bike/bike_error_detail";
	}
	
	@RequestMapping(path = "/bikeErrorMgrStatus.controller", method = RequestMethod.GET) //後端搜尋結果
	public String bikeErrorStatus(@RequestParam(name = "status") String status,
			@RequestParam(name = "pageNo") String pageNo,Model m) {
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
		bErrorService.setPageNo(startPageNo);
		String str="";
		switch (status) {
		case "0":str="";break;
		case "1":str="待處理";break;
		case "2":str="處理中";break;
		case "3":str="已結案";break;
		}
		List<BikeError> result=bErrorService.selectBikeErrorStatus(str);//用集合裝資料
		m.addAttribute("pageNo", String.valueOf(startPageNo));
		m.addAttribute("totalPages",bErrorService.getStatusTotalPages(str));
		m.addAttribute("queryResult", result);
		m.addAttribute("status",status);
		return "bike/bikeErrorMgrIndex";
	}
	@RequestMapping(path = "/bikeErrorReplyEntry.controller", method = RequestMethod.POST)
	public String biKeErrorReplyEntry(@RequestParam(name = "changeid") String id,Model m) {
		m.addAttribute("changeid",id);		
		
		return "bike/bikeErrorReply";
	}
	@RequestMapping(path = "/bikeErrorReply.controller", method = RequestMethod.POST)
	public String bikeErrorReply(@RequestParam(name = "id") Integer id, @RequestParam(name = "title") String title,
			@RequestParam(name = "description") String description, @RequestParam(name = "tag") String tag,
			@RequestParam(name = "memberid") Integer memberid, @RequestParam(name = "status") String status,
			@RequestParam(name = "reply") String reply,@RequestParam(name = "picString") String picture,Model m) {
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String datetime = now.format(formatter);
		LocalDateTime endtime = LocalDateTime.parse(datetime, formatter);
		BikeError beBean = new BikeError(id, title, description, tag, memberid, status, endtime, reply);
		bErrorService.updateBikeError(id, title, tag, description, status, memberid, reply,endtime);
		m.addAttribute("replyResult", beBean);
		return "bike/bike_error_replyresult";
	}
//	@RequestMapping(path = "/fileUploadAction.controller", method = RequestMethod.POST)
//	@ResponseBody
//	public ResponseEntity<byte[]> processFileUploadAction(@RequestParam(name = "myfile") MultipartFile mFile)
//			throws Exception {
//
//		String fileName = mFile.getOriginalFilename();
//		String fileTempDirPath = request.getSession().getServletContext().getRealPath("/") + "UploadTempDir\\";
//
//		System.out.println("fileName:" + fileName);
//		System.out.println("fileTempDirPath:" + fileTempDirPath);
//
//		File dirPath = new File(fileTempDirPath);
//		if (!dirPath.exists()) {
//			boolean imgstatus = dirPath.mkdirs();
//			System.out.println("status:" + imgstatus);
//		}
//		String fileSavePath = fileTempDirPath + fileName;
//		File saveFile = new File(fileSavePath);
//		mFile.transferTo(saveFile);
//		System.out.println("fileasvePath" + fileSavePath);
//		HttpHeaders headers = new HttpHeaders();
//		headers.setContentType(MediaType.IMAGE_JPEG);
////		BikeError beBean= new BikeError(title, description, tag, memberid, status, picture);
////		bErrorService.insertBikeError(beBean);
////		m.addAttribute("insertResult", beBean);
//
//		if (fileName != null && fileName.length() != 0) {
//			savePicture(fileName, fileSavePath);
//		}
//
//		return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(saveFile), headers, HttpStatus.OK);
//	}
//
//	private void savePicture(String title, String fileSavePath) {
//		try {
//			BikeError bean = new BikeError();
//			bean.setTitle(title);
//			FileInputStream is1 = new FileInputStream(fileSavePath);
//			byte[] b = new byte[is1.available()];
//			is1.read(b);
//			is1.close();
//
//			bean.setPicture(b);
//
//			bErrorService.insertBikeError(bean);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}
	@GetMapping(value = "bikeErrorReport", produces = "application/json")
	public @ResponseBody Map<String, Object> ReportList(@RequestParam Integer beID) {
		Map<String, Object> map = new HashMap<>();
		List<BikeError> reports = bErrorService.selectByMemberID(beID);
		List<String> nameList = new ArrayList<String>();
		for (BikeError errorreport : reports) {
			MemberBasic member = memberService.select(errorreport.getMemberid());
			String name = member.getName();
			nameList.add(name);
		}
		map.put("name", nameList);
		map.put("report", reports);
		return map;
	}

	@PostMapping(value = "addBikeErrorReport", produces = "application/json")
	public @ResponseBody Map<String, Object> getReport(@RequestParam Integer memberId, @RequestParam String description,
			@RequestParam String title,@RequestParam String tag,@RequestParam MultipartFile mFile, Model m) throws Exception {

//		check LOGINOK
		Map<String, Object> map = new HashMap<>();
		BikeError bikeError = new BikeError();
		
		byte[] picture = mFile.getBytes();
		String encodeBase64String = Base64.encodeBase64String(picture);
		String status = "待處理";
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();
		String datetime = now.format(formatter);
		System.out.println(datetime);
		LocalDateTime starttime = LocalDateTime.parse(datetime, formatter);
		
		MemberBasic member = memberService.select(memberId);
		bikeError.setMemberid(memberId);
		bikeError.setDescription(description);
		bikeError.setStatus(status);
		bikeError.setTitle(title);
		bikeError.setTag(tag);
//		bikeError.setPicture(picture);
		bikeError.setStarttime(starttime);
		bErrorService.insertBikeError(bikeError);
////		LocalDateTime timeformat = LocalDateTime.parse(datetime,formatter);
////		String timeString= DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss").format(timeformat);
//		System.out.println(starttime);
//		LocalDateTime endtime = null;
//		String status = "待處理";
//		BikeError beBean = new BikeError(title, description, tag, memberid, status, picture, starttime, endtime);
//		bErrorService.insertBikeError(beBean);
//		m.addAttribute("insertResult", beBean);
//		m.addAttribute("pic", encodeBase64String);
//		return "bike/bikeErrorReport";
		map.put("report", bikeError);
		map.put("reportTime", starttime);
		map.put("pic", encodeBase64String);
		map.put("member", member);
		return map;
	}
}
