package com.myplant.mapper;

import java.util.List;

import com.myplant.model.MyPlantVO;

public interface MyPlantMapper {
	//주문 시 내 식물을 생성하는 메서드
	int insertMyPlant(MyPlantVO plant);
	
	//회원이 설정하는 닉네임
	int updateMyPlantNickname(MyPlantVO plant);
	
	//관리자가 코멘트, 성장률, 이미지를 설정
	int updateMyPlant(MyPlantVO plant);
	
	//주문 취소 시 내 식물을 삭제하는 메서드
	int deleteMyPlant(int plant_idx);
	
	//내 식물 리스트 출력
	List<MyPlantVO> getMyPlantList(int midx);
	
	//내 식물 상세페이지 출력
	MyPlantVO getMyPlant(int plant_idx);	
}
