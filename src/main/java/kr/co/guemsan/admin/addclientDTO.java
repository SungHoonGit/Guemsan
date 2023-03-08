package kr.co.guemsan.admin;

import lombok.Data;

@Data
public class addclientDTO {
	private int ac_num;
	private String ac_code;
	private String ac_colum;
	private String ac_type;
	private String ac_content;
	
    private int startRow;
    private int endRow;
}
