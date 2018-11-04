package com.tech.story;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tech.story.dto.CodeDTO;

@Controller
public class CodeController extends ObjectController {

	String path = "admin/admin_main";
	
	@RequestMapping(value="/admin_main")
	public String admin_main(Model m) {
		/*m.addAttribute("center","add_code.jsp");*/
		return path;
	}
	
	@RequestMapping(value="/add_code")
	public String add_code(Model m) {
		m.addAttribute("center","add_code.jsp");
		return path;
	}
	
	@RequestMapping(value="/code_list", produces="application/text; charset=utf-8")
	@ResponseBody
	public String code_list() {
		List<CodeDTO> clist = cs.code_list();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("clist", clist);
		return json(map);
	}
	
	@RequestMapping(value="/code_info",produces="application/text; charset=utf-8")
	@ResponseBody
	public String code_info(String code_cd) {
		CodeDTO cdto = cs.code_info(code_cd);
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("cdto", cdto);
		return json(map);
	}
	
	@RequestMapping(value="/add_code_ok", produces="application/text; charset=utf-8")
	@ResponseBody
	public String add_code_ok(CodeDTO cdto) {
		
		cdto.setCode_level(cdto.getCode_level()+1);
		cs.add_code(cdto);
		List<CodeDTO> clist = cs.code_list();
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("clist", clist);
		return json(map);
	}
}
