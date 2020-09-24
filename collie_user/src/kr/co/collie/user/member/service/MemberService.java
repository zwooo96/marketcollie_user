package kr.co.collie.user.member.service;

import java.io.IOException;

import kr.co.collie.user.member.dao.MemberDAO;
import kr.co.collie.user.member.vo.JoinVO;

public class MemberService {

	public boolean join(JoinVO jVO) {
		boolean flag = false;
		
		MemberDAO mDAO = MemberDAO.getInstance();
		try {
			if(jVO != null) {
				flag=true;
				mDAO.insertMember(jVO);
			}//end if
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
		return flag;
	}//join
	
}//class
