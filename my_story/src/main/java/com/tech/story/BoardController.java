package com.tech.story;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tech.story.dto.BoardDTO;

@Controller
public class BoardController extends ObjectController {

	@RequestMapping(value="/board_list")
	public String board_list(BoardDTO bdto, Model m) {			//bdto에 cate_cd 담겨있음
		List<BoardDTO> blist = bs.board_list(bdto);				// 해당 스토리, 카테고리 게시물 가져오기
		m.addAttribute("blist",blist);
		m.addAttribute("center","board_list.jsp");
		story_info(m, bdto.getMember_cd(), bdto.getCate_cd());	// mdto,sdto,ctlist 멤버,스토리 모든 정보 담겨있음
		return path(bdto.getMember_cd());
	}
	
	@RequestMapping(value="/write_board")
	public String write_board(Model m, String member_cd) {
		story_info(m, member_cd);
		m.addAttribute("center","write_board.jsp");
		return path(member_cd);
	}
	
}
