package main.java.jackey;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class TestController {
	
	
	@GetMapping("/testHome")
	public String testHomepage() {
		return "event/newIndex";
	}
}
