package com.tech.story.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tech.story.dto.StoryDTO;

@Repository
public class StoryDAOImpl implements StoryDAO {

	@Inject
	private SqlSessionTemplate sst;
	
	private String namespace = "com.tech.story.dao.StoryDAO";
	
	@Override
	public void make_story(StoryDTO sdto) {
		// TODO Auto-generated method stub
		sst.insert(namespace+".make_story",sdto);
	}

	@Override
	public int story_count(String member_cd) {
		// TODO Auto-generated method stub
		return sst.selectOne(namespace+".story_count",member_cd);
	}

	@Override
	public StoryDTO story_info(String member_cd) {
		// TODO Auto-generated method stub
		return sst.selectOne(namespace+".story_info",member_cd);
	}

}
