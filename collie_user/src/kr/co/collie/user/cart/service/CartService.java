package kr.co.collie.user.cart.service;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.collie.user.cart.dao.CartDAO;
import kr.co.collie.user.cart.domain.CartGoodsDomain;
import kr.co.collie.user.cart.vo.CartVO;
import kr.co.collie.user.cart.vo.ItemCntVO;

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
	
	public String modifyItemCnt(ItemCntVO icVO) {
		JSONObject json=new JSONObject();
		json.put("flag", "fail");
		
		CartDAO cDAO=CartDAO.getInstance();
		int cnt=cDAO.updateItemCntPlus(icVO);
		if(cnt==1) {
			json.put("flag", "success");
		}
		//json.put("item_cnt",cDAO.selectItemCnt(icVO.getCartNum()));
		
		return json.toJSONString();
	}//modifyItemCnt
	
	public String removeSelectedItem(int[] cartNumArr, int memberNum) {
		JSONObject json=new JSONObject();
		json.put("flag","fail");
		
		CartDAO cDAO=CartDAO.getInstance();
		int cnt=cDAO.deleteSelectedItem(cartNumArr);
		if(cnt==cartNumArr.length) {
			json.put("flag", "success");
		}//end if
		
		return json.toJSONString();
	}//removeSelectedItem
	
}//class
