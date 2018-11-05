package com.tech.story.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tech.story.dao.StoryDetailDAO;

@Service
public class StoryDetailServiceImpl implements StoryDetailService {

	@Inject
	private StoryDetailDAO sddao;
	
	@Override
	public void insert_story_detail(String member_cd) {
		// TODO Auto-generated method stub
		sddao.insert_story_detail(member_cd);
	}

	@Override
	public int story_detail_count(String member_cd) {
		// TODO Auto-generated method stub
		return sddao.story_detail_count(member_cd);
	}

	@Override
	public String theme_info(String member_cd) {
		// TODO Auto-generated method stub
		return sddao.theme_info(member_cd);
	}

}
