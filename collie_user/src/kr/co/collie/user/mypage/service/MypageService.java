package kr.co.collie.user.mypage.service;

import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import kr.co.collie.user.mypage.dao.MypageDAO;
import kr.co.collie.user.mypage.domain.MemberInfoDomain;
import kr.co.collie.user.mypage.domain.OrderListDomain;
import kr.co.collie.user.mypage.vo.DeleteMemberVO;
import kr.co.collie.user.mypage.vo.ModifyMemberVO;
import kr.co.collie.user.mypage.domain.QnaDetailDomain;
import kr.co.collie.user.mypage.domain.QnaListDomain;
import kr.co.collie.user.mypage.vo.PassCheckVO;
import kr.co.collie.user.mypage.vo.QnaVO;
import kr.co.collie.user.mypage.vo.UpdatePassVO;
import kr.co.collie.user.pagination.RangeVO;
import kr.co.sist.util.cipher.DataEncrypt;

public class MypageService {

	/**
	 * 주문 내역 목록을 불러오는 일
	 * @param rVO
	 * @return
	 */
	public List<OrderListDomain> getOrderList(RangeVO rVO){
		List<OrderListDomain> list = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		int totalCnt = getOrderListCnt(rVO);
		rVO.setTotal_cnt(totalCnt);
		rVO.setPage_scale(3);
		rVO.calcPaging();
		list = mDAO.selectOrderList(rVO);
		
		return list;
	}//getOrderList
	
	/**
	 * 주문 내역 페이지네이션을 위해 개수를 세는 일
	 * @param rVO
	 * @return
	 */
	public int getOrderListCnt(RangeVO rVO) {
		int cnt = 0;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		cnt = mDAO.selectOrderListCnt(rVO);

		return cnt;
	}//getOrderListCnt
	
	/**
	 * 주문 내역 페이지네이션을 위해 JSON 생성
	 * @param list
	 * @param rVO
	 * @return
	 */
	public String orderListJson(List<OrderListDomain> list, RangeVO rVO) {
		JSONObject jo = new JSONObject();
		jo.put("total_cnt", list.size());
		jo.put("start_num", rVO.getStart_num());
		jo.put("end_num", rVO.getEnd_num());
		
		jo.put("start_page", rVO.getStart_page());
		jo.put("end_page", rVO.getEnd_page());
		jo.put("pre_page", rVO.getPre_page());
		jo.put("next_page", rVO.getNext_page());
		
		JSONArray ja = new JSONArray();
		JSONObject joTemp = null;
		for( OrderListDomain item : list ) {
			joTemp = new JSONObject();
			joTemp.put("order_num", item.getOrder_num());
			joTemp.put("total_price", item.getTotal_price());
			joTemp.put("item_name", item.getItem_name());
			joTemp.put("item_img", item.getItem_img());
			joTemp.put("input_date", item.getInput_date());
			ja.add(joTemp);
		}//end for
		jo.put("item_list", ja);
		
		return jo.toJSONString();
	}//orderListJson
	
	
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
		try {
			upVO.setPass(DataEncrypt.messageDigest("MD5", upVO.getPass()));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}//end catch
		flag = mpDAO.updateMemberPass(upVO)==1;
		
		return flag;
	}//modifyPass
	
	/**
	 * 멤버 정보 가져오기
	 * @param pcVO
	 * @return
	 */
	public MemberInfoDomain getMemberInfo(PassCheckVO pcVO) {
		MemberInfoDomain  mid = null;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		
		mid=mDAO.selectMemberInfo(pcVO);
		
		
		return mid;
	}//getMemberInfo
	
	
	/**
	 * 멤버 정보 변경
	 * @param mmVO
	 * @return
	 */
	public boolean modifyMemberInfo(ModifyMemberVO mmVO) {
		boolean flag = false;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		flag = mDAO.updateMemberInfo(mmVO)==1;
		
		return flag;
	}//modifyMemberInfo
	
	public boolean removeMember(DeleteMemberVO dmVO) {
		
		boolean flag=false;
		
		MypageDAO mDAO = MypageDAO.getInstance();
		flag = mDAO.deleteMember(dmVO)==1;
		
		return flag;
		
	}//removeMember
	
	public List<QnaListDomain> getQnaList(int member_num){
		List<QnaListDomain> list = null;
		MypageDAO mpDAO = MypageDAO.getInstance();
		list = mpDAO.selectQnaList(member_num);
		return list;
	}//getQnaList
	

	public String getQnaDetail(QnaVO qVO) {
		JSONObject json=new JSONObject();
		
		MypageDAO mpDAO = MypageDAO.getInstance();
		QnaDetailDomain qdd=mpDAO.selectQnaDetail(qVO);
		
		String flag="fail";
		if(qdd!=null) {
			flag="success";
		}//end if
		
		json.put("flag", flag);
		json.put("qna_content", qdd.getQna_content());
		json.put("qna_reply", qdd.getQna_reply());
		json.put("reply_date", qdd.getReply_date());
		
		return json.toJSONString();
	}//getQnaDetail
}//class

	
	
