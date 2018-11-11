package com.tech.story.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tech.story.dao.LikeDAO;
import com.tech.story.dto.LikeDTO;

@Service
public class LikeServiceImpl implements LikeService {

	@Autowired
	private LikeDAO ldao;
	
	@Override
	public void add_like(LikeDTO ldto) {
		// TODO Auto-generated method stub
		ldao.add_like(ldto);
	}

	@Override
	public int like_count(LikeDTO ldto) {
		// TODO Auto-generated method stub
		return ldao.like_count(ldto);
	}

	@Override
	public void delete_like(LikeDTO ldto) {
		// TODO Auto-generated method stub
		ldao.delete_like(ldto);
	}

}
