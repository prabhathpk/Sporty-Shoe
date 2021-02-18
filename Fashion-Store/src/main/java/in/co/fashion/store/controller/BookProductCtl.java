package in.co.fashion.store.controller;


import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.co.fashion.store.entity.BookProductEntity;
import in.co.fashion.store.entity.CartEntity;
import in.co.fashion.store.entity.ProductEntity;
import in.co.fashion.store.entity.UserEntity;
import in.co.fashion.store.from.BookProductForm;
import in.co.fashion.store.from.ProductForm;
import in.co.fashion.store.service.BookProductServiceInt;
import in.co.fashion.store.service.CartServiceInt;
import in.co.fashion.store.service.ProductServiceInt;
import in.co.fashion.store.util.DataUtility;



@Controller
@RequestMapping("/bookProd")
public class BookProductCtl extends BaseCtl {

	@Autowired
	private ProductServiceInt productService;
	
	@Autowired
	private BookProductServiceInt service;
	
	@Autowired
	private CartServiceInt cartService;
	
	@GetMapping
	public String display(HttpSession session,@ModelAttribute("form") BookProductForm form, Model model) {
		
		CartEntity cbean = new CartEntity();
		UserEntity uBean=(UserEntity)session.getAttribute("userLogin");
		cbean.setUserId(uBean.getId());
		List<CartEntity> list = cartService.search(cbean);
		model.addAttribute("list", list);

		

		long totalprice=0;
		Iterator<CartEntity> it=list.iterator();
		while (it.hasNext()) {
			CartEntity cartEntity = (CartEntity) it.next();
			totalprice=totalprice+DataUtility.getLong(cartEntity.getPrice());
		}
		
		model.addAttribute("totalAmt", totalprice);
		
		form.setMobileNo(uBean.getMobileNo());
		form.setName(uBean.getFirstName()+" "+uBean.getLastName());
		return "book-product-form";
	}
	
	
	
	
	@PostMapping
	public String submit(@Valid @ModelAttribute("form") BookProductForm form, BindingResult bindingResult,
			Model model,HttpSession session) {
		if (OP_CANCEL.equalsIgnoreCase(form.getOperation())) {
			return "redirect:/prod/search";
		}
		
		System.out.println(form.getOperation());
		
		UserEntity uBean=(UserEntity)session.getAttribute("userLogin");
		form.setMobileNo(uBean.getMobileNo());
		form.setName(uBean.getFirstName()+" "+uBean.getLastName());
		BookProductEntity bean=(BookProductEntity)form.getBean();
		
		try {
			System.out.println("In Book Prod "+form.getOperation());
			if (OP_PAYMENT.equalsIgnoreCase(form.getOperation())) {
			
				System.out.println("Before"+form.getOperation());
				
				if (bindingResult.hasErrors()) {
					System.out.println(bindingResult);
					CartEntity cbean = new CartEntity();
					cbean.setUserId(uBean.getId());
					List<CartEntity> list = cartService.search(cbean);
					model.addAttribute("list", list);
					long totalprice=0;
					Iterator<CartEntity> it=list.iterator();
					while (it.hasNext()) {
						CartEntity cartEntity = (CartEntity) it.next();
						totalprice=totalprice+DataUtility.getLong(cartEntity.getPrice());
					}
					model.addAttribute("totalAmt", totalprice);
					return "book-product-form";
				}
				session.setAttribute("pBDetail",bean);
				return "payment";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return "book-product-form";
		} 
		
		return "payment";
	}
	
	
	@PostMapping("/payment")
	public String submit(@RequestParam("operation") String operation,
			Model model,HttpSession session) {
		try {
			if (OP_CONFIRM_PAYMENT.equalsIgnoreCase(operation)) {
				
				CartEntity cbean = new CartEntity();
				UserEntity uBean=(UserEntity)session.getAttribute("userLogin");
				cbean.setUserId(uBean.getId());
				List<CartEntity> list = cartService.search(cbean);
				model.addAttribute("list", list);
				long totalprice=0;
				Iterator<CartEntity> it=list.iterator();
				while (it.hasNext()) {
					CartEntity cartEntity = (CartEntity) it.next();
					totalprice=totalprice+DataUtility.getLong(cartEntity.getPrice());
				}
				model.addAttribute("totalAmt", totalprice);
				
				BookProductEntity bean=(BookProductEntity)session.getAttribute("pBDetail");
				
				
				Iterator<CartEntity> iit=list.iterator();
				while (iit.hasNext()) {
					CartEntity cartEntity = (CartEntity) iit.next();
					bean.setProductId(cartEntity.getProductId());
					bean.setUserId(uBean.getId());
					bean.setDate(DataUtility.getCurrentTimestamp());
					bean.setAnmount(cartEntity.getPrice());
					bean.setProductName(cartEntity.getProductName());
					bean.setQuantity(cartEntity.getQuantity());
					service.add(bean);
					cartService.delete(cartEntity);
				}
				model.addAttribute("success","Product Booked Successfully!!");
			
				return "success";
			}
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("error", e.getMessage());
			return "payment";
		} 
		return "success";
	}
	
	@RequestMapping(value = "/search", method = { RequestMethod.GET, RequestMethod.POST })
	public String searchList(@ModelAttribute("form") BookProductForm form,
			@RequestParam(required = false) String operation,HttpSession session, Model model) {

		if (OP_RESET.equalsIgnoreCase(operation)) {
			return "redirect:/bookProd/search";
		}

		int pageNo = form.getPageNo();
		int pageSize = form.getPageSize();

		if (OP_NEXT.equals(operation)) {
			pageNo++;
		} else if (OP_PREVIOUS.equals(operation)) {
			pageNo--;
		}

		pageNo = (pageNo < 1) ? 1 : pageNo;
		pageSize = (pageSize < 1) ? 10 : pageSize;

		if (OP_DELETE.equals(operation)) {
			pageNo = 1;
			if (form.getIds() != null) {
				for (long id : form.getIds()) {
					BookProductEntity bean = new BookProductEntity();
					bean.setId(id);
					service.delete(bean);
				}
				model.addAttribute("success","Deleted Successfully!!!");
			} else {
				model.addAttribute("error","Select at least one record");
			}
		}
		
		BookProductEntity bean=(BookProductEntity)form.getBean();
		UserEntity uBean=(UserEntity)session.getAttribute("userLogin");
		if(uBean.getRoleId()==2) {
			bean.setUserId(uBean.getId());
		}
		List<BookProductEntity> list =service.search(bean, pageNo, pageSize);
		List<BookProductEntity> totallist =service.search(bean);
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
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("listsize", listsize);
		model.addAttribute("total", total);
		model.addAttribute("pagenosize", pageNoPageSize);
		model.addAttribute("form", form);
		return "book-product-list";
	}
	
}
