package kr.co.collie.user.cart.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.collie.user.cart.domain.CartGoodsDomain;
import kr.co.collie.user.cart.service.CartService;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

@Controller
public class CartController {
	
	@RequestMapping(value="/cart/view.do", method=GET)
	public String viewCart(HttpSession session, Model model) {
		
		Integer memberNum=(Integer)session.getAttribute("member_num");
		
		if( memberNum!=null ){
			CartService cs=new CartService();
			List<CartGoodsDomain> cart_list=cs.getMyCart(memberNum.intValue());
			model.addAttribute("cart_list", cart_list);
		}//end if
		
		return "cart/view_cart";
	}//viewCart
	
}//class
