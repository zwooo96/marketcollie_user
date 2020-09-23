package kr.co.collie.user.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.cart.domain.CartGoodsDomain;
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
	
	public List<CartGoodsDomain> selectCartGoods(int memberNum){
		List<CartGoodsDomain> list=null;
		
		SqlSession ss=GetCollieHandler.getInstance().getSqlSession();
		list=ss.selectList("selectCartGoods",memberNum);
		//MyBatis Handler Á¾·á
		ss.close();
		
		return list;
	}//selectCartGoods
	
}//class
