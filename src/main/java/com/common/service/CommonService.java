package com.common.service;

import org.springframework.stereotype.Service;

@Service
public class CommonService {
	
	//이메일 암호화
	public String emailPrivate(String email) {
		String result = "";
		
		String[] strArr = email.split("@");
		String star = "";
		int index = strArr[0].length()/2;
		for(int i = 0; i<strArr[0].substring(index).length();i++) {
			star+="*";
		}
		
		String word =  strArr[0].substring(0, 5);
		result = word+star+"@"+strArr[1];
		
		return result;
	}
}
