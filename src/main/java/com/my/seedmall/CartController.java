package com.my.seedmall;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.product.model.CartVO;
import com.product.model.ProductVO;
import com.product.service.CartService;
import com.product.service.ProductService;
import com.user.model.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/user")
@Log4j
public class CartController {
	
	@Autowired
	CartService cartService;
	
	@Autowired
	ProductService prodService;
	
	@GetMapping("/cart")
	public String cartList(Model m, HttpServletRequest req) {
		HttpSession ses = req.getSession();
		MemberVO loginUser = (MemberVO)ses.getAttribute("loginUser");
		
		List<CartVO> cartArr = cartService.selectMyCartList(loginUser.getMidx());
		int cartTotalPrice = 0;
		
		for(CartVO cart : cartArr) {
			ProductVO prod = prodService.selectByIdx(cart.getPidx());
			cart.setProduct(prod);
			
			int prodTotalPrice = prod.getPsaleprice()*cart.getPqty();
			cartTotalPrice += prodTotalPrice;
			
			cart.setCtotalprice(prodTotalPrice);
		}
		m.addAttribute("cartArr", cartArr);
		m.addAttribute("cartTotalPrice", cartTotalPrice);
		
		return "member/cartList";
	}
	
	@PostMapping("/cart")
	public String insertCart(Model m, HttpServletRequest req, @ModelAttribute CartVO cart) {
		
		HttpSession ses = req.getSession();
		MemberVO loginUser = (MemberVO)ses.getAttribute("loginUser");
		if(loginUser == null) {
			m.addAttribute("loc", "javascript:history.back()");
			m.addAttribute("message", "로그인 후 이용해 주세요");
			return "msg";
		}
		int midx = loginUser.getMidx();
		
		cart.setMidx(midx);
		
		int result = cartService.insertCart(cart);
		
		log.info("cart = "+cart);
		
		String msg = (result>0) ? "장바구니에 등록되었습니다" : "장바구니 등록에 실패하였습니다";
		
		m.addAttribute("loc", "javascript:history.back()");//새로고침
		m.addAttribute("message", msg);
		return "msg";
	}
	
	@PostMapping(value="/cartDel", produces = "application/json")
	@ResponseBody
	public ModelMap deleteCart(CartVO cart) {
		
		log.info("cart = "+cart);
		ModelMap map = new ModelMap();
		int result = cartService.deleteCart(cart.getCart_idx());
		
		map.put("result", result);
		
		return map;
	}
	
	@PostMapping(value="/cartEdit", produces = "application/json")
	@ResponseBody
	public ModelMap updateCart(CartVO cart) {
		
		log.info("cart = "+cart);
		ModelMap map = new ModelMap();
		int result = cartService.updateCart(cart);
		
		map.put("result", result);
		
		return map;
	}
}
