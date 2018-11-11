package com.tech.story;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.story.dto.LikeDTO;

@Controller
public class LikeController extends ObjectController {

	@RequestMapping("add_like")
	@ResponseBody
	public String add_like(LikeDTO ldto) {
		ls.add_like(ldto);
		ldto.setMember_cd(null);			// 전체 좋아요 수를 가지고 와야해서 member_cd는 뺌
		int count = ls.like_count(ldto);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("like_count", count);
		return json(map);
	}
	@RequestMapping("delete_like")
	@ResponseBody
	public String delete_like(LikeDTO ldto) {
		ls.delete_like(ldto);
		ldto.setMember_cd(null);			// 전체 좋아요 수를 가지고 와야해서 member_cd는 뺌
		int count = ls.like_count(ldto);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("like_count", count);
		return json(map);
	}
}
