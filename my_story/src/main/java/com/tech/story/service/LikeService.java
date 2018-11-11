package com.tech.story.service;

import com.tech.story.dto.LikeDTO;

public interface LikeService {
	public void add_like(LikeDTO ldto);
	public int like_count(LikeDTO ldto);
	public void delete_like(LikeDTO ldto);
}
