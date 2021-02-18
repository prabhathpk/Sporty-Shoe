package in.co.fashion.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import in.co.fashion.store.entity.CategoryEntity;
import in.co.fashion.store.from.CategoryForm;
import in.co.fashion.store.service.CategoryServiceInt;

@Controller
public class WelcomeCtl extends BaseCtl {

	@Autowired
	private CategoryServiceInt service;
	
	@GetMapping("/welcome")
	public String getWelcome(@ModelAttribute("form") CategoryForm form,Model model) {
		CategoryEntity bean=(CategoryEntity)form.getBean();
		List<CategoryEntity> list =service.search(bean);
		model.addAttribute("list", list);
		model.addAttribute("form",form);
		
		if (list.size() == 0) {
			model.addAttribute("error","Record not found");
		}
		return "welcome";
	}
	
}
