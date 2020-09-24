package kr.co.collie.user.member.dao;

<<<<<<< HEAD
import java.io.IOException;
=======
import org.apache.ibatis.session.SqlSession;
>>>>>>> branch 'master' of https://github.com/rectangle714/marketcollie_user.git

<<<<<<< HEAD
import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.member.vo.JoinVO;

public class MemberDAO {
	
	
	
}//class
=======
import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.member.vo.LoginVO;

public class MemberDAO {
	
	private static MemberDAO memDAO;
	
	private MemberDAO() {
		
	}

	public static MemberDAO getInstance() {
		if(memDAO==null) {
			memDAO = new MemberDAO();
		}//end if
		
		return memDAO;
	}//getInstance
	
	public LoginDomain selectLogin(LoginVO loginVO) {
		LoginDomain logindomain = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		
		logindomain = ss.selectOne("selectLogin",loginVO);
		ss.close();
		return logindomain;
	}
}
>>>>>>> branch 'master' of https://github.com/rectangle714/marketcollie_user.git
