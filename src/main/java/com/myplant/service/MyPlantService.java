package com.myplant.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.myplant.model.MyPlantVO;
import com.myplant.model.PlantForm;
import com.myplant.model.PlantImageVO;
import com.user.model.PagingVO;

public interface MyPlantService {
	
	//주문 시 내 식물을 생성하는 메서드
	int insertMyPlant(MyPlantVO plant);
	
	//회원이 설정하는 닉네임
	int updateMyPlantNickname(MyPlantVO plant);
	
	//관리자가 코멘트, 성장률, 이미지를 설정
	int updateMyPlant(PlantForm plantForm);
	
	//주문 취소 시 내 식물을 삭제하는 메서드
	int deleteMyPlant(int plant_idx);
	
	//내 식물 리스트 출력
	List<MyPlantVO> getMyPlantList(int midx);
	
	//내 식물 상세페이지 출력
	MyPlantVO getMyPlantDetail(int plant_idx);
	
	// (관리자) 주문한 모든 키워주세요 식물 출력
	List<MyPlantVO> selectAllMyPlant(PagingVO page);
	
	//
	int getMyplantTotal(PagingVO page);
	
	//이미지 업로드 및 db에 저장하는 메서드
	PlantImageVO uploadImage(MultipartFile mf, HttpServletRequest req);
	
	int insertImage(PlantImageVO piVo);

}
