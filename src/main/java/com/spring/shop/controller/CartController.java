package com.spring.shop.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.service.CartService;
import com.spring.shop.vo.CartVo;

@Controller
public class CartController {

	@Resource(name = "com.spring.shop.service.CartService")
	CartService cartService;
	
	@Autowired
	HttpServletRequest request;
	
	@RequestMapping("/cart_list") // 장바구니 리스트
	public String cartList(Model model) throws Exception {
		List<CartVo> c_list = cartService.cartListService();
		
		int total = cartService.totalAmount(); // 장바구니에 담긴 상품 총 금액 
		
		model.addAttribute("c_list", c_list);
		model.addAttribute("total", total);
		
		return "cartList";
	}
	
	// 장바구니 추가 
	@RequestMapping("/cart_insert")
	public String cartInsert(@PathVariable int idx, int cnt) throws Exception {
		
		CartVo vo = cartService.cartSelectOne(idx);
		
		// System.out.println("cart_insert !!! cnt == ? " + cnt);
		
		if(vo == null) {  // 없을 경우
			cartService.cartInsertService(idx, 1);
		} else {  // 같은 제품일 경우 갯수만 증가  
			cartService.cartUpdateService(idx, vo.getCnt()+1);
		}
		
		return "cartList";
	}
	
	// 장바구니 수정 폼 이동
	@RequestMapping("/cart_up_form/{idx}")
	public String cartUpForm(@PathVariable int idx, Model model) throws Exception {
		
		model.addAttribute("c_vo", cartService.cartSelectOne(idx));
		
		return "cart_up_form";
	}
	
	// 장바구니 수정
	@RequestMapping("/cart_update")
	public String cartUpdate(@PathVariable int idx, int cnt, Model model) throws Exception{
		
		System.out.println("cart_update !!!");
		
		cartService.cartUpdateService(idx, cnt);
		
		return "cartList";
	}
	
	// 장바구니 삭제
	@RequestMapping("/cart_delete/{idx}")
	public String cartDelete(@PathVariable int idx) throws Exception{
		cartService.cartDeleteService(idx);
		
		return "redirect:/cartList";
	}
}
