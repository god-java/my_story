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
import com.tech.story.dto.CommentDTO;
import com.tech.story.dto.MemberDTO;
import com.tech.story.dto.StoryDTO;
import com.tech.story.service.BoardService;
import com.tech.story.service.CategoryService;
import com.tech.story.service.CodeService;
import com.tech.story.service.CommentService;
import com.tech.story.service.InterestService;
import com.tech.story.service.LikeService;
import com.tech.story.service.MemberService;
import com.tech.story.service.StoryDetailService;
import com.tech.story.service.StoryService;
import com.tech.story.service.UploadImageService;

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
	@Autowired
	protected UploadImageService us;
	@Autowired
	protected LikeService ls;
	@Autowired
	protected CommentService cms;
	
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
	protected void comment_method(Map<String,Object> map, Integer page_num, CommentDTO cmdto) {	//댓글 리스트, 카운트박스
		//카운트박스 시작//
				int page_size = 2;
				Integer current_page = page_num;
				if(page_num==null) {
					current_page = 1;
				}
				int start_row = (current_page-1)*page_size+1;
				int end_row = current_page*page_size;
				int count = cms.comment_count(cmdto.getBoard_cd());
				
				if(count>0) {
					int page_count = count/page_size+(count%page_size==0?0:1);
					int start_page;
					if(current_page%10==0) {
						start_page = ((current_page/10)-1)*10+1;
					}else {
						start_page = (int)(current_page/10)*10+1;
					}
					int page_block = 10;
					int end_page = start_page+page_block-1;
					if(end_page>page_count) {
						end_page = page_count;
					}
					System.err.println(start_row+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22");
					System.err.println(end_row+"@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@22");
					cmdto.setStart_row(start_row);
					cmdto.setEnd_row(end_row);
					map.put("start_page", start_page);
					map.put("end_page", end_page);
					map.put("current_page", current_page);
					map.put("page_count", page_count);
					map.put("page_block", page_block);
					List<CommentDTO> clist = cms.comment_list(cmdto);
					map.put("clist", clist);
				}
	}
}
