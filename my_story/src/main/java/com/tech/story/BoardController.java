package com.tech.story;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.story.dto.BoardDTO;

@Controller
public class BoardController extends ObjectController {

	@RequestMapping(value="/board_list")
	public String board_list(BoardDTO bdto, Model m) {			//bdto에 member_cd, cate_cd 담겨있음
		List<BoardDTO> blist = bs.board_list(bdto);				// 해당 스토리, 카테고리 게시물 가져오기
		m.addAttribute("blist",blist);
		m.addAttribute("center","board_list.jsp");
		story_info(m, bdto.getMember_cd(), bdto.getCate_cd());
		return path(bdto.getMember_cd());
	}
	
}
