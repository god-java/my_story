package com.tech.story.dto;

public class LikeDTO extends ObjectDTO {
	private String like_cd;
	private String member_cd;
	private String board_cd;
	private String like_date;
	public String getLike_cd() {
		return like_cd;
	}
	public void setLike_cd(String like_cd) {
		this.like_cd = like_cd;
	}
	public String getMember_cd() {
		return member_cd;
	}
	public void setMember_cd(String member_cd) {
		this.member_cd = member_cd;
	}
	public String getBoard_cd() {
		return board_cd;
	}
	public void setBoard_cd(String board_cd) {
		this.board_cd = board_cd;
	}
	public String getLike_date() {
		return like_date;
	}
	public void setLike_date(String like_date) {
		this.like_date = like_date;
	}
}
