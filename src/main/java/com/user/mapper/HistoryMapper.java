package com.user.mapper;

import java.util.List;

import com.user.model.SalesDTO;

public interface HistoryMapper {
	//매출 정보 가져오기
	List<SalesDTO> getSales(int year);
}
