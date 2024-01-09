package kr.co.guemsan.admin;

import lombok.Data;

@Data
public class addclientDTO {
	private int ac_num;
	private String ac_code;
	private String ac_colum;
	private String ac_type;
	private String ac_content;
	
    public int getAc_num() {
		return ac_num;
	}
	public void setAc_num(int ac_num) {
		this.ac_num = ac_num;
	}
	public String getAc_code() {
		return ac_code;
	}
	public void setAc_code(String ac_code) {
		this.ac_code = ac_code;
	}
	public String getAc_colum() {
		return ac_colum;
	}
	public void setAc_colum(String ac_colum) {
		this.ac_colum = ac_colum;
	}
	public String getAc_type() {
		return ac_type;
	}
	public void setAc_type(String ac_type) {
		this.ac_type = ac_type;
	}
	public String getAc_content() {
		return ac_content;
	}
	public void setAc_content(String ac_content) {
		this.ac_content = ac_content;
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
	private int startRow;
    private int endRow;
}
