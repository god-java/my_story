package com.tech.story.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tech.story.dto.CommentDTO;

@Repository
public class CommentDAOImpl implements CommentDAO {

	@Autowired
	private SqlSessionTemplate sst;
	private String namespace = "com.tech.story.dao.CommentDAO";
	
	@Override
	public void write_comment(CommentDTO cmdto) {
		// TODO Auto-generated method stub
		sst.insert(namespace+".write_comment",cmdto);
	}

	@Override
	public List<CommentDTO> comment_list(CommentDTO cmdto) {
		// TODO Auto-generated method stub
		return sst.selectList(namespace+".comment_list",cmdto);
	}

	@Override
	public int comment_count(String board_cd) {
		// TODO Auto-generated method stub
		return sst.selectOne(namespace+".comment_count",board_cd);
	}

}
