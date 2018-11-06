package com.tech.story.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tech.story.dto.CategoryDTO;

@Repository
public class CategoryDAOImpl implements CategoryDAO {

	@Autowired
	private SqlSessionTemplate sst;
	private String namespace = "com.tech.story.dao.CategoryDAO";
	@Override
	public List<CategoryDTO> cate_list(String story_cd) {
		// TODO Auto-generated method stub
		return sst.selectList(namespace+".cate_list",story_cd);
	}
	@Override
	public void add_cate(CategoryDTO ctdto) {
		// TODO Auto-generated method stub
		sst.insert(namespace+".add_cate",ctdto);
	}
	@Override
	public void delete_cate(String cate_cd) {
		// TODO Auto-generated method stub
		sst.delete(namespace+".delete_cate",cate_cd);
	}
	@Override
	public void modify_cate(String cate_cd) {
		// TODO Auto-generated method stub
		sst.update(namespace+".modify_cate",cate_cd);
	}

}
