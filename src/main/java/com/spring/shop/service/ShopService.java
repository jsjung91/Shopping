package com.spring.shop.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.shop.mapper.ShopMapper;
import com.spring.shop.vo.ShopVo;

@Service("com.spring.shop.service.ShopService")
public class ShopService {

	@Resource(name = "com.spring.shop.mapper.ShopMapper")
	ShopMapper shopMapper;
	
	// 상품 리스트
	public List<ShopVo> shopListService(String cate) throws Exception{
		return shopMapper.shopList(cate);
	}
	
	// 상품 추가
	public int shopInsertService(ShopVo s_vo) throws Exception{
		return shopMapper.shopInsert(s_vo);
	}
	
	// 상품 상세보기
	public ShopVo shopViewService(int idx) throws Exception{
		return shopMapper.shopView(idx);
	}
	
	// 상품 수정
	public int shopUpdateService(ShopVo s_vo) throws Exception{
		return shopMapper.shopUpdate(s_vo);
	}
	
}
