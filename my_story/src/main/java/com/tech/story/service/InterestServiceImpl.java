package com.tech.story.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tech.story.dao.InterestDAO;
import com.tech.story.dto.InterestDTO;

@Service
public class InterestServiceImpl implements InterestService {

	@Inject
	private InterestDAO idao;

	@Override
	public void add_intereset(InterestDTO idto) {
		// TODO Auto-generated method stub
		idao.add_intereset(idto);
	}
	
}
