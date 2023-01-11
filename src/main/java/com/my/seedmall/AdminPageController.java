package com.my.seedmall;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.myplant.model.MyPlantVO;
import com.myplant.service.MyPlantService;
import com.user.model.PagingVO;

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

		return "admin/plantManagement";
	}
	
	// 키워주세요 식물관리 상세페이지
	@GetMapping("/plantManagementDetail")
	public String plantManagementDetail(Model m) {
		
		return "admin/plantManagement";
	}

	// 히스토리
	@GetMapping("/history")
	public String history(Model m, HttpSession ses) {

		return "admin/history";
	}

}
