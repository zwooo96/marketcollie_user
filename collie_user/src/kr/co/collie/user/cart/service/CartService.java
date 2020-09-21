package kr.co.collie.user.cart.service;

import java.util.List;

import kr.co.collie.user.cart.dao.CartDAO;
import kr.co.collie.user.cart.domain.CartGoodsDomain;

public class CartService {
	
	public List<CartGoodsDomain> getMyCart(int memberNum){
		List<CartGoodsDomain> list=null;
		
		CartDAO cDAO=CartDAO.getInstance();
		list=cDAO.selectCartGoods(memberNum);
		
		return list;
	}//getMyCart
	
}//class
