package com.tech.story.dto;

public class BoardDTO extends ObjectDTO {
	private String board_cd;
	private String member_cd;
	private String cate_cd;
	private String board_title;
	private String board_content;
	private String board_file;
	private String board_image;
	private String write_date;
	private int read_count;
	private String board_sub_content;
	private int like_count;
	private String like_check;
	public String getLike_check() {
		return like_check;
	}
	public void setLike_check(String like_check) {
		this.like_check = like_check;
	}
	public int getLike_count() {
		return like_count;
	}
	public void setLike_count(int like_count) {
		this.like_count = like_count;
	}
	public String getBoard_sub_content() {
		return board_sub_content;
	}
	public void setBoard_sub_content(String board_sub_content) {
		this.board_sub_content = board_sub_content;
	}
	public int getRead_count() {
		return read_count;
	}
	public void setRead_count(int read_count) {
		this.read_count = read_count;
	}
	public String getBoard_cd() {
		return board_cd;
	}
	public void setBoard_cd(String board_cd) {
		this.board_cd = board_cd;
	}
	public String getMember_cd() {
		return member_cd;
	}
	public void setMember_cd(String member_cd) {
		this.member_cd = member_cd;
	}
	public String getCate_cd() {
		return cate_cd;
	}
	public void setCate_cd(String cate_cd) {
		this.cate_cd = cate_cd;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_content() {
		return board_content;
	}
	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}
	public String getBoard_file() {
		return board_file;
	}
	public void setBoard_file(String board_file) {
		this.board_file = board_file;
	}
	public String getBoard_image() {
		return board_image;
	}
	public void setBoard_image(String board_image) {
		this.board_image = board_image;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
}
