package com.spring.shop.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.shop.mapper.ShopMapper;
import com.spring.shop.vo.CartVo;

@Service("com.spring.shop.service.CartService")
public class CartService {

	@Resource(name="com.spring.shop.mapper.ShopMapper")
	ShopMapper shopMapper;
	
	// 장바구니 리스트
	public List<CartVo> cartListService() throws Exception{
		return shopMapper.cartList();
	}
	
	// 장바구니 추가
	public int cartInsertService(int idx, int cnt) throws Exception{
		return shopMapper.cartInsert(idx, cnt);
	}
	
	// 장바구니 수정
	public int cartUpdateService(int idx, int cnt) throws Exception{
		return shopMapper.cartUpdate(idx, cnt);
	}
	
	// 장바구니에 담긴 상품 삭제
	public int cartDeleteService(int idx) throws Exception{
		return shopMapper.cartDelete(idx);
	}
	
	// 조건 검색
	public CartVo cartSelectOne(int idx) throws Exception{
		return shopMapper.cartOne(idx);
	}
	
	// 총계 구하기
	public int totalAmount() throws Exception{
		int total = 0;
		return shopMapper.totalAmount();
	}
}
