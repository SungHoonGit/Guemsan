package kr.co.guemsan.member;

import lombok.Data;

@Data
public class LoginDTO {
   private String m_id;				//아이디
   private String m_pw;				//비밀번호
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
}
