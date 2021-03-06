package kr.co.collie.user.member.dao;

import java.io.IOException;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.member.vo.FindIdVO;
import kr.co.collie.user.member.vo.FindPassVO;
import kr.co.collie.user.member.vo.JoinVO;
import kr.co.collie.user.member.vo.LoginVO;
import kr.co.collie.user.member.vo.UpdatePassVO;

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
	

	public void insertMember(JoinVO jVO) throws IOException{
			
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
			
		ss.insert("kr.co.collie.user.member.insertMember", jVO);
			
		ss.commit();
		
		ss.close();
			
	}//insertMember
	
	
	public LoginDomain selectLogin(LoginVO loginVO) {
		LoginDomain logindomain = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		
		logindomain = ss.selectOne("kr.co.collie.user.member.selectLogin",loginVO);
		ss.close();
		return logindomain;
	}//loginDomain
	
	public String dupId(String id) {
		String rid = "";
		
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		rid = ss.selectOne("kr.co.collie.user.member.dupId", id);
		ss.close();
		
		return rid;
	}//dupId
	
	public String dupEmail(String email) {
		String rEmail="";
		
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		rEmail = ss.selectOne("kr.co.collie.user.member.dupEmail",email);
		ss.close();
		
		return rEmail;
		
	}//dupEmail
	
	public String selectMemberId(FindIdVO fidVO) {
		String id = "";
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		id = ss.selectOne("kr.co.collie.user.member.selectMemberId",fidVO);
//		fidVO.setEmail("gildong@gmail.com");
//		fidVO.setName("�۱浿");
		ss.close();
		return id;
	}
	
	
	public String selectMemberPass(FindPassVO fpsVO) {
		String pass ="";
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		pass = ss.selectOne("kr.co.collie.user.member.selectMemberPass",fpsVO);//id
		ss.close();
		return pass;
	}
	
	public int updateMemberPass(UpdatePassVO upVO) {
		
		int cnt=0;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		cnt = ss.update("kr.co.collie.user.member.updateMemberPass",upVO);
		if(cnt==1) {
			ss.commit();
		}
		
		ss.close();
		return cnt;
	}
	
	
}//class
