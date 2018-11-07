package com.tech.story.service;

import java.util.List;

import com.tech.story.dto.BoardDTO;

public interface BoardService {
	public void write_board(BoardDTO bdto);
	public void modify_board(String board_cd);
	public void delete_board(String board_cd);
	public List<BoardDTO> board_list(BoardDTO bdto);
	public BoardDTO board_info(String board_cd);
}
