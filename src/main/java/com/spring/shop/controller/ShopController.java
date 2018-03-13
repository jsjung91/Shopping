package com.spring.shop.controller;

import java.io.File;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.spring.shop.service.ShopService;
import com.spring.shop.vo.ShopVo;

@Controller
public class ShopController {

	@Resource(name = "com.spring.shop.service.ShopService")
	ShopService shopService;
	
	@Autowired
	HttpServletRequest request;

	@RequestMapping("/list") // 제품 리스트
	public String shopList(Model model, String category) throws Exception {

		if (category == null || category.isEmpty()) {
			category = "sho001";
		}

		List<ShopVo> list = shopService.shopListService(category);

		model.addAttribute("list", list);

		return "product_list";
	}

	@RequestMapping("/view/{idx}") // 제품 상세보기
	private String shopView(@PathVariable int idx, Model model) throws Exception {
		//model.addAttribute("s_vo", shopService.shopViewService(idx));
		model.addAttribute("vo", shopService.shopViewService(idx));

		return "view";
	}

	// 제품 등록 페이지로 이동
	@RequestMapping("/insert_form")
	private String shopInsertForm() {
		return "product_reg_form";
	}

	@RequestMapping("/insert") // 상품 등록
	private String shopInsertPro(@RequestPart MultipartFile files) throws Exception {

		ShopVo s_vo = new ShopVo();

		String saveDirectory = request.getServletContext().getRealPath("/images/");

		int maxSize = 1024 * 1024 * 100; // 100MB

		MultipartRequest mr = new MultipartRequest(request, saveDirectory, maxSize, "utf-8", new DefaultFileRenamePolicy());

		String p_image_s = "no_file"; // 업로드 된 파일 명
		File f = mr.getFile("photo_s"); // 업로드 된 파일 명 정보
		
		if (f != null) {
			p_image_s = f.getName(); // 파일명
		}
		
		String p_image_l = "no_file";
		f = mr.getFile("photo_l");
		
		if (f != null) {
			p_image_l = f.getName();
		}
		
		// 데이터 받기
		String category = mr.getParameter("category");
		String p_num = mr.getParameter("p_num");
		String p_name = mr.getParameter("p_name");
		String p_company = mr.getParameter("p_company");
		String p_content = mr.getParameter("p_content");
		int p_price = Integer.parseInt(mr.getParameter("p_price"));
		int p_saleprice = Integer.parseInt(mr.getParameter("p_saleprice"));

		s_vo.setCategory(category);
		s_vo.setP_company(p_company);
		s_vo.setP_content(p_content);
		s_vo.setP_image_l(p_image_l);
		s_vo.setP_image_s(p_image_s);
		s_vo.setP_name(p_name);
		s_vo.setP_num(p_num);
		s_vo.setP_price(p_price);
		s_vo.setP_saleprice(p_saleprice);

		shopService.shopInsertService(s_vo);

		return "redirect:/list";
	}

	@RequestMapping("/update_form/{idx}")
	private String shopUpdateForm(@PathVariable int idx, Model model) throws Exception {
		ShopVo s_vo = shopService.shopViewService(idx);

		model.addAttribute("s_vo", s_vo);

		return "product_update";
	}

	// 상품 수정
	@RequestMapping("/update")
	private String shopUpdate() throws Exception {
		
		ShopVo s_vo = new ShopVo();

		s_vo.setCategory(request.getParameter("category"));
		s_vo.setP_company(request.getParameter("p_company"));
		s_vo.setP_name(request.getParameter("p_name"));
		s_vo.setP_num(request.getParameter("p_num"));
		s_vo.setP_content(request.getParameter("p_content"));

		shopService.shopUpdateService(s_vo);

		return "redirect:/list";
	}
}
