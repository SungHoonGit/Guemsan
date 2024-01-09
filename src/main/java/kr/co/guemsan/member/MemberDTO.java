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
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public int getM_zip() {
		return m_zip;
	}
	public void setM_zip(int m_zip) {
		this.m_zip = m_zip;
	}
	public String getM_add1() {
		return m_add1;
	}
	public void setM_add1(String m_add1) {
		this.m_add1 = m_add1;
	}
	public String getM_add2() {
		return m_add2;
	}
	public void setM_add2(String m_add2) {
		this.m_add2 = m_add2;
	}
	public String getM_tel() {
		return m_tel;
	}
	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_smscheck() {
		return m_smscheck;
	}
	public void setM_smscheck(String m_smscheck) {
		this.m_smscheck = m_smscheck;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	public String getM_rdate() {
		return m_rdate;
	}
	public void setM_rdate(String m_rdate) {
		this.m_rdate = m_rdate;
	}	
	
}
