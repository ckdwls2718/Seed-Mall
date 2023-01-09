package com.myplant.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myplant.mapper.MyPlantMapper;
import com.myplant.model.MyPlantVO;

@Service
public class MyPlantServiceImpl implements MyPlantService {
	
	@Autowired
	MyPlantMapper myplantMapper;

	@Override
	public int insertMyPlant(MyPlantVO plant) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMyPlantNickname(MyPlantVO plant) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMyPlant(MyPlantVO plant) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMyPlant(int plant_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MyPlantVO> getMyPlantList(int midx) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MyPlantVO getMyPlant(int plant_idx) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
