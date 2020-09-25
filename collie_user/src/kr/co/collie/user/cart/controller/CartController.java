package kr.co.collie.user.cart.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.collie.user.cart.domain.CartGoodsDomain;
import kr.co.collie.user.cart.service.CartService;
import kr.co.collie.user.cart.vo.CartVO;
import kr.co.collie.user.member.domain.LoginDomain;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

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
		
		////////////로그인 구현 완료시 구문 삭제////////////////
		LoginDomain user_info1=new LoginDomain();
		user_info1.setMember_num(2);
		user_info1.setId("test1");
		user_info1.setName("이해민");
		user_info1.setEmail("test1@gmail.com");
		user_info1.setPhone("010-1111-2222");
		user_info1.setZip_code("54321");
		user_info1.setAddr("서울특별시 마포구 풍성빌딩");
		user_info1.setAddr_detail("2층 쌍용강북교육센터");
		session.setAttribute("user_info", user_info1);
		///////////////////////////////////////////////////
		
		LoginDomain user_info=(LoginDomain)session.getAttribute("user_info");
		
		if( user_info!=null && user_info.getMember_num()!=0 ){
			List<CartGoodsDomain> cart_list=new CartService().getMyCart(user_info.getMember_num());
			model.addAttribute("cart_list", cart_list);
		}//end if
		
		return "cart/view_cart";
	}//viewCart
	
	@RequestMapping(value="/plus_cnt.do", method=POST)
	@ResponseBody
	public String plusItemCnt(String param_cart_num) throws NumberFormatException{
		String json=null;
		
		int cartNum=Integer.parseInt(param_cart_num);
		json=new CartService().plusItemCnt(cartNum);
		
		return json;
	}//plusItemCnt
	
	@RequestMapping(value="/minus_cnt.do", method=POST)
	@ResponseBody
	public String minusItemCnt(String param_cart_num) throws NumberFormatException{
		String json=null;
		
		int cartNum=Integer.parseInt(param_cart_num);
		if(cartNum>1) {
			json=new CartService().minusItemCnt(cartNum);
		}//end if
		
		return json;
	}//minusItemCnt
	
}//class
