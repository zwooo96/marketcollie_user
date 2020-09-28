package kr.co.collie.user.mypage.service;

import java.security.NoSuchAlgorithmException;

import kr.co.collie.user.mypage.dao.MypageDAO;
import kr.co.collie.user.mypage.vo.PassCheckVO;
import kr.co.collie.user.mypage.vo.UpdatePassVO;
import kr.co.sist.util.cipher.DataEncrypt;

public class MypageService {
	
	/**
	 * 현재 비밀번호를 확인하는 일
	 * @param pcVO
	 * @return
	 */
	public boolean getMemberPass(PassCheckVO pcVO) {
		boolean flag = false;
		
		MypageDAO mpDAO = MypageDAO.getInstance();
		try {
			pcVO.setPass(DataEncrypt.messageDigest("MD5", pcVO.getPass()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}//end catch
		flag = mpDAO.selectMemberPass(pcVO) != 0;
		
		return flag;
	}//getMemberPass
	
	/**
	 * 비밀번호를 변경하는 일
	 * @param upVO
	 * @return
	 */
	public boolean modifyPass(UpdatePassVO upVO) {
		boolean flag = false;
		
		MypageDAO mpDAO = MypageDAO.getInstance();
		flag = mpDAO.updateMemberPass(upVO)==1;
		
		return flag;
	}//modifyPass
}
