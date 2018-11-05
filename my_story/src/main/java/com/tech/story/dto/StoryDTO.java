package com.tech.story.dto;

public class StoryDTO extends ObjectDTO {

	private String story_cd;
	private String member_cd;
	private String story_nm;
	private String make_date;
	public String getStory_cd() {
		return story_cd;
	}
	public void setStory_cd(String story_cd) {
		this.story_cd = story_cd;
	}
	public String getMember_cd() {
		return member_cd;
	}
	public void setMember_cd(String member_cd) {
		this.member_cd = member_cd;
	}
	public String getStory_nm() {
		return story_nm;
	}
	public void setStory_nm(String story_nm) {
		this.story_nm = story_nm;
	}
	public String getMake_date() {
		return make_date;
	}
	public void setMake_date(String make_date) {
		this.make_date = make_date;
	}
}
