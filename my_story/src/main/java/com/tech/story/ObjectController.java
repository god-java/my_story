package com.tech.story;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.tech.story.dto.CategoryDTO;
import com.tech.story.dto.MemberDTO;
import com.tech.story.dto.StoryDTO;
import com.tech.story.service.BoardService;
import com.tech.story.service.CategoryService;
import com.tech.story.service.CodeService;
import com.tech.story.service.InterestService;
import com.tech.story.service.MemberService;
import com.tech.story.service.StoryDetailService;
import com.tech.story.service.StoryService;

@Controller
public class ObjectController {

	@Autowired
	protected MemberService ms;
	@Autowired
	protected CodeService cs;
	@Autowired
	protected StoryService ss;
	@Autowired
	protected StoryDetailService sds;
	@Autowired
	protected InterestService is;
	@Autowired
	protected CategoryService cts;
	@Autowired
	protected BoardService bs;
	public void print(HttpServletResponse resp, int value) {
		try {
			resp.getWriter().print(value);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public String json(Map<String,Object> map) {
		String json = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			json = mapper.writeValueAsString(map);
		} catch (JsonProcessingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return json;
	}
	
	public String path(String member_cd) {
		String path = "";
		String theme = sds.theme_info(member_cd);
		if(theme.equals("nomal")) {
			path = "story/story_main";
		}else if(theme.equals("bnw")) {
			path = "story/story_main_bnw";
		}
		return path;
	}
	public void story_info(Model m, String member_cd, String cate_cd) {	// 스토리에 출력할 모든 데이터들을 가져오는 메소드
		CategoryDTO ctdto = cts.cate_info(cate_cd);				// 카테고리 이름을 출력해주기 위해 가져옴
		List<CategoryDTO> ctlist = cts.cate_list(member_cd);	// 카테고리 목록
		MemberDTO mdto = ms.member_info_type_cd(member_cd);		// 회원정보
		StoryDTO sdto = ss.story_info(member_cd);				//스토리 정보
		m.addAttribute("sdto",sdto);
		m.addAttribute("mdto",mdto);
		m.addAttribute("cate_nm",ctdto.getCate_nm());
		m.addAttribute("ctlist",ctlist);
	}
	public void story_info(Model m, String member_cd) {			// 카테고리 이름이 필요 없을때..
		List<CategoryDTO> ctlist = cts.cate_list(member_cd);	// 카테고리 목록
		MemberDTO mdto = ms.member_info_type_cd(member_cd);		// 회원정보
		StoryDTO sdto = ss.story_info(member_cd);				//스토리 정보
		m.addAttribute("sdto",sdto);
		m.addAttribute("mdto",mdto);
		m.addAttribute("ctlist",ctlist);
	}
}
