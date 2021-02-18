package in.co.fashion.store.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.User.UserBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import in.co.fashion.store.entity.CartEntity;
import in.co.fashion.store.entity.ProductEntity;
import in.co.fashion.store.entity.UserEntity;
import in.co.fashion.store.exception.DuplicateRecordException;
import in.co.fashion.store.from.CartForm;
import in.co.fashion.store.from.ProductForm;
import in.co.fashion.store.service.CartServiceInt;
import in.co.fashion.store.service.ProductServiceInt;
import in.co.fashion.store.util.DataUtility;

@Controller
@RequestMapping("/cart")
public class CartCtl extends BaseCtl {

	@Autowired
	private CartServiceInt service;

	@Autowired
	private ProductServiceInt productService;

	
	
	
	@GetMapping
	public String searchList(@ModelAttribute("form") CartForm form, @RequestParam(required = false) String operation,
			Long pId,Long crId, HttpSession session, Model model) {

		if (OP_RESET.equalsIgnoreCase(operation)) {
			return "redirect:/cart";
		}
		try {

			if (OP_ADDCART.equalsIgnoreCase(operation)) {
				ProductEntity pBean = productService.findByPk(pId);
				UserEntity uBean = (UserEntity) session.getAttribute("userLogin");
				CartEntity ctEntity=service.findByProductAndUser(pId, uBean.getId());
				if(ctEntity==null) {
				CartEntity cEntity = new CartEntity();
				cEntity.setProductId(pId);
				cEntity.setUserId(uBean.getId());
				cEntity.setProductName(pBean.getName());
				cEntity.setPrice(pBean.getPrice());
				cEntity.setDescription(pBean.getDescription());
				cEntity.setQuantity("1");
				service.add(cEntity);
				}
				return "redirect:/cart";
			}
		} catch (DuplicateRecordException e) {
			e.printStackTrace();
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
			long cId=DataUtility.getLong(String.valueOf(crId));
			CartEntity dBean=new CartEntity();
			dBean.setId(cId);
			service.delete(dBean);
			return "redirect:/cart";
		}
		CartEntity bean = (CartEntity) form.getBean();
		List<CartEntity> list = service.search(bean);
		List<CartEntity> totallist = service.search(bean);
		model.addAttribute("list", list);

		if (list.size() == 0 && !OP_DELETE.equalsIgnoreCase(operation)) {
			model.addAttribute("error", "Record not found");
		}

		int listsize = list.size();
		int total = totallist.size();
		int pageNoPageSize = pageNo * pageSize;
		long totalprice=0;
		Iterator<CartEntity> it=list.iterator();
		while (it.hasNext()) {
			CartEntity cartEntity = (CartEntity) it.next();
			totalprice=totalprice+DataUtility.getLong(cartEntity.getPrice());
		}
		
		form.setPageNo(pageNo);
		form.setPageSize(pageSize);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("listsize", listsize);
		model.addAttribute("total", total);
		model.addAttribute("totalAmt", totalprice);
		model.addAttribute("pagenosize", pageNoPageSize);
		model.addAttribute("form", form);
		return "cart-list";
	}
	
	@PostMapping
	public String submit(@ModelAttribute("form") CartForm form, @RequestParam(required = false) String operation, HttpSession session, Model model) {

		if (OP_RESET.equalsIgnoreCase(operation)) {
			return "redirect:/cart";
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
					CartEntity bean = new CartEntity();
					bean.setId(id);
					service.delete(bean);
				}
				model.addAttribute("success", "Deleted Successfully!!!");
			} else {
				model.addAttribute("error", "Select at least one record");
			}
		}
		CartEntity bean = (CartEntity) form.getBean();
		List<CartEntity> list = service.search(bean);
		List<CartEntity> totallist = service.search(bean);
		model.addAttribute("list", list);

		if (list.size() == 0 && !OP_DELETE.equalsIgnoreCase(operation)) {
			model.addAttribute("error", "Record not found");
		}

		int listsize = list.size();
		int total = totallist.size();
		int pageNoPageSize = pageNo * pageSize;
		long totalprice=0;
		Iterator<CartEntity> it=list.iterator();
		while (it.hasNext()) {
			CartEntity cartEntity = (CartEntity) it.next();
			totalprice=totalprice+DataUtility.getLong(cartEntity.getPrice());
		}
		
		form.setPageNo(pageNo);
		form.setPageSize(pageSize);
		model.addAttribute("pageNo", pageNo);
		model.addAttribute("pageSize", pageSize);
		model.addAttribute("listsize", listsize);
		model.addAttribute("total", total);
		model.addAttribute("totalprice", totalprice);
		model.addAttribute("pagenosize", pageNoPageSize);
		model.addAttribute("form", form);
		return "cart-list";
	}
	
	@RequestMapping(value = "/update", method = { RequestMethod.GET, RequestMethod.POST })
	public String submitUpdate(HttpServletRequest request,@ModelAttribute("form") CartForm form, @RequestParam(required = false) String operation, HttpSession session, Model model) {

		if (OP_RESET.equalsIgnoreCase(operation)) {
			return "redirect:/cart";
		}
		try {
		UserEntity userEntity=(UserEntity)session.getAttribute("userLogin");
		CartEntity cEntity=new CartEntity();
		cEntity.setUserId(userEntity.getId());
		List<CartEntity> list=service.search(cEntity);
		int i=1;
		int q=1;
		System.out.println("In Post Method:::");
		Iterator<CartEntity> it=list.iterator();
		while (it.hasNext()) {
			CartEntity cartEntity = (CartEntity) it.next();
			cartEntity.setQuantity(DataUtility.getString(request.getParameter("quantity"+i++)));
			cartEntity.setPrice(String.valueOf(DataUtility.getLong(cartEntity.getPrice())*DataUtility.getLong(cartEntity.getQuantity())));
			service.update(cartEntity);
		}
		} catch (DuplicateRecordException e) {
			e.printStackTrace();
		}
		return "redirect:/cart"; 
		
	}

}
