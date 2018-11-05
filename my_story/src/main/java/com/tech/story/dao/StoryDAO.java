package com.tech.story.dao;

import com.tech.story.dto.StoryDTO;

public interface StoryDAO {

	public void make_story(StoryDTO sdto);
	public int story_count(String member_cd);
	public StoryDTO story_info(String member_cd);
}
