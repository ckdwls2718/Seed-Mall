package com.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.user.model.MemberVO;
import com.user.model.NotUserException;
import com.user.model.PagingVO;

public interface MemberService {
	int createMember(MemberVO member);

	int getMemberCount(PagingVO pvo);

	List<MemberVO> listUser(PagingVO pvo);

	boolean emailCheck(String email);

	int deleteMember(Integer midx);

	int updateMember(MemberVO member);

	MemberVO getMember(Integer midx);

	MemberVO findUser(MemberVO findUser) throws NotUserException;

	MemberVO loginCheck(String email, String pwd) throws NotUserException;

	void logout(HttpSession session) throws Exception;

	MemberVO findemail(MemberVO vo);

	MemberVO findPassword(MemberVO vo);

	MemberVO updatePassword(MemberVO vo);

}
