package com.my.seedmall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myplant.model.MyPlantVO;
import com.myplant.model.PlantForm;
import com.myplant.model.PlantImageVO;
import com.myplant.service.MyPlantService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/adminPage")
public class AdminPageController {

	@Autowired
	private MyPlantService myPlantService;

	// 어드민페이지 메인
	@GetMapping()
	public String mypage() {
		return "admin/adminPage";
	}

	// 주문/취소 관리
	@GetMapping("/orderManagement")
	public String orderManagement(Model m, HttpSession ses) {

		return "admin/orderManagement";
	}

	// 키워주세요 식물관리
	@GetMapping("/plantManagement")
	public String plantManagement(Model m) {
		
		List<MyPlantVO> plantArr = myPlantService.selectAllMyPlant(null);
		
		m.addAttribute("plantArr", plantArr);

		return "admin/plantList";
	}
	
	// 키워주세요 식물관리 상세페이지
	@PostMapping("/plantManagementDetail")
	public String plantManagementDetail(Model m, @RequestParam("pidx") int pidx) {
		MyPlantVO plant = myPlantService.getMyPlantDetail(pidx);
		
		m.addAttribute("plant", plant);
		
		return "admin/plantManagement";
	}
	
	@PostMapping(value="/plantManagementUpdate", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String plantManagementUpdate(Model m, @ModelAttribute PlantForm plantForm, HttpServletRequest req) {
		
		
		log.info("plantForm = "+plantForm);
		
		//local에 이미지 저장 
		PlantImageVO piVo = myPlantService.uploadImage(plantForm.getPlantImage(), req);
		
		//myplant 외래키 저장
		piVo.setPlant_idx(plantForm.getPlant_idx());
		
		//local 이미지 이름 
		plantForm.setPlantImageStr(piVo.getPimage());
		
		//myplant 정보 업데이트
		myPlantService.updateMyPlant(plantForm);
		
		//이미지 db에 저장
		myPlantService.insertImage(piVo);

		return "redirect:plantManagement";
	}

	// 히스토리
	@GetMapping("/history")
	public String history(Model m, HttpSession ses) {

		return "admin/history";
	}

}
