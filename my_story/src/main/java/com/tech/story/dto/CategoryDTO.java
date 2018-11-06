package com.tech.story.dto;

public class CategoryDTO extends ObjectDTO {

	private String cate_cd;
	private String story_cd;
	private int cate_lv;
	private String cate_nm;
	private String up_cate_cd;
	public String getCate_nm() {
		return cate_nm;
	}
	public void setCate_nm(String cate_nm) {
		this.cate_nm = cate_nm;
	}
	public String getUp_cate_cd() {
		return up_cate_cd;
	}
	public void setUp_cate_cd(String up_cate_cd) {
		this.up_cate_cd = up_cate_cd;
	}
	public String getCate_cd() {
		return cate_cd;
	}
	public void setCate_cd(String cate_cd) {
		this.cate_cd = cate_cd;
	}
	public String getStory_cd() {
		return story_cd;
	}
	public void setStory_cd(String story_cd) {
		this.story_cd = story_cd;
	}
	public int getCate_lv() {
		return cate_lv;
	}
	public void setCate_lv(int cate_lv) {
		this.cate_lv = cate_lv;
	}
}
