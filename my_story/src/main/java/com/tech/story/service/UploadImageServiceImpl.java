package com.tech.story.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.story.dao.UploadImageDAO;
import com.tech.story.dto.UploadImageDTO;

@Service
public class UploadImageServiceImpl implements UploadImageService {

	@Autowired
	private UploadImageDAO udao;
	
	@Override
	public void upload_image(UploadImageDTO udto) {
		// TODO Auto-generated method stub
		udao.upload_image(udto);
	}

}
