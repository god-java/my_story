package com.tech.story.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.tech.story.dto.UploadImageDTO;

@Repository
public class UploadImageDAOImpl implements UploadImageDAO {

	@Autowired
	private SqlSessionTemplate sst;
	private String namespace = "com.tech.story.dao.UploadImageDAO";
	@Override
	public void upload_image(UploadImageDTO udto) {
		// TODO Auto-generated method stub
		sst.insert(namespace+".upload_image");
	}

}
