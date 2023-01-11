package com.myplant.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.myplant.mapper.MyPlantMapper;
import com.myplant.model.MyPlantVO;
import com.myplant.model.PlantForm;
import com.myplant.model.PlantImageVO;
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
		return myPlantMapper.updateMyPlantNickname(plant);
	}

	@Override
	public int updateMyPlant(PlantForm plantForm) {
		return myPlantMapper.updateMyPlant(plantForm);
	}

	@Override
	public int deleteMyPlant(int plant_idx) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MyPlantVO> getMyPlantList(int midx) {
		List<MyPlantVO> plantArr = myPlantMapper.getMyPlantList(midx);
		
		return plantArr;
	}

	@Override
	public MyPlantVO getMyPlantDetail(int plant_idx) {
		
		MyPlantVO plant = myPlantMapper.getMyPlantDetail(plant_idx);
		List<PlantImageVO> piVoArr = myPlantMapper.getPlantImages(plant.getPlant_idx());
		plant.setPlantImageList(piVoArr);
		
		return plant;
	}

	@Override
	public List<MyPlantVO> selectAllMyPlant(PagingVO page) {
		return myPlantMapper.selectAllMyPlant(page); 
	}
	
	@Override
	public PlantImageVO uploadImage(MultipartFile mf, HttpServletRequest req) {
		PlantImageVO piVo = new PlantImageVO();

		ServletContext app = req.getServletContext();
		String upDir = app.getRealPath("/resources/plant_images");

		File dir = new File(upDir);
		if (!dir.exists()) {
			dir.mkdirs();// 업로드할 디렉토리 생성
		}

		/* 파일 이름 */
		String uploadFileName = mf.getOriginalFilename();
		
		/* uuid 적용 파일 이름 */
		String uuid = UUID.randomUUID().toString();
		uploadFileName = uuid + "_" + uploadFileName;
		piVo.setPimage(uploadFileName);

		/* 파일 저장 */
		try {
			/* 파일 위치, 파일 이름을 합친 File 객체 */
			File saveFile = new File(upDir, uploadFileName);
			mf.transferTo(saveFile);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return piVo;
	}
	
	@Override
	public int insertImage(PlantImageVO piVo) {
		return myPlantMapper.insertImage(piVo); 
	}
		
}
