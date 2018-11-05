package com.tech.story;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.story.dto.CodeDTO;

@Controller
public class MainController extends ObjectController {
	String path = "main/main";
	@RequestMapping(value="/main")
	public String main(Model m) {
		return path;
	}
	
	@RequestMapping(value="/make_story")
	public String make_story(Model m) {
		List<CodeDTO> clist = cs.code_list_kind("C0002");
		m.addAttribute("clist",clist);
		m.addAttribute("center","make_story.jsp");
		return path;
	}
	
	@RequestMapping(value="/find_interest_detail", produces="applicatioin/text; charset=utf-8")
	@ResponseBody
	public String find_interest_detail(String up_code) {
		List<CodeDTO> clist = cs.code_list_kind(up_code);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("clist", clist);
		return json(map);
	}
	
	/*@RequestMapping(value="/make_story_ok")
	@ResponseBody
	public void make_story_ok(@RequestParam(value="interest") List<String> interest) {
		for(int i=0; i<interest.size(); i++) {
			System.err.println(interest.get(i));
		}
		System.err.println("!@~!@~");
	}*/
}
