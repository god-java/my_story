package com.tech.story.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tech.story.dao.StoryDAO;
import com.tech.story.dto.StoryDTO;

@Service
public class StoryServiceImpl implements StoryService {

	@Inject
	private StoryDAO sdao;
	
	@Override
	public void make_story(StoryDTO sdto) {
		// TODO Auto-generated method stub
		sdao.make_story(sdto);
	}

	@Override
	public int story_count(String member_cd) {
		// TODO Auto-generated method stub
		return sdao.story_count(member_cd);
	}

	@Override
	public StoryDTO story_info(String member_cd) {
		// TODO Auto-generated method stub
		return sdao.story_info(member_cd);
	}

}
