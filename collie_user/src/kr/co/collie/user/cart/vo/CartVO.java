package kr.co.collie.user.cart.vo;

/**
 * 장바구니에 상품을 추가하기 위한 목적의 VO
 * @author sist39
 *
 */
public class CartVO {

	private int item_cnt, item_num, member_num;

	public int getItem_cnt() {
		return item_cnt;
	}

	public int getItem_num() {
		return item_num;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setItem_cnt(int item_cnt) {
		this.item_cnt = item_cnt;
	}

	public void setItem_num(int item_num) {
		this.item_num = item_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}
	
}//class
