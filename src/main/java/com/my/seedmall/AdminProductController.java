package com.my.seedmall;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.product.model.CategoryVO;
import com.product.model.PagingVO;
import com.product.model.ProductForm;
import com.product.model.ProductVO;
import com.product.service.AdminProductService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin")
@Log4j
public class AdminProductController {

	@Inject
	private AdminProductService adminProductService;

	@GetMapping("/prodForm")
	public String productForm(Model m) {
		List<CategoryVO> upCgList = adminProductService.getUpcategory();
		m.addAttribute("upCgList", upCgList);

		return "/admin/prodForm";
	}

	// ajax요청에 대해 json으로 응답데이터를 보낸다
	@ResponseBody
	@GetMapping(value = "/getDownCategory", produces = "application/json")
	public List<CategoryVO> getDownCategory(@RequestParam("upCg_code") String upCg_code) {
		List<CategoryVO> downCgList = adminProductService.getDowncategory(upCg_code);
		return downCgList;
	}
	
	@ResponseBody
	@GetMapping(value = "/getCgDetail", produces = "application/json")
	public List<CategoryVO> getCgDetail(@RequestParam("downCg_code") String downCg_code) {
		List<CategoryVO> cgDeatilList = adminProductService.getCgDetail(downCg_code);
		log.info(cgDeatilList);
		return cgDeatilList;
	}


	@PostMapping("/prodInsert")
	public String productRegister(Model m, @ModelAttribute ProductForm prod, HttpServletRequest req) {
		log.info("inprod="+prod);
		int result = adminProductService.productInsert(prod, req);
		String str = (result > 0) ? "상품등록 성공" : "등록 실패";
		String loc = (result > 0) ? "prodList" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);
		return "msg";
	}// ------------------------------------------

	@GetMapping("/prodList")
	public String productList(Model m, PagingVO page, HttpServletRequest req) {
		String myctx = req.getContextPath();// 컨텍스트명 "/seedmall"
		HttpSession ses = req.getSession();
		
		int totalCount = this.adminProductService.getProdTotal(page);
		page.setTotalCount(totalCount);
		page.setPagingBlock(5);// 페이징 블럭 단위값: 5
		////////////////////
		page.init(ses); // 페이징 관련 연산을 수행하는 메서드 호출
		List<ProductVO> prodArr = adminProductService.productList(page);
		String loc = "admin/prodList";
		String pageNavi = page.getPageNavi(myctx, loc);
		m.addAttribute("prodArr", prodArr);
		m.addAttribute("paging", page);
		m.addAttribute("pageNavi", pageNavi);

		return "admin/prodList";
	}

	@GetMapping("/prodEdit")
	public String productEdit(Model m, @RequestParam(defaultValue = "0") int pidx) {
		if (pidx == 0) {
			return "redirect:prodList";
		}

		ProductVO pvo = adminProductService.selectByPidx(pidx);
		List<CategoryVO> UpArr = adminProductService.getUpcategory();
		List<CategoryVO> DownArr = adminProductService.getDowncategory(pvo.getUpCg_code());
		m.addAttribute("pvo", pvo);
		m.addAttribute("UpArr", UpArr);
		m.addAttribute("DownArr", DownArr);

		return "admin/prodEdit";
	}

	@GetMapping("/prodDel")
	public String DeleteProduct(Model m, @RequestParam(defaultValue = "0") int pidx, HttpServletRequest req) {
		if (pidx == 0) {
			return "redirect:prodList";
		}
		int n = adminProductService.deleteProduct(pidx);
		if(n==999) {
			String str="주문내역이 있는 상품입니다";
			String loc="javascript:history.back()";
			
			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			
			return "msg";
		}else {
			int x = adminProductService.deleteImage(pidx, req);
	
			String str = (n != 0 && x > 0) ? "삭제 성공" : "삭제 실패";
			String loc = (n != 0 && x > 0) ? "prodList" : "javascript:history.back()";
	
			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
	
			return "msg";
		}
	}

	@PostMapping("/updateProd")
	public String updateProduct(Model m, @ModelAttribute ProductForm prod, HttpServletRequest req) {
//		if (pvo.getPidx() == 0) {
//			return "redirect:prodEdit";
//		}
		log.info("upprod="+prod);
		int x = adminProductService.deleteImage(prod.getPidx(), req);
		int n = adminProductService.updateProduct(prod, req);
		

		String str = (n > 0 && x > 0) ? "수정 성공" : "수정 실패";
		String loc = (n > 0 && x > 0) ? "prodList" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);

		return "msg";
	}
	
	@GetMapping("/categoryForm")
	public String categoryForm(Model m) {
		List<CategoryVO> upCgList = adminProductService.getUpcategory();
		m.addAttribute("upCgList", upCgList);
		return "/admin/categoryForm";
	}
	
	@PostMapping("/addUpcategory")
	public String addUpCg(Model m, @ModelAttribute CategoryVO cvo) {
		int n= adminProductService.insertUpcg(cvo);
		
		String str = (n > 0) ? "등록 성공" : "등록 실패";
		String loc = (n > 0) ? "prodList" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);
		return "msg";
	}
	
	@PostMapping("/addDowncategory")
	public String addDownCg(Model m, @ModelAttribute CategoryVO cvo) {
		int n= adminProductService.insertDowncg(cvo);
		
		String str = (n > 0) ? "등록 성공" : "등록 실패";
		String loc = (n > 0) ? "prodList" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);
		return "msg";
	}
	
	@PostMapping("/deleteCategory")
	public String deleteCategory(Model m, @ModelAttribute CategoryVO cvo) {
		int n= adminProductService.deleteCategory(cvo);
		if(n==999) {
			String str="카테고리내에 상품이 존재 합니다";
			String loc="javascript:history.back()";
			
			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			
			return "msg";
		}else {
			String str = (n > 0 || n == -1) ? "삭제 성공" : "삭제 실패";
			String loc = (n > 0) ? "prodList" : "javascript:history.back()";
	
			m.addAttribute("message", str);
			m.addAttribute("loc", loc);
			return "msg";
		}
	}
	
	@PostMapping("/addCgDetail")
	public String addCgDetail(Model m, @ModelAttribute CategoryVO cvo) {
		int n = adminProductService.addDetail(cvo);
		
		String str = (n > 0) ? "등록 성공" : "등록 실패";
		String loc = (n > 0) ? "prodList" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);
		return "msg";
	}
	
	@PostMapping("/deleteCgDetail")
	public String deleteCgDetail(Model m, @ModelAttribute CategoryVO cvo) {
		int n = adminProductService.deleteCgDetail(cvo);
		
		String str = (n > 0) ? "삭제 성공" : "삭제 실패";
		String loc = (n > 0) ? "prodList" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);
		return "msg";
		
	}

}
