package kr.co.collie.user.mypage.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import kr.co.collie.user.dao.GetCollieHandler;
import kr.co.collie.user.mypage.domain.MemberInfoDomain;
import kr.co.collie.user.mypage.domain.OrderDetailDomain;
import kr.co.collie.user.mypage.domain.OrderListDomain;
import kr.co.collie.user.mypage.domain.QnaDetailDomain;
import kr.co.collie.user.mypage.domain.QnaListDomain;
import kr.co.collie.user.mypage.vo.DeleteMemberVO;
import kr.co.collie.user.mypage.vo.ModifyMemberVO;
import kr.co.collie.user.mypage.vo.MyOrderVO;
import kr.co.collie.user.mypage.vo.PassCheckVO;
import kr.co.collie.user.mypage.vo.QnaVO;
import kr.co.collie.user.mypage.vo.UpdatePassVO;
import kr.co.collie.user.pagination.RangeVO;

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
      * 주문 내역 목록을 불러오는 일
     * @param rVO
     * @return
     */
    public List<OrderListDomain> selectOrderList(RangeVO rVO){
    	 List<OrderListDomain> list = null;
    	 
    	 SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
    	 list = ss.selectList("kr.co.collie.user.mypage.selectOrderList", rVO);
    	 ss.close();
    	 
    	 return list;
     }//selectOrderList
    
    /**
     * 주문 내역 목록 페이지네이션을 위해 개수를 세는 일
     * @param rVO
     * @return
     */
    public int selectOrderListCnt(RangeVO rVO) {
    	int cnt = 0;
    	
    	SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
    	cnt = ss.selectOne("kr.co.collie.user.mypage.selectOrderListCnt", rVO);
    	ss.close();
    	
    	return cnt;
    }//selectOrderListCnt

    /**
     * 주문 내역 상세페이지를 불러오는 일
     * @param order_num
     * @return
     */
    public OrderDetailDomain selectOrderDetail(MyOrderVO moVO) {
    	OrderDetailDomain odd = null;
    	
    	SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
    	odd = ss.selectOne("kr.co.collie.user.mypage.selectOrderInfo", moVO);
    	ss.close();
    	
    	return odd;
    }//selectOrderDetail
    
    /**
     * 주문내역을 취소하는 일
     * @param moVO
     * @return
     */
    public int deleteOrder(MyOrderVO moVO) {
    	int cnt = 0;
    	
    	SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
    	ss.delete("kr.co.collie.user.mypage.deleteOrder", moVO);
    	ss.commit();
    	ss.close();
    	
    	return cnt;
    }//deleteOrder

     
     /**
      * 현재 비밀번호를 확인하는 일
      * @param pcVO
      * @return
      */
     public int selectMemberPass(PassCheckVO pcVO) {
         Integer result = 0;
         SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
         result = ss.selectOne("kr.co.collie.user.mypage.selectMemberPass", pcVO);
         if(result == null) {
        	 result = 0;
         }
         ss.close();
         
         return result.intValue();
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
         ss.commit();
         
         ss.close();
         
         return cnt;
     }//updateMemberInfo
    
    
    public int deleteMember(DeleteMemberVO dmVO) {
    	int cnt = 0;
    	
    	SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
    	cnt = ss.update("kr.co.collie.user.mypage.removeMember", dmVO);
    	
    	ss.commit();
    	
    	ss.close();
    	
    	return cnt;
    }//deleteMember
    
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
	
	public int selectQnaTotalCnt(int memberNum) {
		int cnt=0;
		
		SqlSession ss=GetCollieHandler.getInstance().getSqlSession();
		cnt=ss.selectOne("selectQnaTotalCnt", memberNum);
		ss.close();
		
		return cnt;
	}//selectQnaTotalCnt
	
	public List<QnaListDomain> selectQnaList(RangeVO rVO){
		List<QnaListDomain> list = null;
		SqlSession ss = GetCollieHandler.getInstance().getSqlSession();
		list = ss.selectList("selectQnaList",rVO);
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
