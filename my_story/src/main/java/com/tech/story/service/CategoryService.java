package com.tech.story.service;

import java.util.List;

import com.tech.story.dto.CategoryDTO;

public interface CategoryService {
	public List<CategoryDTO> cate_list(String story_cd);
	public void add_cate(CategoryDTO ctdto);
	public void delete_cate(String cate_cd);
	public void modify_cate(String cate_cd);
}
