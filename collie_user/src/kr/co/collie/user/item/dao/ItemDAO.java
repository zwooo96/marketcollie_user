package kr.co.collie.user.item.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.item.domain.ItemListDomain;

public class ItemDAO {
	
	private static ItemDAO iDAO;
	
	private ItemDAO() {
	}
	
	public static ItemDAO getInstance() {
		if(iDAO == null) {
			iDAO = new ItemDAO();
		}
		return iDAO;
	}
	
	public List<ItemListDomain> selectSearchList(String keyword) {
		List<ItemListDomain> list = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		list = ss.selectList("selectSearchItem", keyword);
		ss.close();
		return list;
	}
}
