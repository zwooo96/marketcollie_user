package kr.co.collie.user.main.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	
	private SqlSession getSqlSession() {
		SqlSession ss=null;
		
		try {
			if(ssf==null) {
				//1.xml과 연결(buildpath에서 included와 Excluded룰 모두 삭제 해야 함)
				String xmlConfig="kr/co/collie/user/dao/collie_config.xml";
				Reader reader=Resources.getResourceAsReader(xmlConfig);
				//2.MyBatis Framework 생성
				ssf=new SqlSessionFactoryBuilder().build(reader);
				reader.close();//xml을 읽어들인 스트림을 끊는다.
			}//end if
			ss=ssf.openSession();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ss;
	}//getSqlSession
	
	
	/**
	 * 카테고리 목록 조회
	 * @return
	 */
	public List<CategoryDomain> selectCategoryList() {
		List<CategoryDomain> cateList = null;
		SqlSession ss = getSqlSession();
		cateList = ss.selectList("selectCateList");
		return cateList;
		
	}

	

}
