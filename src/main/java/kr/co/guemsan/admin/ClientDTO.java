package kr.co.guemsan.admin;

import lombok.Data;

@Data
public class ClientDTO {
	private String c_code;
	private String c_id;
	private String c_name;
	private String c_gender;
	private String c_address;
	private String c_address2;
	private int c_zip;
	private int c_tel;
	private String c_smscheck;
	private String c_rdate;
	
    private int startRow;
    private int endRow;
    
    private int listmax;
    
    private String keyword;

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_gender() {
		return c_gender;
	}

	public void setC_gender(String c_gender) {
		this.c_gender = c_gender;
	}

	public String getC_address() {
		return c_address;
	}

	public void setC_address(String c_address) {
		this.c_address = c_address;
	}

	public String getC_address2() {
		return c_address2;
	}

	public void setC_address2(String c_address2) {
		this.c_address2 = c_address2;
	}

	public int getC_zip() {
		return c_zip;
	}

	public void setC_zip(int c_zip) {
		this.c_zip = c_zip;
	}

	public int getC_tel() {
		return c_tel;
	}

	public void setC_tel(int c_tel) {
		this.c_tel = c_tel;
	}

	public String getC_smscheck() {
		return c_smscheck;
	}

	public void setC_smscheck(String c_smscheck) {
		this.c_smscheck = c_smscheck;
	}

	public String getC_rdate() {
		return c_rdate;
	}

	public void setC_rdate(String c_rdate) {
		this.c_rdate = c_rdate;
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getListmax() {
		return listmax;
	}

	public void setListmax(int listmax) {
		this.listmax = listmax;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
    
    
    
}
