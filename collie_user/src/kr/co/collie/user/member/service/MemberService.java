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
			jVO.setPass(DataEncrypt.messageDigest("MD5", jVO.getPass()));
			if(jVO != null) {
				flag=true;
				mDAO.insertMember(jVO);
			}//end if
		} catch (IOException e) {
			e.printStackTrace();
		}catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}//end catch
		
		return flag;
	}//join
	
	public String dupIdCheck(String id) {
		String rid = "";
		
		MemberDAO mDAO = MemberDAO.getInstance();
		
		rid=mDAO.dupId(id);
		
		JSONObject json=new JSONObject();
		json.put("id_dup_result", rid != null);
		
		return json.toJSONString();
	}//dupIdCheck
	
	public String dupEmailCheck(String email){
		String rEmail = "";
		
		MemberDAO mDAO = MemberDAO.getInstance();
		
		rEmail = mDAO.dupEmail(email);
		
		JSONObject json = new JSONObject();
		json.put("email_dup_result", rEmail != null );
		
		return json.toJSONString();
	}//dupEmailCheck
	
	
	
	public String findId(FindIdVO fidVO) {
		String id = "";
		MemberDAO mDAO = MemberDAO.getInstance();
		id =  mDAO.selectMemberId(fidVO);
		return id;
	}//findId
	
	
}//class
