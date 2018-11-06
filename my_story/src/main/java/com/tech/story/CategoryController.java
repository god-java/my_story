package com.tech.story;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.story.dto.CategoryDTO;

@Controller
public class CategoryController extends ObjectController {

	@RequestMapping(value="/add_cate_ok")
	public void add_cate_ok(HttpServletResponse resp, CategoryDTO ctdto, HttpSession s) {
		int add_status = 0;
		String member_cd = s.getAttribute("member_cd").toString();	// 멤버코드 가져오기
		ctdto.setCate_lv(ctdto.getCate_lv()+1);					// 레벨+1 하기 (계층을 위해...)
		ctdto.setMember_cd(member_cd);								// 멤버코드 set
		cts.add_cate(ctdto);										// 카테고리 추가
		add_status = 1;												// 여기까지 왔으면 성공
		print(resp, add_status);									// view로 상태 보내주기
	}
}
