package in.co.fashion.store.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import in.co.fashion.store.entity.CategoryEntity;
import in.co.fashion.store.entity.ProductEntity;
import in.co.fashion.store.exception.DuplicateRecordException;
import in.co.fashion.store.from.BookProductForm;
import in.co.fashion.store.from.ProductForm;
import in.co.fashion.store.service.CategoryServiceInt;
import in.co.fashion.store.service.ProductServiceInt;
import in.co.fashion.store.util.DataUtility;



@Controller
@RequestMapping("/prod")
public class ProductCtl extends BaseCtl {

	@Autowired
	private ProductServiceInt service;
	
	@Autowired
	private CategoryServiceInt catService;
	
	@ModelAttribute
	public void preload(Model model) {		
		model.addAttribute("catList", catService.search(null));
	}
	
	@GetMapping
	public String display(@RequestParam(required = false) Long id,@ModelAttribute("form") ProductForm form, Model model) {
		if (form.getId() > 0) {
			ProductEntity bean=service.findByPk(id);
			form.populate(bean);
		}
		return "product-form";
	}
	
	
	@RequestMapping(value = "/detail", method = { RequestMethod.GET, RequestMethod.POST })
	public String display(@RequestParam("pid") Long pId,HttpSession session,@ModelAttribute("form") BookProductForm form, Model model) {
		
		if(pId>0) {
			ProductEntity bean=service.findByPk(pId);
			session.setAttribute("prod",bean);
			model.addAttribute("prod", bean);
		}
		return "product-detail";
	}
	
	@PostMapping
	public String submit(@RequestParam("image") MultipartFile file,@Valid @ModelAttribute("form")  ProductForm form, BindingResult bindingResult,
			Model model) {
		if (OP_RESET.equalsIgnoreCase(form.getOperation())) {
			return "redirect:prod";
		}
		try {
			if (OP_SAVE.equalsIgnoreCase(form.getOperation())) {
			
				if (bindingResult.hasErrors()) {
					return "product-form";
				}
				
				ProductEntity bean = (ProductEntity) form.getBean();
				bean.setImage(file.getBytes());
				if(bean.getId()>0) {
					service.update(bean);
					model.addAttribute("success", "Product update Successfully!!!!");
				}else {
				service.add(bean);
				model.addAttribute("success", "Product Added Successfully!!!!");
				}
				return "product-form";
			}
		} catch (DuplicateRecordException e) {
			model.addAttribute("error", e.getMessage());
			return "product-form";
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "";
	}
	
	@RequestMapping(value = "/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchList(@ModelAttribute("form") ProductForm form,
			@RequestParam(required = false) String operation,Long pidd,HttpSession session, Model model) {

		if (OP_RESET.equalsIgnoreCase(operation)) {
			return "redirect:/prod/search";
		}

		int pageNo = form.getPageNo();
		int pageSize = form.getPageSize();

		if (OP_NEXT.equals(operation)) {
			pageNo++;
		} else if (OP_PREVIOUS.equals(operation)) {
			pageNo--;
		}else if (OP_NEW.equals(operation)) {
			return "redirect:/prod";
		}

		pageNo = (pageNo < 1) ? 1 : pageNo;
		pageSize = (pageSize < 1) ? 10 : pageSize;

		if (OP_DELETE.equals(operation)) {
			ProductEntity cBean=new ProductEntity();
			cBean.setId(DataUtility.getLong(String.valueOf(pidd)));
			service.delete(cBean);
			return"redirect:/prod/search";
		}
		ProductEntity bean=(ProductEntity)form.getBean();
		List<ProductEntity> list =service.search(bean);
		List<ProductEntity> totallist =service.search(bean);
		model.addAttribute("list", list);
		

		if (list.size() == 0 && !OP_DELETE.equalsIgnoreCase(operation)) {
			model.addAttribute("error","Record not found");
		}

		int listsize = list.size();
		int total = totallist.size();
		int pageNoPageSize = pageNo * pageSize;

		form.setPageNo(pageNo);
		form.setPageSize(pageSize);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("catList", catService.search(null));
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("listsize", listsize);
		model.addAttribute("total", total);
		model.addAttribute("pagenosize", pageNoPageSize);
		model.addAttribute("form", form);
		return "product-list";
	}
	
	
	@RequestMapping(value = "/home/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchProductHome(@ModelAttribute("form") ProductForm form,
			@RequestParam(required = false) String operation,Long cId,HttpSession session, Model model) {
		
		int pageNo = form.getPageNo();
		int pageSize = form.getPageSize();

		if (OP_NEXT.equals(operation)) {
			pageNo++;
		} else if (OP_PREVIOUS.equals(operation)) {
			pageNo--;
		}
		pageNo = (pageNo < 1) ? 1 : pageNo;
		pageSize = (pageSize < 1) ? 10 : pageSize;

		ProductEntity bean=(ProductEntity)form.getBean();
		if(DataUtility.getLong(String.valueOf(cId))>0) {
			bean.setCategoryId(DataUtility.getLong(String.valueOf(cId)));
		}
		List<ProductEntity> list =service.search(bean);
		List<ProductEntity> totallist =service.search(bean);
		model.addAttribute("list", list);
		
		

		if (list.size() == 0 && !OP_DELETE.equalsIgnoreCase(operation)) {
			model.addAttribute("error","Record not found");
		}

		int listsize = list.size();
		int total = totallist.size();
		int pageNoPageSize = pageNo * pageSize;

		form.setPageNo(pageNo);
		form.setPageSize(pageSize);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("catList", catService.search(null));
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("listsize", listsize);
		model.addAttribute("total", total);
		model.addAttribute("pagenosize", pageNoPageSize);
		model.addAttribute("form", form);
		return "home-product-list";
	}
	
	@GetMapping("/getImage/{id}")
	public void getStudentPhoto(HttpServletResponse response, @PathVariable("id") long id) throws Exception {
		response.setContentType("image/jpeg");

		Blob blb=service.getImageById(id);
		
		byte[] bytes = blb.getBytes(1, (int) blb.length());
		InputStream inputStream = new ByteArrayInputStream(bytes);
		IOUtils.copy(inputStream, response.getOutputStream());
	}
	
	@GetMapping("/getSize/{id}")
	public int getStudentPhoto(@PathVariable("id") long id) throws Exception {
		CategoryEntity bean=new CategoryEntity();
		bean.setId(id);
		return catService.search(bean).size();
	}
	
}
