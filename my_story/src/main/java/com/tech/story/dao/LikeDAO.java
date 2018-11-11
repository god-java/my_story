package com.tech.story.dao;

import com.tech.story.dto.LikeDTO;

public interface LikeDAO {

	public void add_like(LikeDTO ldto);
	public int like_count(LikeDTO ldto);
	public void delete_like(LikeDTO ldto);
}
