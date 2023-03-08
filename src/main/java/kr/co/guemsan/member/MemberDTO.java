package kr.co.guemsan.member;

import lombok.Data;

@Data
public class MemberDTO {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_birth;
	private String m_gender;
	private int m_zip;
	private String m_add1;
	private String m_add2;
	private String m_tel;
	private String m_email;
	private String m_smscheck;
	private String m_grade;
	private String m_rdate;
	
}
