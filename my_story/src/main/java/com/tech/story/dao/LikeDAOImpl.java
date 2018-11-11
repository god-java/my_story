package com.tech.story.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tech.story.dto.LikeDTO;

@Repository
public class LikeDAOImpl implements LikeDAO {

	@Autowired
	private SqlSessionTemplate sst;
	private String namespace = "com.tech.story.dao.LikeDAO";
	
	@Override
	public void add_like(LikeDTO ldto) {
		// TODO Auto-generated method stub
		sst.insert(namespace+".add_like",ldto);
	}

	@Override
	public int like_count(LikeDTO ldto) {
		// TODO Auto-generated method stub
		return sst.selectOne(namespace+".like_count",ldto);
	}

	@Override
	public void delete_like(LikeDTO ldto) {
		// TODO Auto-generated method stub
		sst.delete(namespace+".delete_like",ldto);
	}

}
