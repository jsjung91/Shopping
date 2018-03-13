package com.spring.shop.controller;

import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.shop.service.MemberService;
import com.spring.shop.vo.MemberVo;

@Controller
public class MemberController {

	@Resource(name = "com.spring.shop.service.MemberService")
	MemberService memberService;
	
	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpServletResponse response;
	
	@RequestMapping("/login_form")
	public String memberLogin(@PathVariable String id, String pwd, Model model) throws Exception{
		
		MemberVo user = memberService.selectOne(id, pwd);
		
		// 회원 정보가 없을 경우 스크립트로 alert창 띄우기
		if(user == null) {
			response.setContentType("text/html; charset=UTF-8; pageEncoding=UTF-8;");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인 정보를 확인해주세요.'); history.go(-1);</script>");
			out.flush();
		}
		
		model.addAttribute("user", user);
		
		return "redirect:/list";
	}
}
