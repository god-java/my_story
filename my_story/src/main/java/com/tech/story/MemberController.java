package com.tech.story;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.story.dto.MemberDTO;
import com.tech.story.service.MemberService;

@Controller
public class MemberController extends ObjectController {
	String path = "main/main";
	
	@RequestMapping(value="/join")
	public String join(Model m) {
		m.addAttribute("center","join.jsp");
		return path;
	}
	@RequestMapping(value="/overlap_id")
	public void overlap_id(HttpServletResponse resp, String id) {
		int count = ms.overlap_id(id);
		print(resp, count);
	}
	@RequestMapping(value="/join_ok")
	public String join_ok(MemberDTO mdto, Model m) {
		ms.join_ok(mdto);
		return path;
	}
	@RequestMapping(value="/login")
	public String login(Model m) {
		m.addAttribute("center","login.jsp");
		return path;
	}
	@RequestMapping(value="/login_ok")
	public void login(MemberDTO mdto,HttpSession s, HttpServletResponse resp) {
		int login_status = ms.login_ok(mdto);
		if(login_status>0) {
			MemberDTO dto = ms.member_info(mdto.getId());
			s.setAttribute("member_cd", dto.getMember_cd());
			s.setAttribute("id", dto.getId());
		}
		print(resp, login_status);
	}
	@RequestMapping(value="/logout")
	public String logout(Model m, HttpSession s) {
		s.invalidate();
		return path;
	}
}
