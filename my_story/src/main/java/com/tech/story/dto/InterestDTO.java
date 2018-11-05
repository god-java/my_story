package com.tech.story.dto;

public class InterestDTO extends ObjectDTO {

	private String interest_cd;
	private String member_cd;
	private String story_cd;
	private String interest_nm;
	public String getInterest_cd() {
		return interest_cd;
	}
	public void setInterest_cd(String interest_cd) {
		this.interest_cd = interest_cd;
	}
	public String getMember_cd() {
		return member_cd;
	}
	public void setMember_cd(String member_cd) {
		this.member_cd = member_cd;
	}
	public String getStory_cd() {
		return story_cd;
	}
	public void setStory_cd(String story_cd) {
		this.story_cd = story_cd;
	}
	public String getInterest_nm() {
		return interest_nm;
	}
	public void setInterest_nm(String interest_nm) {
		this.interest_nm = interest_nm;
	}
}
