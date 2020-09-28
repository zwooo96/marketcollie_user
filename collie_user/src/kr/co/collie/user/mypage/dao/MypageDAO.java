package kr.co.collie.user.mypage.dao;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.mypage.domain.MemberInfoDomain;
import kr.co.collie.user.mypage.vo.ModifyMemberVO;
import kr.co.collie.user.mypage.vo.PassCheckVO;
import kr.co.collie.user.mypage.vo.UpdatePassVO;
import oracle.net.aso.s;

public class MypageDAO {
	private static MypageDAO mpDAO;
	
	 private MypageDAO() {
     }//MypageDAO
     
     public static MypageDAO getInstance() {
         if( mpDAO == null ) {
              mpDAO = new MypageDAO();
         }//end if
         return mpDAO;
     }//getInstance
     
     /**
      * 현재 비밀번호를 확인하는 일
      * @param pcVO
      * @return
      */
     public int selectMemberPass(PassCheckVO pcVO) {
         int member_num = 0;
         SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
         member_num = ss.selectOne("kr.co.collie.user.mypage.selectMemberPass", pcVO);
         ss.close();
         
         return member_num;
     }//selectMemberPass
     
     /**
     * 멤버 정보 가져오기
     * @param pcVO
     * @return
     */
    public MemberInfoDomain selectMemberInfo(PassCheckVO pcVO) {
    	 MemberInfoDomain mid = null;
    	 SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
    	 
    	 mid = ss.selectOne("kr.co.collie.user.mypage.selectMemberInfo", pcVO);
    	 
    	 ss.close();
    	 
    	 return mid;
     }//selectMemberInfo
     
     
     /**
      * 비밀번호를 변경하는 일
      * @param upVO
      * @return
      */
     public int updateMemberPass(UpdatePassVO upVO) {
         SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
         int cnt = ss.update("kr.co.collie.user.mypage.updateMemberPass", upVO);
         ss.close();
         
         return cnt;
     }//updateMemberPass
     
     /**
     * 멤버정보 변경
     * @param mmVO
     * @return
     */
    public int updateMemberInfo(ModifyMemberVO mmVO) {
         int cnt =0;
         
         SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
         
         cnt = ss.update("kr.co.collie.user.mypage.updateMember", mmVO);
         ss.close();
         
         return cnt;
     }//updateMemberInfo
     
    
    public static void main(String[] args) {
		PassCheckVO pcVO = new PassCheckVO();
    	pcVO.setMember_num(2);
		pcVO.setPass("tZxnvxlqR1gZHkL3ZnDOug==");
    	MypageDAO mDAO = MypageDAO.getInstance();
    	
    	System.out.println(mDAO.selectMemberInfo(pcVO));
	}
    
    
}//class
