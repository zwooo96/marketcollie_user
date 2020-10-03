package kr.co.collie.user.item.domain;

public class ReviewDomain {
	private int review_num;
	private String review_subject, name, input_date;
	
	public int getReview_num() {
		return review_num;
	}
	public String getReview_subject() {
		return review_subject;
	}
	public String getName() {
		return name;
	}
	public String getInput_date() {
		return input_date;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public void setReview_subject(String review_subject) {
		this.review_subject = review_subject;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setInput_date(String input_date) {
		this.input_date = input_date;
	}
	
}
