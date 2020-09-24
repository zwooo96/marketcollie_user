package kr.co.collie.user.member.service;

<<<<<<< HEAD
import java.io.IOException;

import kr.co.collie.user.member.dao.MemberDAO;
import kr.co.collie.user.member.vo.JoinVO;
=======
import kr.co.collie.user.member.dao.MemberDAO;
import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.member.vo.LoginVO;
>>>>>>> branch 'master' of https://github.com/rectangle714/marketcollie_user.git

public class MemberService {
	
	public LoginDomain login(LoginVO loginVO) {
		LoginDomain loginDomain =  null;
		MemberDAO memDao = MemberDAO.getInstance();
		loginDomain = memDao.selectLogin(loginVO);
		return loginDomain;
	}//login

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
