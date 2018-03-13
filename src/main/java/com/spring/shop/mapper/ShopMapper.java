package com.spring.shop.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.spring.shop.vo.CartVo;
import com.spring.shop.vo.MemberVo;
import com.spring.shop.vo.ShopVo;

@Repository("mapper.ShopMapper")
public interface ShopMapper {

	// Shop
	public List<ShopVo> shopList(String cate) throws Exception;
	
	public int shopInsert(ShopVo s_vo) throws Exception;
	
	public int shopUpdate(ShopVo s_vo) throws Exception;
	
	public ShopVo shopView(int idx) throws Exception;
	
	// Cart 
	public List<CartVo> cartList() throws Exception;
	
	public int cartInsert(int idx, int cnt) throws Exception;
	
	public int cartUpdate(int idx, int cnt) throws Exception;
	
	public int cartDelete(int idx) throws Exception;
	
	public int totalAmount() throws Exception;
	
	public CartVo cartOne(int idx) throws Exception;
	
	// Member 
	public MemberVo memberOne(String id, String pwd) throws Exception;
	
	public MemberVo memberOneId(String id) throws Exception;

	public int memberInsert(MemberVo vo) throws Exception;
	
}
