package kr.co.guemsan.admin;

import lombok.Data;

@Data
public class ResponseDTO {
	private int ans_no;
	private String ans_content;
	public int getAns_no() {
		return ans_no;
	}
	public void setAns_no(int ans_no) {
		this.ans_no = ans_no;
	}
	public String getAns_content() {
		return ans_content;
	}
	public void setAns_content(String ans_content) {
		this.ans_content = ans_content;
	}
	
	
}
