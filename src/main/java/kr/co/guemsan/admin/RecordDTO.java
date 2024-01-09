package kr.co.guemsan.admin;

import lombok.Data;

@Data
public class RecordDTO {
	private String r_acode;
	private String r_code;
	private String r_ordate;
	private String r_deli;
	private String r_title;
	private int r_total;
	private String r_pay;
	private String r_pdate;
	private int r_dpay;

	//client dto
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
	
	private String r_id;
    private int startRow;
    private int endRow;
    
    private int listmax;
    
    private String keyword;
    
	
public String getR_acode() {
		return r_acode;
	}

	public void setR_acode(String r_acode) {
		this.r_acode = r_acode;
	}

	public String getR_code() {
		return r_code;
	}

	public void setR_code(String r_code) {
		this.r_code = r_code;
	}

	public String getR_ordate() {
		return r_ordate;
	}

	public void setR_ordate(String r_ordate) {
		this.r_ordate = r_ordate;
	}

	public String getR_deli() {
		return r_deli;
	}

	public void setR_deli(String r_deli) {
		this.r_deli = r_deli;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public int getR_total() {
		return r_total;
	}

	public void setR_total(int r_total) {
		this.r_total = r_total;
	}

	public String getR_pay() {
		return r_pay;
	}

	public void setR_pay(String r_pay) {
		this.r_pay = r_pay;
	}

	public String getR_pdate() {
		return r_pdate;
	}

	public void setR_pdate(String r_pdate) {
		this.r_pdate = r_pdate;
	}

	public int getR_dpay() {
		return r_dpay;
	}

	public void setR_dpay(int r_dpay) {
		this.r_dpay = r_dpay;
	}

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

	public String getR_id() {
		return r_id;
	}

	public void setR_id(String r_id) {
		this.r_id = r_id;
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
