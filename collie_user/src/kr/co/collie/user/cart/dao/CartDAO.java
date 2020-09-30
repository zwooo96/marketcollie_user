package kr.co.collie.user.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.cart.domain.CartGoodsDomain;
import kr.co.collie.user.cart.vo.CartVO;
import kr.co.collie.user.cart.vo.ItemCntVO;
import kr.co.collie.user.dao.GetCollieHandler;

public class CartDAO {
	private static CartDAO cDAO;
	
	private CartDAO() {
		
	}//CartDAO
	
	public static CartDAO getInstance() {
		if(cDAO==null) {
			cDAO=new CartDAO();
		}//end if
		return cDAO;
	}//getInstance
	
	/**
	 * 장바구니에 상품을 추가하는 일
	 * @param cVO
	 * @return
	 */
	public int insertCart(CartVO cVO) {
		int cnt = 0;
		
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		cnt = ss.insert("insertCart", cVO);
		ss.close();
		
		return cnt;
	}//insertCart
	
	public List<CartGoodsDomain> selectCartGoods(int memberNum){
		List<CartGoodsDomain> list=null;
		
		SqlSession ss=GetCollieHandler.getInstance().getSqlSession();
		list=ss.selectList("selectCartGoods",memberNum);
		//MyBatis Handler 종료
		ss.close();
		
		return list;
	}//selectCartGoods
	
	public int updateItemCntPlus(ItemCntVO icVO) {
		int cnt=0;
		
		SqlSession ss=GetCollieHandler.getInstance().getSqlSession();
		cnt=ss.update("updateItemCnt", icVO);
		if(cnt==1) {
			ss.commit();
		}//end if
		ss.close();
		return cnt;
	}//updateItemCntPlus
	
	public int deleteSelectedItem(int[] cartNumArr) {
		int cnt=0;
		
		SqlSession ss=GetCollieHandler.getInstance().getSqlSession();
		cnt=ss.delete("deleteSelectedItem",cartNumArr);
		if(cnt==cartNumArr.length) {
			ss.commit();
		}//end if
		ss.close();
		
		return cnt;
	}//deleteSelectedItem
	
	public List<CartGoodsDomain> selectOrderGoods(int[] cartNum){
		List<CartGoodsDomain> list=null;
		
		SqlSession ss=GetCollieHandler.getInstance().getSqlSession();
		list=ss.selectList("selectOrderGoods",cartNum);
		ss.close();
		
		return list;
	}//selectCartGoods
	
}//class
