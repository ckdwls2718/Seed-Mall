package com.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.user.mapper.HistoryMapper;
import com.user.model.SalesDTO;

@Service
public class AdminHistoryServiceImpl implements AdminHistoryService {
	
	@Autowired
	HistoryMapper historyMapper;
	
	@Override
	public List<SalesDTO> getSales(int year) {
		return historyMapper.getSales(year);
	}
	
}
