package com.tech.story.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.story.dao.CommentDAO;
import com.tech.story.dto.CommentDTO;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO cmdao;

	@Override
	public void write_comment(CommentDTO cmdto) {
		// TODO Auto-generated method stub
		cmdao.write_comment(cmdto);
	}

	@Override
	public List<CommentDTO> comment_list(CommentDTO cmdto) {
		// TODO Auto-generated method stub
		return cmdao.comment_list(cmdto);
	}

	@Override
	public int comment_count(String board_cd) {
		// TODO Auto-generated method stub
		return cmdao.comment_count(board_cd);
	}
	
}
