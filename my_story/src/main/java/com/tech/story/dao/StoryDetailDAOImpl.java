package com.tech.story.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class StoryDetailDAOImpl implements StoryDetailDAO {

	@Inject
	private SqlSessionTemplate sst;
	
	private String namespace = "com.tech.story.dao.StoryDetailDAO";
	
	@Override
	public void insert_story_detail(String member_cd) {
		// TODO Auto-generated method stub
		sst.insert(namespace+".insert_story_detail",member_cd);
	}

	@Override
	public int story_detail_count(String member_cd) {
		// TODO Auto-generated method stub
		return sst.selectOne(namespace+".story_detail_count",member_cd);
	}

	@Override
	public String theme_info(String member_cd) {
		// TODO Auto-generated method stub
		return sst.selectOne(namespace+".theme_info",member_cd);
	}

}
