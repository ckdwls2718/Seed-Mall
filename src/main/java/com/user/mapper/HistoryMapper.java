package com.user.mapper;

import java.util.List;
import java.util.Map;

import com.user.model.SalesDTO;
import com.user.model.SalesRateDTO;

public interface HistoryMapper {
	//매출 정보 가져오기
	List<SalesDTO> getSales(int year);
	
	//상위 카테고리 판매량 가져오기
	List<SalesRateDTO> getUpcategorySaleRate(Map<String,String> map);
		
	//하위 카테고리 판매량 가져오기
	List<SalesRateDTO> getDowncategorySaleRate(Map<String,String> map);
}
