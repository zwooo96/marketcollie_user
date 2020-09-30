package kr.co.collie.user.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.mypage.domain.MemberInfoDomain;
import kr.co.collie.user.mypage.vo.DeleteMemberVO;
import kr.co.collie.user.mypage.vo.ModifyMemberVO;
import kr.co.collie.user.mypage.domain.QnaDetailDomain;
import kr.co.collie.user.mypage.domain.QnaListDomain;
import kr.co.collie.user.mypage.vo.PassCheckVO;
import kr.co.collie.user.mypage.vo.QnaVO;
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
    
    
    public int deleteMember(DeleteMemberVO dmVO) {
    	int cnt = 0;
    	
    	SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
    	cnt = ss.update("kr.co.collie.user.mypage.removeMember", dmVO);
    	
    	ss.close();
    	return cnt;
    }//deleteMember
     
    
    public static void main(String[] args) {
    	DeleteMemberVO dm = new  DeleteMemberVO();
    	dm.setMember_num(50);
		dm.setPass("tZxnvxlqR1gZHkL3ZnDOug==");
    	MypageDAO mDAO = MypageDAO.getInstance();
    	
    	System.out.println(mDAO.deleteMember(dm));
	}
    
	/**
	 * 비밀번호를 변경하는 일.
	 * @param upVO
	 * @return
	 */
	public int updateMemberPass(UpdatePassVO upVO) {
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		int cnt = ss.update("kr.co.collie.user.mypage.updateMemberPass", upVO);
		ss.commit();
		ss.close();
		
		return cnt;
	}//updateMemberPass
	
	public List<QnaListDomain> selectQnaList(int mNum){
		List<QnaListDomain> list = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		list = ss.selectList("selectQnaList");
		ss.close();
		
		return list;
	}//selectQnaList
	
	public QnaDetailDomain selectQnaDetail(QnaVO qVO) {
		QnaDetailDomain qdd = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		qdd = ss.selectOne("selectQnaDetail",qVO);
		ss.close();
		return qdd;
	}
	
}//class
