package com.tech.story.dto;

public class UploadImageDTO extends ObjectDTO {

	private String upload_image_cd;
	private String member_cd;
	private String board_cd;
	private String upload_date;
	public String getUpload_image_cd() {
		return upload_image_cd;
	}
	public void setUpload_image_cd(String upload_image_cd) {
		this.upload_image_cd = upload_image_cd;
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
	public String getUpload_date() {
		return upload_date;
	}
	public void setUpload_date(String upload_date) {
		this.upload_date = upload_date;
	}
}
