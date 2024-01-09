package kr.co.guemsan.admin;

import lombok.Data;

@Data
public class NoticeDTO {
	private int n_no;
	private String n_writer;
	private String n_type;
	private String n_title;
	private String n_content;
	private String n_rdate;
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public String getN_type() {
		return n_type;
	}
	public void setN_type(String n_type) {
		this.n_type = n_type;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_rdate() {
		return n_rdate;
	}
	public void setN_rdate(String n_rdate) {
		this.n_rdate = n_rdate;
	}
	
	
}
