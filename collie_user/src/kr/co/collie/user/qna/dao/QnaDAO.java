package kr.co.collie.user.qna.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.qna.vo.QnaAddVO;

public class QnaDAO {
	
	private static QnaDAO qDAO;
	
	private QnaDAO() {
		
	}
	
	public static QnaDAO getInstance() {
		if(qDAO==null) {
			qDAO = new QnaDAO();
		}//end if
		return qDAO;
	}//getInstance
	
	
	public int insertQna(QnaAddVO qaVO) {
		int cnt=0;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		ss.insert("insertQna",qaVO);
		if(cnt==1) {
			ss.commit();
		}
		ss.close();
		return cnt;
	}//insertQna

}
