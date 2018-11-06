package com.tech.story.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.story.dao.CategoryDAO;
import com.tech.story.dto.CategoryDTO;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDAO ctdao;
	
	@Override
	public List<CategoryDTO> cate_list(String story_cd) {
		// TODO Auto-generated method stub
		return ctdao.cate_list(story_cd);
	}

	@Override
	public void add_cate(CategoryDTO ctdto) {
		// TODO Auto-generated method stub
		ctdao.add_cate(ctdto);
	}

	@Override
	public void delete_cate(String cate_cd) {
		// TODO Auto-generated method stub
		ctdao.delete_cate(cate_cd);
	}

	@Override
	public void modify_cate(String cate_cd) {
		// TODO Auto-generated method stub
		ctdao.modify_cate(cate_cd);
	}

}
