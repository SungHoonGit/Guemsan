package kr.co.guemsan.admin;

import lombok.Data;

@Data
public class InquiryDTO {
	private int ask_no;
	private String ask_id;
	public int getAsk_no() {
		return ask_no;
	}
	public void setAsk_no(int ask_no) {
		this.ask_no = ask_no;
	}
	public String getAsk_rdate() {
		return ask_rdate;
	}
	public void setAsk_rdate(String ask_rdate) {
		this.ask_rdate = ask_rdate;
	}
	public String getAsk_title() {
		return ask_title;
	}
	public void setAsk_title(String ask_title) {
		this.ask_title = ask_title;
	}
	public String getAsk_content() {
		return ask_content;
	}
	public void setAsk_content(String ask_content) {
		this.ask_content = ask_content;
	}
	public String getAsk_type() {
		return ask_type;
	}
	public void setAsk_type(String ask_type) {
		this.ask_type = ask_type;
	}
	private String ask_rdate;
	private String ask_title;
	private String ask_content;
	private String ask_type;
}
