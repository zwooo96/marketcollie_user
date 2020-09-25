package kr.co.collie.user.cart.service;

import java.util.List;

import org.json.simple.JSONObject;

import kr.co.collie.user.cart.dao.CartDAO;
import kr.co.collie.user.cart.domain.CartGoodsDomain;
import kr.co.collie.user.cart.vo.CartVO;

public class CartService {
	
	/**
	 * 장바구니에 상품을 추가하는 일
	 * @param cVO
	 * @return
	 */
	public boolean addCart(CartVO cVO) {
		boolean addFlag = false;
		
		CartDAO cDAO = CartDAO.getInstance();
		addFlag = cDAO.insertCart(cVO)==1;
		
		return addFlag;
	}//addCart
	
	public List<CartGoodsDomain> getMyCart(int memberNum){
		List<CartGoodsDomain> list=null;
		
		CartDAO cDAO=CartDAO.getInstance();
		list=cDAO.selectCartGoods(memberNum);
		
		return list;
	}//getMyCart
	
	public String plusItemCnt(int cartNum) {
		JSONObject json=new JSONObject();
		json.put("flag","fail");
		
		CartDAO cDAO=CartDAO.getInstance();
		int cnt=cDAO.updateItemCntPlus(cartNum);
		if(cnt==1) {
			json.put("flag","success");
		}
		
		return json.toJSONString();
	}//plusItemCnt
	
	public String minusItemCnt(int cartNum) {
		JSONObject json=new JSONObject();
		json.put("flag","fail");
		
		CartDAO cDAO=CartDAO.getInstance();
		int cnt=cDAO.updateItemCntMinus(cartNum);
		if(cnt==1) {
			json.put("flag","success");
		}
		
		return json.toJSONString();
	}//minusItemCnt
	
}//class
