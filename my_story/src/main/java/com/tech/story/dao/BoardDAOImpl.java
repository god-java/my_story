package com.tech.story.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tech.story.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private SqlSessionTemplate sst;
	private String namespace = "com.tech.story.dao.BoardDAO";
	
	@Override
	public void write_board(BoardDTO bdto) {
		// TODO Auto-generated method stub
		sst.insert(namespace+".write_board",bdto);
	}

	@Override
	public void modify_board(String board_cd) {
		// TODO Auto-generated method stub
		sst.update(namespace+".modify_board",board_cd);
	}

	@Override
	public void delete_board(String board_cd) {
		// TODO Auto-generated method stub
		sst.delete(namespace+".delete_board",board_cd);
	}

	@Override
	public List<BoardDTO> board_list(BoardDTO bdto) {
		// TODO Auto-generated method stub
		return sst.selectList(namespace+".board_list",bdto);
	}

	@Override
	public BoardDTO board_info(String board_cd) {
		// TODO Auto-generated method stub
		return sst.selectOne(namespace+".board_info",board_cd);
	}

	@Override
	public void read_count_up(String board_cd) {
		// TODO Auto-generated method stub
		sst.update(namespace+".read_count_up",board_cd);
	}

}
