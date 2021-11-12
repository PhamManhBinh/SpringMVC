package springmvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import springmvc.dao.UserDAO;
import springmvc.model.User;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	UserDAO userDAO;
	
	
	@RequestMapping(value={"","/"})
	public String index(Model model) {
		List<User> list = userDAO.getEmployees();
		model.addAttribute("list",list);  
		return "adminHome";
	}
	
	@RequestMapping("/addUser")
	public String addUser(Model model) {
		model.addAttribute("user",new User());
		return "addUser";
	}
	
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	public String addUserPost(@ModelAttribute("user") User user) {
		userDAO.save(user);
		return "redirect:/admin/";
	}
	
	@RequestMapping("/editUser/{id}")
	public String editUser(@PathVariable("id") int id,Model model) {
		User user = userDAO.getEmpById(id);
		model.addAttribute("user",user);
		return "editUser";
	}
	
	@RequestMapping(value = "/editUser/{id}", method = RequestMethod.POST)
	public String editUserPost(@ModelAttribute("user") User user) {
		userDAO.update(user);
		return "redirect:/admin/";
	}
	
	@RequestMapping("deleteUser/{id}")
	public String deleteUser(@PathVariable("id") int id) {
		userDAO.delete(id);
		return "redirect:/admin/";
	}
	
	@RequestMapping("home")
	public String adminAjax() {
		return "adminAjax";
	}
	
	@RequestMapping("api/getUsers")
	public @ResponseBody List<User> getUsers(){
		List<User> list = userDAO.getEmployees();
		return list;
	}
	
	@RequestMapping(value = "api/addUser", method = RequestMethod.POST)
	public @ResponseBody List<User> addUserApi(@RequestBody User user){
		userDAO.save(user);
		List<User> list = userDAO.getEmployees();
		return list;
	}
}
