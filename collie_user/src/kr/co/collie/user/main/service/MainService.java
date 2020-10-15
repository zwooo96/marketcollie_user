package kr.co.collie.user.main.service;

import java.util.List;

import kr.co.collie.user.main.dao.MainDAO;
import kr.co.collie.user.main.domain.CategoryDomain;
import kr.co.collie.user.main.domain.NewItemDomain;

public class MainService {
	
	/**
	 * 카테고리 목록 조회
	 * @return 카테고리 목록
	 */
	public List<CategoryDomain> getCategories() {
		List<CategoryDomain> list = null;
		MainDAO mDAO = MainDAO.getInstance();
		list = mDAO.selectCategoryList();
		return list;
	}

	/**
	 * 신제품(조회 일시 한달 전~ 조회 일시까지의 상품) 목록 조회
	 * @return 신제품 목록
	 */
	public List<NewItemDomain> getNewItems() {
		List<NewItemDomain> list = null;
		MainDAO mDAO = MainDAO.getInstance();
		list = mDAO.selectNewItems();
		return list;
	}
	
	
}
