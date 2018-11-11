package com.tech.story;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.tech.story.dto.BoardDTO;
import com.tech.story.dto.LikeDTO;

@Controller
public class BoardController extends ObjectController {

	@RequestMapping(value="/board_list")
	public String board_list(BoardDTO bdto, Model m) {			//bdto에 cate_cd 담겨있음
		List<BoardDTO> blist = bs.board_list(bdto);				// 해당 스토리, 카테고리 게시물 가져오기
		LikeDTO ldto = new LikeDTO();
		m.addAttribute("blist",blist);
		m.addAttribute("center","board_list.jsp");
		for(BoardDTO bdto2 : blist) {
			ldto.setBoard_cd(bdto2.getBoard_cd());
			int like_count = ls.like_count(ldto);
			int comment_count = cms.comment_count(bdto2.getBoard_cd());
			bdto2.setLike_count(like_count);
			bdto2.setComment_count(comment_count);
		}
		story_info(m, bdto.getMember_cd(), bdto.getCate_cd());	// mdto,sdto,ctlist 멤버,스토리 모든 정보 담겨있음
		return path(bdto.getMember_cd());
	}
	
	@RequestMapping(value="/write_board")
	public String write_board(Model m, String member_cd) {
		story_info(m, member_cd);
		m.addAttribute("center","write_board.jsp");
		return path(member_cd);
	}
	@RequestMapping(value="/write_board_ok")
	public String write_board_ok(Model m, @RequestParam(value="image") List<MultipartFile> file,
			HttpSession s, BoardDTO bdto, @RequestParam(value="extension") List<String> extension,
			@RequestParam(value="fake_path") List<String> fake_path) {
		System.out.println(bdto.getBoard_content());
		System.err.println(fake_path.size());
		String board_content = bdto.getBoard_content();
		String rere = "";
		
		for(int i=0; i<fake_path.size(); i++) {
			System.err.println(fake_path.get(i));
			
		}
		System.err.println(rere);
		String member_cd = (String)s.getAttribute("member_cd");
		String path = "C:\\Users\\wnstn\\git\\my_story\\my_story\\src\\main\\webapp\\resources\\upload_image\\";
		File f = null;
		for(int i=0; i<file.size()-1; i++) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
			Date date = new Date();
			String today = sdf.format(date);
			String file_name = today+"."+extension.get(i);
			if(i==0) {
				bdto.setBoard_image(file_name);
			}
			board_content = board_content.replace(fake_path.get(i), "resources/upload_image/"+file_name);
			
			f = new File(path+file_name);
			try {
				file.get(i).transferTo(f);
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		bdto.setBoard_content(board_content);
		System.err.println(bdto.getBoard_content()+"\n asdadsadsadsadsadsa \n asdadsadsadsadsadsa \n asdadsadsadsadsadsa\n\n\n\n asdadsadsadsadsadsa");
		bdto.setMember_cd(member_cd);
		bdto.setBoard_file("aa");
		
		bs.write_board(bdto);
		story_info(m, member_cd);
		m.addAttribute("center","board_list.jsp");
		System.err.println(board_content);
		return path(member_cd);
	}
	
	@RequestMapping(value="/view_board")
	public String view_board(Model m, BoardDTO bdto, LikeDTO ldto, HttpSession s) {
		if(s.getAttribute("member_cd")!=null) {
			String member_cd = s.getAttribute("member_cd").toString();
			ldto.setMember_cd(member_cd);
		}
		m.addAttribute("center","view_board.jsp");
		BoardDTO bdto2 = bs.board_info(bdto.getBoard_cd());
		int like_count = ls.like_count(ldto);	// 여긴 내가 좋아요를 눌렀는지 확인하는 카운트
		if(like_count>0) {
			bdto2.setLike_check("o");
		}
		ldto.setMember_cd(null);
		int all_count = ls.like_count(ldto);	// 여긴 전체 좋아요 수, member_cd 뺌
		bdto.setLike_count(all_count);
		story_info(m, bdto.getMember_cd());
		m.addAttribute("bdto",bdto2);
		bs.read_count_up(bdto.getBoard_cd());
		return path(bdto.getMember_cd());
	}
}
