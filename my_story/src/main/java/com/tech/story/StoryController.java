package com.tech.story;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.tech.story.dto.CategoryDTO;
import com.tech.story.dto.InterestDTO;
import com.tech.story.dto.StoryDTO;

@Controller
public class StoryController extends ObjectController {
	private String path = "story/story_main";
	@RequestMapping(value="/make_story_ok")
	public void make_story_ok(StoryDTO sdto, HttpServletResponse resp, HttpSession s,
			@RequestParam(value="interest") List<String> interest_list, InterestDTO idto) {
		String member_cd = s.getAttribute("member_cd").toString();
		int story_count = ss.story_count(member_cd);
		int story_detail_count = sds.story_detail_count(member_cd);
		int make_status = 0;
		idto.setMember_cd(member_cd);
		if(story_count>0 || story_detail_count>0) {	//혹시 스토리가 있는데 만들려고 할때...
			make_status = 0;
		}else {
			sdto.setMember_cd(member_cd);
			ss.make_story(sdto);	//스토리 생성
			sds.insert_story_detail(member_cd);	//스토리 디테일 생성
			make_status = 1;					// make_status 가 1일때 생성
			for(String interest : interest_list) {	//반복을 돌리면서 흥미분야를 등록
				idto.setInterest_nm(interest);
				is.add_intereset(idto);
			}
		}
		print(resp, make_status);
		
	}
	
	@RequestMapping(value="/story_main")
	public String stroy_main(Model m,String member_cd) {
		List<CategoryDTO> ctlist = cts.cate_list(member_cd);
		m.addAttribute("ctlist", ctlist);
		story_info_main(m, member_cd);		//스토리에 대한 모든 정보...
		return path(member_cd);
	}
}
