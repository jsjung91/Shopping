package com.spring.shop.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.shop.mapper.ShopMapper;
import com.spring.shop.vo.MemberVo;

@Service("com.spring.shop.service.MemberService")
public class MemberService {

	@Resource(name = "com.spring.shop.mapper.ShopMapper")
	ShopMapper shopMapper;
	
	static MemberService single = null;
	
	public static MemberService getInstance() {
		if(single == null)
			single = new MemberService();
		return single;
	}
	
	// 로그인 정보 1건 가져오기
	public MemberVo selectOne(String id, String pwd) throws Exception {
		return shopMapper.memberOne(id, pwd);
	}
	
	public MemberVo selectOne(String id) throws Exception {
		return shopMapper.memberOneId(id);
	}
	
	public int insert(MemberVo vo) throws Exception {
		return shopMapper.memberInsert(vo);
	}
}
