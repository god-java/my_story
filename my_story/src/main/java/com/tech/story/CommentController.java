package com.tech.story;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.story.dto.CommentDTO;

@Controller
public class CommentController extends ObjectController {
	
	@RequestMapping(value="write_comment_ok",produces="application/text; charset=utf-8")
	@ResponseBody
	public String write_comment_ok(CommentDTO cmdto, Integer page_num) {
		cms.write_comment(cmdto);
		Map<String,Object> map = new HashMap<String,Object>();
		comment_method(map, page_num, cmdto);
		return json(map);
	}
	
	@RequestMapping(value="comment_list",produces="application/text; charset=utf-8")
	@ResponseBody
	public String comment_list(CommentDTO cmdto,Integer page_num) {
		Map<String,Object> map = new HashMap<String,Object>();
		comment_method(map, page_num, cmdto);
		return json(map);
	}
}
