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
import main.java.xxx30514.model.BikeService;
import main.java.xxx30514.model.RestArea;

@Controller
@SessionAttributes({ "loginOK" })
public class BikeMapController {
	@Autowired
	private HttpServletRequest request;
	@Autowired
	BErrorService bErrorService;
	@Autowired
	MemberBasicServiceImpl memberService;
	@Autowired
	BikeService Bservice;
	@RequestMapping(path = "/bikeMapEntry.controller", method = RequestMethod.GET) // 
	public String BiKeMapEntry() {
		return "bike/bikeRoadMap";
	}
	
	@GetMapping("/bikeRoadMarker") // 
	public @ResponseBody List<Bike> BiKeRoadMarker() {
		List<Bike> result = Bservice.selectAllBikeNotNull();
		return result;
	}
	
	
}
