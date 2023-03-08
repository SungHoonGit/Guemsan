package kr.co.guemsan.admin;

import lombok.Data;

@Data
public class InquiryDTO {
	private int ask_no;
	private String ask_id;
	private String ask_rdate;
	private String ask_title;
	private String ask_content;
	private String ask_type;
}
