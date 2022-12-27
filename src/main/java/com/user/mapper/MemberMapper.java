package com.user.mapper;
import java.util.List;

import com.user.model.MemberVO;
import com.user.model.PagingVO;
public interface MemberMapper {
	int createMember(MemberVO Member);

	int getMemberCount(PagingVO pvo);

	List<MemberVO> listUser(PagingVO pvo);

	MemberVO getMember(Integer midx);

	Integer idCheck(String Email);

	MemberVO findUser(MemberVO findUser);

	int deleteUser(Integer midx);

	int updateUser(MemberVO Member);
}
