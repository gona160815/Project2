package main.java.jackey.controller;

import java.io.IOException;
import java.net.URLEncoder;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import main.java.jackey.model.Event;
import main.java.jackey.model.service.EventService;

@Controller
public class ImageController {

	@Autowired
	EventService eventService;

	@GetMapping("/fingImgUrl")
	public String getImageUrl() {

		String finRes = "";
		Event event;
		try {
			for (int i = 6853; i <= 6867; i++) {
				event = eventService.select(i);
				if (event != null) {

					String query = event.getTitle();
					System.out.println("query:" + query);
					String url = "https://www.google.com/search?tbm=isch&q=" + query.replace(",", "");
					Document doc = Jsoup.connect(url).userAgent(
							"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36")
							.timeout(30 * 1000).ignoreHttpErrors(true).get();
					Element media = doc.select("img[data-src]").first();
					System.out.println("media" + media);
					if (media != null) {
						String attr = media.attr("data-src");
						String finUrl = media.attr("abs:data-src");
						event.setImage(finUrl);
						eventService.update(event);
						System.out.println("findUrl" + url);
						System.out.println("-------Result:------------");
						System.out.println(i + ":url=" + finUrl);
						System.out.println(i + ":src=" + attr);
					}
				}
//			finRes="<a href=\"http://images.google.com/search?tbm=isch&q=" + query + "\"><img src=\"" + finUrl.replace("&quot", "") + "\" border=1/></a>";

			}
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "aaa";
	}

}
