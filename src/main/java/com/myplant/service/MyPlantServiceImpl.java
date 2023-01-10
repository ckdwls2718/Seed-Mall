package com.myplant.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myplant.mapper.MyPlantMapper;
import com.myplant.model.MyPlantVO;
import com.user.model.PagingVO;

@Service
public class MyPlantServiceImpl implements MyPlantService {
	
	@Autowired
	MyPlantMapper myPlantMapper;

	@Override
	public int insertMyPlant(MyPlantVO plant) {
		return myPlantMapper.insertMyPlant(plant);
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
		return myPlantMapper.getMyPlantList(midx);
	}

	@Override
	public MyPlantVO getMyPlantDetail(int plant_idx) {
		return myPlantMapper.getMyPlantDetail(plant_idx);
	}

	@Override
	public List<MyPlantVO> selectAllMyPlant(PagingVO page) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
