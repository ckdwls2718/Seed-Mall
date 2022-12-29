package com.user.mapper;

import java.util.List;

import com.user.model.MemberVO;
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

}
