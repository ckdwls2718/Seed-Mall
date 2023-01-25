package com.my.seedmall;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.model.QNADTO;
import com.board.service.QNAService;
import com.myplant.model.MyPlantVO;
import com.myplant.model.PlantForm;
import com.myplant.model.PlantImageVO;
import com.myplant.service.MyPlantService;
import com.order.model.OrderProductVO;
import com.order.model.OrderVO;
import com.order.service.OrderService;
import com.user.model.MemberVO;
import com.user.model.PagingVO;
import com.user.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin")
public class AdminPageController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MyPlantService myPlantService;

	@Autowired
	private OrderService orderService;

	@Autowired
	private QNAService qnaService;

	// 어드민페이지 메인
	@GetMapping("/adminPage")
	public String adminPage(Model m, HttpSession session) {
		MemberVO adminUser = (MemberVO) session.getAttribute("loginUser");

		m.addAttribute("adminUser", adminUser);

		return "admin/adminPage";
	}

	// 메인에서 패스워드 일치여부 확인
	@PostMapping("/adminPage")
	public String adminPageDetail(Model m, HttpSession session, @RequestParam("pwd") String pwd) {
		MemberVO adminUser = (MemberVO) session.getAttribute("loginUser");

		int n = 0;
		if (!adminUser.getPwd().equals(pwd)) {
			n = 0;
		} else {
			n = 1;
		}
		String str = (n > 0) ? "인증 완료" : "패스워드가 일치하지 않습니다";
		String loc = (n > 0) ? "adminPageDetail" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);

		return "msg";
	}

	// 어드민페이지 상세페이지
	@GetMapping("/adminPageDetail")
	public String adminPageDetail(Model m, HttpSession session) {
		MemberVO adminUser = (MemberVO) session.getAttribute("loginUser");

		m.addAttribute("adminUser", adminUser);

		return "admin/adminPageDetail";
	}

	// 비밀번호 재설정
	@PostMapping("/adminUpdatePassword")
	public String adminUpdatePassword(Model m, @RequestParam("pwd") String pwd,
			@RequestParam("pwdCheck") String pwdCheck, HttpSession session) {
		MemberVO adminUser = (MemberVO) session.getAttribute("loginUser");

		int n = 0;
		if (pwd.equals(pwdCheck)) {
			adminUser.setPwd(pwdCheck);
			n = memberService.updatePassword(adminUser);
		} else {
			n = 0;
		}
		String str = (n > 0) ? "패스워드가 변경되었습니다" : "패스워드가 일치하지 않습니다";
		String loc = (n > 0) ? "adminPage" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);

		return "msg";
	}

	// 주문 관리
	@GetMapping("/orderManagement")
	public String orderManagement(Model m, @ModelAttribute("page") PagingVO page, HttpServletRequest req,
			@RequestHeader("user-Agent") String userAgent) {
		String myctx = req.getContextPath();
		HttpSession ses = req.getSession();

		int totalCount = orderService.getOrderCount(page);

		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);

		String loc = "admin/orderManagement";
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);

		List<OrderVO> orderArr = orderService.getOrderList_paging(page);
		for (OrderVO order : orderArr) {
			List<OrderProductVO> orderProduct = orderService.getOrderProductList(order.getDesc_oidx());
			order.setProdList(orderProduct);
		}

		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);
		m.addAttribute("orderArr", orderArr);

		return "admin/orderManagement";
	}

	// 배송상태 설정완료 시
	@PostMapping("/deliveryStatus")
	public String deliveryStatus(Model m, @ModelAttribute OrderVO ovo) {

		int n = orderService.updatedeliverystate(ovo);

		return "redirect:orderManagement";
	}

	// 배송 중인 식물 목록
	@GetMapping("deliveryManagement")
	public String deliveryManagement(Model m, @ModelAttribute("page") PagingVO page, HttpServletRequest req,
			@RequestHeader("user-Agent") String userAgent) {
		String myctx = req.getContextPath();
		HttpSession ses = req.getSession();

		int totalCount = orderService.getOrderCount(page);

		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);

		String loc = "admin/orderManagement";
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);

		List<OrderVO> orderArr = orderService.getDeliveryList_paging(page);
		for (OrderVO order : orderArr) {
			List<OrderProductVO> orderProduct = orderService.getOrderProductList(order.getDesc_oidx());
			order.setProdList(orderProduct);
		}

		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);
		m.addAttribute("orderArr", orderArr);

		return "admin/deliveryManagement";
	}

	// 키워주세요 식물관리
	@GetMapping("/plantManagement")
	public String plantManagement(Model m, @ModelAttribute com.user.model.PagingVO page, HttpServletRequest req
			,@RequestHeader("user-Agent")String userAgent) {
		log.info("page = "+page);
		
		
		String myctx = req.getContextPath();// 컨텍스트명 "/seedmall"
		HttpSession ses = req.getSession();
		
		int totalCount = myPlantService.getMyplantTotal(page);
		page.setTotalCount(totalCount);
		page.setPageSize(2);
		page.setPagingBlock(5);// 페이징 블럭 단위값: 5
		////////////////////
		page.init(ses); // 페이징 관련 연산을 수행하는 메서드 호출
		
		String loc = "admin/plantManagement";
		
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);
		
		List<MyPlantVO> plantArr = myPlantService.selectAllMyPlant(page);
		
		String stateStr = "";
		switch(page.getFindState()) {
		case 1: stateStr = "신규";break;
		case 2: stateStr = "관리중";break;
		case 3: stateStr = "완료";break;
		default: stateStr = "전체보기";break;
		
		}
		
		m.addAttribute("plantArr", plantArr);
		m.addAttribute("stateStr", stateStr);
		m.addAttribute("page", page);
		m.addAttribute("pageNavi", pageNavi);

		return "admin/plantList";
	}

	// 키워주세요 식물관리 상세페이지
	@PostMapping("/plantManagementDetail")
	public String plantManagementDetail(Model m, @RequestParam("pidx") int pidx) {
		MyPlantVO plant = myPlantService.getMyPlantDetail(pidx);

		m.addAttribute("plant", plant);

		return "admin/plantManagement";
	}

	@PostMapping(value = "/plantManagementUpdate", consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String plantManagementUpdate(Model m, @ModelAttribute PlantForm plantForm, HttpServletRequest req) {

		log.info("plantForm = " + plantForm);

		// local에 이미지 저장
		PlantImageVO piVo = myPlantService.uploadImage(plantForm.getPlantImage(), req);

		// myplant 외래키 저장
		piVo.setPlant_idx(plantForm.getPlant_idx());

		// local 이미지 이름
		plantForm.setPlantImageStr(piVo.getPimage());

		// myplant 정보 업데이트
		myPlantService.updateMyPlant(plantForm);

		// 이미지 db에 저장
		myPlantService.insertImage(piVo);

		return "redirect:plantManagement";
	}

	// 환불 내역
	@GetMapping("/refundManagement")
	public String refundManagement(Model m, @ModelAttribute("page") PagingVO page, HttpServletRequest req,
			@RequestHeader("user-Agent") String userAgent) {
		String myctx = req.getContextPath();
		HttpSession ses = req.getSession();

		int totalCount = orderService.getOrderCount(page);

		page.setTotalCount(totalCount);
		page.setPagingBlock(5);
		page.init(ses);

		String loc = "admin/orderManagement";
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);

		List<OrderVO> orderArr = orderService.getRefundList_paging(page);
		for (OrderVO order : orderArr) {
			List<OrderProductVO> orderProduct = orderService.getOrderProductList(order.getDesc_oidx());
			order.setProdList(orderProduct);
		}

		m.addAttribute("pageNavi", pageNavi);
		m.addAttribute("paging", page);
		m.addAttribute("orderArr", orderArr);

		return "admin/refundManagement";
	}

	// 환불 수정
	@PostMapping("/refundEdit")
	public String refundEdit(@ModelAttribute("ovo") OrderVO ovo) {
		int n = orderService.updatedeliverystate(ovo);

		return "redirect:refundManagement";
	}

	// Q&A 관리
	@GetMapping("/qnaManagement")
	public String qnaManagement(Model m, @ModelAttribute com.board.model.PagingVO page, HttpServletRequest req,
			@RequestHeader("user-Agent") String userAgent) {

		String myctx = req.getContextPath();
		HttpSession ses = req.getSession();

		int qnaTotal = qnaService.getQNACount(page);
		page.setTotalCount(qnaTotal);
		page.init(ses);

		String loc = "admin/qnaManagement";
		String pageNavi = page.getPageNavi(myctx, loc, userAgent);

		List<QNADTO> qArr = qnaService.getQNAList(page);

		m.addAttribute("qArr", qArr);
		m.addAttribute("pageNavi", pageNavi);

		return "admin/qnaManagement";
	}

}
