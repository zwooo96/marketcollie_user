package kr.co.collie.user.item.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.item.domain.ItemListDomain;
import kr.co.collie.user.pagination.RangeVO;

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

	/**
	 * 
	 * 카테고리 값을 이용해서 아이템 목록을 가져온다.
	 * @param rVO
	 * @return
	 */
	public List<ItemListDomain> selectItemList(RangeVO rVO) {
		List<ItemListDomain> list = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		list = ss.selectList("kr.co.collie.user.item.selectItemList",rVO);
		ss.close();
		return list;
	}
	


	public int selectItemListCnt(RangeVO rVO) {
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		int cnt = ss.selectOne("kr.co.collie.user.item.selectItemListCnt", rVO);
		ss.close();
		return cnt;
	}
	
	public static void main(String[] args) {
		RangeVO rVO = new RangeVO();
		rVO.setField_name("item_name");
		rVO.setField_value("박달재");
		rVO.setCurrent_page(1);
		
//		System.out.println(ItemDAO.getInstance().selectItemList(rVO));
		System.out.println(ItemDAO.getInstance().selectItemListCnt(rVO));
	}
	
}
