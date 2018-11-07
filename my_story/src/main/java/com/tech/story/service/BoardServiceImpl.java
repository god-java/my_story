package com.tech.story.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.story.dao.BoardDAO;
import com.tech.story.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO bdao;
	
	@Override
	public void write_board(BoardDTO bdto) {
		// TODO Auto-generated method stub
		bdao.write_board(bdto);
	}

	@Override
	public void modify_board(String board_cd) {
		// TODO Auto-generated method stub
		bdao.modify_board(board_cd);
	}

	@Override
	public void delete_board(String board_cd) {
		// TODO Auto-generated method stub
		bdao.delete_board(board_cd);
	}

	@Override
	public List<BoardDTO> board_list(BoardDTO bdto) {
		// TODO Auto-generated method stub
		return bdao.board_list(bdto);
	}

	@Override
	public BoardDTO board_info(String board_cd) {
		// TODO Auto-generated method stub
		return board_info(board_cd);
	}

}
