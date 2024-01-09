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
    
}
