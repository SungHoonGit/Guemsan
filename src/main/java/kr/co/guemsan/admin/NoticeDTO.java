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
}
