package com.user.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.user.model.GradeVO;
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
	
	// 마이페이지 회원정보 수정하는 메서드
	int updateMemberInfo(MemberVO member);

	MemberVO loginCheck(String email, String pwd) throws NotUserException;

	void logout(HttpSession session) throws Exception;
	
	MemberVO findemail(MemberVO vo);
	
	MemberVO findPassword(MemberVO vo);
	
	int updatePassword(MemberVO vo);
	
	


	List<MemberVO> findMember(PagingVO paging);

	List<MemberVO> selectMemberAllPaging(PagingVO paging);

	List<MemberVO> selectMemberAll(Map<String, Integer> map);

	int updateGrade(MemberVO mvo);

	String getGrade(int mileage);

	int RewardMileage(@Param("midx")int midx, @Param("point")int point);
	
	int getMileage(int midx);
	
	//등급 할인률 가져오기
	GradeVO getDrate(MemberVO mvo);
	
	//자신의 다음 등급 가져오기
	GradeVO getNextGrade(MemberVO mvo);
	
	

}
