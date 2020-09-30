package kr.co.collie.user.main.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.main.domain.CategoryDomain;

public class MainDAO {

	private static MainDAO mDAO;

	private static SqlSessionFactory ssf;
	
	
	private MainDAO() {
	}
	
	
	public static MainDAO getInstance() {
		if(mDAO == null) {
			mDAO = new MainDAO();
		}
		return mDAO;
	}
	
	/**
	 * 카테고리 목록 조회
	 * @return
	 */
	public List<CategoryDomain> selectCategoryList() {
		List<CategoryDomain> cateList = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		cateList = ss.selectList("selectCateList");
		ss.close();
		return cateList;
	}
	

}
