package kr.co.collie.user.member.service;

import kr.co.collie.user.member.dao.MemberDAO;
import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.member.vo.LoginVO;

public class MemberService {
	
	public LoginDomain login(LoginVO loginVO) {
		LoginDomain loginDomain =  null;
		MemberDAO memDao = MemberDAO.getInstance();
		loginDomain = memDao.selectLogin(loginVO);
		return loginDomain;
	}//login

}
