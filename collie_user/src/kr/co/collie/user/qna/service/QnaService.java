package kr.co.collie.user.qna.service;

import kr.co.collie.user.qna.dao.QnaDAO;
import kr.co.collie.user.qna.vo.QnaAddVO;

public class QnaService {
	
	public boolean addQna(QnaAddVO qaVO) {
		boolean flag = false; //입력 성공? 내 
		
		QnaDAO qDAO = QnaDAO.getInstance();
		qDAO.insertQna(qaVO);
		
		if(qaVO==null) {
			flag=true; //제대로 동작 안됨
		}//end if
		
		return flag; //성공하면 false 리턴
	}//addQna
}
