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
}
