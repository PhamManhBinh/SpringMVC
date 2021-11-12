package springmvc.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;




@Controller
public class UserController {
	
	
	
	@RequestMapping(value={"/","/user"})
	public String user(Model model) {
		return "userHome";
	}
	
}
