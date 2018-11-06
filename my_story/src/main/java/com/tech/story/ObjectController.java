package com.tech.story;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
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
	
}
