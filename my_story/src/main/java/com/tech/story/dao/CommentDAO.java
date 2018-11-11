package com.tech.story.dao;

import java.util.List;

import com.tech.story.dto.CommentDTO;

public interface CommentDAO {

	public void write_comment(CommentDTO cmdto);
	public List<CommentDTO> comment_list(CommentDTO cmdto);
	public int comment_count(String board_cd);
}
