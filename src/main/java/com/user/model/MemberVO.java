package com.user.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MemberVO {
	
	
	private int midx;
	private String email;
	private String pwd;
	private String mname;
	private String mhp1,mhp2,mhp3;
	private String mpost;
	private String maddr1, maddr2;
	private String grade;
	private int status;// 회원상태: 0(일반회원),-1(정지회원), -2(탈퇴회원), 9(관리자)
	private String statusStr;
	private java.sql.Date mdate;
	private int mileage;
	
	public String getAllHp() {
		return mhp1+"-"+mhp2+"-"+mhp3;
	}
	
	public String getAllAddr() {
		return maddr1+" "+maddr2;
	}
}////