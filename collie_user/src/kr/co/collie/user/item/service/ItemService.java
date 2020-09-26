package kr.co.collie.user.item.service;

import java.util.List;

import kr.co.collie.user.item.dao.ItemDAO;
import kr.co.collie.user.item.domain.ItemListDomain;

public class ItemService {
	
	public List<ItemListDomain> getSearchList(String keyword) {
		List<ItemListDomain> list = null;
		ItemDAO iDAO = ItemDAO.getInstance();
		list = iDAO.selectSearchList(keyword);
		return list;
	}

	public List<ItemListDomain> getItemList(int cateNum) {
		List<ItemListDomain> list = null;
		ItemDAO dDAO = ItemDAO.getInstance();
		list = dDAO.selectItemList(cateNum);
		return list;
	}

}
