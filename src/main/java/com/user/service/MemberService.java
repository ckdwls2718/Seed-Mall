package com.user.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.user.model.GradeVO;
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
	
	// 마이페이지 회원정보 수정하는 메서드
	int updateMemberInfo(MemberVO member);

	MemberVO getMember(Integer midx);

	MemberVO findUser(MemberVO findUser) throws NotUserException;

	MemberVO loginCheck(String email, String pwd) throws NotUserException;

	void logout(HttpSession session) throws Exception;


	MemberVO findemail(MemberVO vo);

	MemberVO findPassword(MemberVO vo);

	int updatePassword(MemberVO vo);

	// 게시목록 가져오기
	List<MemberVO> selectMemberAll(Map<String,Integer> map);
	List<MemberVO> selectMemberAllPaging(PagingVO pvo);
	   
	// 검색목록 가져오기
	List<MemberVO> findMember(PagingVO pvo);
	
	//포인트 적립
	int RewardMileage(int midx,int point);
	//등급 업데이트
	int updateGrade(MemberVO mvo);

	

	


}
