package main.java.jackey;

import java.io.IOException;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;

public class test2 {

	public static void main(String[] args) {
		String query = "序展－【 宜蘭的誔生 】 互動劇場";
		String url = "https://www.google.com/search?tbm=isch&q=" + query.replace(",", "");;
		String finRes="";
		try {
			Document doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/86.0.4240.198 Safari/537.36").timeout(10*1000).get();
			Element media = doc.select("[data-src]").first();
			String finUrl = media.attr("abs:data-src");
			finRes="<a href=\"http://images.google.com/search?tbm=isch&q=" + query + "\"><img src=\"" + finUrl.replace("&quot", "") + "\" border=1/></a>";
			System.out.println(finRes);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
