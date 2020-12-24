package main.java.jackey.util;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.json.JSONArray;
import org.json.JSONObject;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import main.java.jackey.model.Event;
import main.java.jackey.model.EventCat;
import main.java.jackey.model.service.EventService;

@Controller
public class InitData {

	@Autowired
	EventService service;

	@GetMapping(path = "/initEvent")
	public String insertData() throws MalformedURLException {
		insertEntertainment();
		insertExhibition();
		insertFamily();

		return "event/event";
	}

	private void insertFamily() throws MalformedURLException {
		String path = "https://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=4";
		URL url = new URL(path);

		try (BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"))) {

			String s;
			StringBuffer sb = new StringBuffer();
			while ((s = br.readLine()) != null) {
				sb.append(s);
			}
			
			Event bean = null;
			JSONArray jsonArray = new JSONArray(sb.toString());
			for (int i = 0; i < jsonArray.length(); i++) {
				bean = new Event();
				JSONObject family = new JSONObject();
				family = (JSONObject) jsonArray.get(i);
				String title = family.getString("title");
				bean.setTitle(title);
				bean.setEventCat(new EventCat(3));
				JSONArray showInfos = family.getJSONArray("showInfo");
				for (int j = 0; j < showInfos.length(); j++) {
					JSONObject showInfo = new JSONObject();
					showInfo = (JSONObject) showInfos.get(j);
					bean.setLocation(showInfo.getString("location"));
					bean.setLocationName(showInfo.getString("locationName"));
					bean.setOnsales(showInfo.getString("onSales"));
					bean.setPrice(showInfo.getString("price"));
				}
				bean.setShowunit(family.getString("showUnit"));
				bean.setDescription(family.getString("descriptionFilterHtml"));
				bean.setWebsite(family.getString("sourceWebPromote"));
				java.util.Date startDate;
				java.util.Date endDate;
				SimpleDateFormat sdf = new SimpleDateFormat();
				sdf.applyPattern("yyyy/MM/dd");
				startDate = sdf.parse(family.getString("startDate"));
				endDate = sdf.parse(family.getString("endDate"));
				bean.setStartDate(new Date(startDate.getTime()));
				bean.setEndDate(new Date(endDate.getTime()));
				
				String imgurl = "https://www.google.com/search?tbm=isch&q=" + title.replace(",", "");
				Document doc = Jsoup.connect(imgurl).userAgent(
						"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36")
						.timeout(30 * 1000).ignoreHttpErrors(true).get();
				Element media = doc.select("img[data-src]").first();
				System.out.println("media" + media);
				if (media != null) {
					String attr = media.attr("data-src");
					String finUrl = media.attr("abs:data-src");
					bean.setImage(finUrl);
					System.out.println("findUrl" + url);
					System.out.println("-------Result:------------");
					System.out.println(i + ":url=" + finUrl);
					System.out.println(i + ":src=" + attr);
				}else {
					bean.setImage("");
				}
				service.insertData(bean);
				
			}
			System.out.println("Insert Finish");
		} catch (Exception e) {
			e.printStackTrace();
			
		}

	}

