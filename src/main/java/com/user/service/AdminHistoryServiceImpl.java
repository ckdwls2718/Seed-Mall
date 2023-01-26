package com.user.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.mapper.HistoryMapper;
import com.user.model.SalesDTO;
import com.user.model.SalesRateDTO;

@Service
public class AdminHistoryServiceImpl implements AdminHistoryService {
	
	@Autowired
	HistoryMapper historyMapper;
	
	@Override
	public List<SalesDTO> getSales(int year) {
		return historyMapper.getSales(year);
	}
	
	@Override
	public List<SalesRateDTO> getUpcategorySaleRate(Map<String, String> map) {
		return historyMapper.getUpcategorySaleRate(map);
	}
	
	@Override
	public List<SalesRateDTO> getDowncategorySaleRate(Map<String, String> map) {
		return historyMapper.getDowncategorySaleRate(map);
	}
}
