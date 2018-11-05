package com.tech.story.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tech.story.dto.InterestDTO;

@Repository
public class InterestDAOImpl implements InterestDAO {

	@Inject
	private SqlSessionTemplate sst;
	
	private static final String NAMESPACE = "com.tech.story.dao.InterestDAO";

	@Override
	public void add_intereset(InterestDTO idto) {
		// TODO Auto-generated method stub
		sst.insert(NAMESPACE+".add_interest",idto);
	}
	
}
