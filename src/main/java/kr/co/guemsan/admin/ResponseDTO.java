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
}
