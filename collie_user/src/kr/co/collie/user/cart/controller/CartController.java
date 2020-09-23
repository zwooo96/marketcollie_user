package kr.co.collie.user.cart.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.collie.user.cart.domain.CartGoodsDomain;
import kr.co.collie.user.cart.service.CartService;
import kr.co.collie.user.cart.vo.CartVO;

import static org.springframework.web.bind.annotation.RequestMethod.GET;

import java.util.List;

@SessionAttributes({"item_num", "item_cnt"})
@Controller
public class CartController {
	
	/**
	 * 장바구니에 상품을 추가하는 일
	 * @param session
	 * @param cVO
	 * @return
	 */
	@RequestMapping(value="/item/cart.do", method=GET)
	public String addCart(HttpSession session, CartVO cVO) {
		CartService cs = new CartService();
		cs.addCart(cVO);
		
		//장바구니로 이동할 것인지 상품상세에 계속 남아있을 것인지 결정할 수 있도록 해야함
		//일단 장바구니로 보내기
		return "forward:cart/view.do";
	}//addCart
	
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
