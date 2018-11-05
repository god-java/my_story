package com.tech.story.dto;

public class StoryDetailDTO extends ObjectDTO {
	private String story_detail_cd;
	private String story_cd;
	private String theme;
	public String getStory_detail_cd() {
		return story_detail_cd;
	}
	public void setStory_detail_cd(String story_detail_cd) {
		this.story_detail_cd = story_detail_cd;
	}
	public String getStory_cd() {
		return story_cd;
	}
	public void setStory_cd(String story_cd) {
		this.story_cd = story_cd;
	}
	public String getTheme() {
		return theme;
	}
	public void setTheme(String theme) {
		this.theme = theme;
	}
}
