package com.tech.story.service;

import com.tech.story.dto.StoryDTO;

public interface StoryService {

	public void make_story(StoryDTO sdto);
	public int story_count(String member_cd);
	public StoryDTO story_info(String member_cd);


}
