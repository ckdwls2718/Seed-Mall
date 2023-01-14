package com.my.seedmall;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	public String productList(Model m, PagingVO page) {
		// 상품을 가져온다
		List<ProductVO> prodArr = adminProductService.productList(page);
		m.addAttribute("prodArr", prodArr);

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
		int x = adminProductService.deleteImage(pidx, req);

		int n = adminProductService.deleteProduct(pidx);
		String str = (n != 0 && x > 0) ? "삭제 성공" : "삭제 실패";
		String loc = (n != 0 && x > 0) ? "prodList" : "javascript:history.back()";

		m.addAttribute("message", str);
		m.addAttribute("loc", loc);

		return "msg";
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

}
