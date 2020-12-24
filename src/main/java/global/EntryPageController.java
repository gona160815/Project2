package main.java.global;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import main.java.sixsix.dao.RegistDAOimpt;

@Controller
public class EntryPageController {
	
	@Autowired
	RegistDAOimpt DAO;
	
	@GetMapping({"/homepage","/"})
	public String homepage() {
		return "index";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(Model m) {
		ArrayList<Integer> list = DAO.countEveryMonthDollar();
		m.addAttribute("list",list);
		return "dashboard";
	}
	
}
