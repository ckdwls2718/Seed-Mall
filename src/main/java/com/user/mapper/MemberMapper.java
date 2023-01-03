package com.user.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.user.model.MemberVO;
import com.user.model.NotUserException;
import com.user.model.PagingVO;

public interface MemberMapper {
	int createMember(MemberVO member);

	int getMemberCount(PagingVO pvo);

	List<MemberVO> listUser(PagingVO pvo);

	MemberVO getMember(Integer midx);

	Integer emailCheck(String email);

	MemberVO findUser(MemberVO findUser);

	int deleteUser(Integer midx);

	int updateUser(MemberVO member);

	MemberVO loginCheck(String email, String pwd) throws NotUserException;

	void logout(HttpSession session) throws Exception;


	List<MemberVO> findMember(PagingVO paging);

	List<MemberVO> selectMemberAllPaging(PagingVO paging);

	List<MemberVO> selectMemberAll(Map<String, Integer> map);


}
