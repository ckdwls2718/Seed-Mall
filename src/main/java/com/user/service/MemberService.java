package com.user.service;

import java.util.List;

import com.user.model.MemberVO;
import com.user.model.NotUserException;
import com.user.model.PagingVO;

public interface MemberService {
	int createMember(MemberVO Member);

	int getMemberCount(PagingVO pvo);

	List<MemberVO> listUser(PagingVO pvo);

	boolean EmailCheck(String Email);

	int deleteMember(Integer midx);

	int updateMember(MemberVO Member);

	MemberVO getMember(Integer midx);

	MemberVO findUser(MemberVO findUser) throws NotUserException;

	MemberVO loginCheck(String Email, String Pwd) throws NotUserException;

}