	private void insertEntertainment() throws MalformedURLException {
		String path = "https://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=11";
		URL url = new URL(path);

		try (BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"))) {

			String s;
			StringBuffer sb = new StringBuffer();
			while ((s = br.readLine()) != null) {
				sb.append(s);
			}

			JSONArray jsonArray = new JSONArray(sb.toString());
			Event bean = null;
			for (int i = 0; i < jsonArray.length(); i++) {
				bean = new Event();
				JSONObject family = new JSONObject();
				family = (JSONObject) jsonArray.get(i);
				String title = family.getString("title");
				bean.setTitle(title);
				bean.setEventCat(new EventCat(1));
				JSONArray showInfos = family.getJSONArray("showInfo");
				for (int j = 0; j < showInfos.length(); j++) {
					JSONObject showInfo = new JSONObject();
					showInfo = (JSONObject) showInfos.get(j);
					bean.setLocation(showInfo.getString("location"));
					bean.setLocationName(showInfo.getString("locationName"));
					bean.setOnsales(showInfo.getString("onSales"));
					bean.setPrice(showInfo.getString("price"));
				}
				bean.setShowunit(family.getString("showUnit"));
				bean.setDescription(family.getString("descriptionFilterHtml"));
				bean.setWebsite(family.getString("sourceWebPromote"));
				java.util.Date startDate;
				java.util.Date endDate;
				SimpleDateFormat sdf = new SimpleDateFormat();
				sdf.applyPattern("yyyy/MM/dd");
				startDate = sdf.parse(family.getString("startDate"));
				endDate = sdf.parse(family.getString("endDate"));
				bean.setStartDate(new Date(startDate.getTime()));
				bean.setEndDate(new Date(endDate.getTime()));
				
				String imgurl = "https://www.google.com/search?tbm=isch&q=" + title.replace(",", "");
				Document doc = Jsoup.connect(imgurl).userAgent(
						"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36")
						.timeout(30 * 1000).ignoreHttpErrors(true).get();
				Element media = doc.select("img[data-src]").first();
				System.out.println("media" + media);
				if (media != null) {
					String attr = media.attr("data-src");
					String finUrl = media.attr("abs:data-src");
					bean.setImage(finUrl);
					System.out.println("findUrl" + url);
					System.out.println("-------Result:------------");
					System.out.println(i + ":url=" + finUrl);
					System.out.println(i + ":src=" + attr);
				}else {
					bean.setImage("");
				}
				service.insertData(bean);
			}
			System.out.println("Insert Finish");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void insertExhibition() throws MalformedURLException {
		String path = "https://cloud.culture.tw/frontsite/trans/SearchShowAction.do?method=doFindTypeJ&category=6";
		URL url = new URL(path);

		try (BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"))) {

			String s;
			StringBuffer sb = new StringBuffer();
			while ((s = br.readLine()) != null) {
				sb.append(s);
			}

			JSONArray jsonArray = new JSONArray(sb.toString());
			Event bean = null;
			for (int i = 0; i < jsonArray.length(); i++) {
				bean = new Event();
				JSONObject family = new JSONObject();
				family = (JSONObject) jsonArray.get(i);
				String title = family.getString("title");
				bean.setTitle(title);
				bean.setEventCat(new EventCat(2));
				JSONArray showInfos = family.getJSONArray("showInfo");
				for (int j = 0; j < showInfos.length(); j++) {
					JSONObject showInfo = new JSONObject();
					showInfo = (JSONObject) showInfos.get(j);
					bean.setLocation(showInfo.getString("location"));
					bean.setLocationName(showInfo.getString("locationName"));
					bean.setOnsales(showInfo.getString("onSales"));
					bean.setPrice(showInfo.getString("price"));
				}
				bean.setShowunit(family.getString("showUnit"));
				bean.setDescription(family.getString("descriptionFilterHtml"));
				bean.setWebsite(family.getString("sourceWebPromote"));
				java.util.Date startDate;
				java.util.Date endDate;
				SimpleDateFormat sdf = new SimpleDateFormat();
				sdf.applyPattern("yyyy/MM/dd");
				startDate = sdf.parse(family.getString("startDate"));
				endDate = sdf.parse(family.getString("endDate"));
				bean.setStartDate(new Date(startDate.getTime()));
				bean.setEndDate(new Date(endDate.getTime()));
				
				String imgurl = "https://www.google.com/search?tbm=isch&q=" + title.replace(",", "");
				Document doc = Jsoup.connect(imgurl).userAgent(
						"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36")
						.timeout(30 * 1000).ignoreHttpErrors(true).get();
				Element media = doc.select("img[data-src]").first();
				System.out.println("media" + media);
				if (media != null) {
					String attr = media.attr("data-src");
					String finUrl = media.attr("abs:data-src");
					bean.setImage(finUrl);
					System.out.println("findUrl" + url);
					System.out.println("-------Result:------------");
					System.out.println(i + ":url=" + finUrl);
					System.out.println(i + ":src=" + attr);
				}else {
					bean.setImage("");
				}
				service.insertData(bean);
			}
			System.out.println("Insert Finish");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
