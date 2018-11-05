package com.tech.story.dao;

public interface StoryDetailDAO {

	public void insert_story_detail(String member_cd);
	public int story_detail_count(String member_cd);
	public String theme_info(String member_cd);

}
