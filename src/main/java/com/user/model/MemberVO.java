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
	private int status;//
	private String statusStr;
	private java.sql.Date mdate;
	
	public String getAllHp() {
		return mhp1+"-"+mhp2+"-"+mhp3;
	}
	
	public String getAllAddr() {
<<<<<<< HEAD
		return maddr1+" "+maddr2;
=======
		return "["+mpost+"] "+maddr1+" "+maddr2;
>>>>>>> develop
	}

}
