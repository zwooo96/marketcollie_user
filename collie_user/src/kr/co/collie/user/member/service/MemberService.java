package kr.co.collie.user.member.service;

import java.io.IOException;
import java.security.NoSuchAlgorithmException;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.collie.user.member.dao.MemberDAO;
import kr.co.collie.user.member.domain.LoginDomain;
import kr.co.collie.user.member.vo.FindIdVO;
import kr.co.collie.user.member.vo.JoinVO;
import kr.co.collie.user.member.vo.LoginVO;
import kr.co.sist.util.cipher.DataEncrypt;
public class MemberService {
	
	public LoginDomain login(LoginVO loginVO) {
		LoginDomain loginDomain =  null;
		MemberDAO memDao = MemberDAO.getInstance();
		try {
			loginVO.setPass(DataEncrypt.messageDigest("MD5", loginVO.getPass()));
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
	
	public int dupIdCheck(String id) {
		int check = 0;
		
		MemberDAO mDAO = MemberDAO.getInstance();
		
		mDAO.dupId(id);
		
		return check;
	}//dupIdCheck
	
	public String findId(FindIdVO fidVO) {
		String id = "";
		MemberDAO mDAO = MemberDAO.getInstance();
		id =  mDAO.selectMemberId(fidVO);
		return id;
	}
}//class
