package com.tech.story.dao;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tech.story.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSessionTemplate sst;
	
	private static final String NAMESPACE = "com.tech.story.dao.MemberDAO";

	@Override
	public MemberDTO member_info(String id) {
		// TODO Auto-generated method stub
		return sst.selectOne(NAMESPACE+".member_info",id);
	}

	@Override
	public int overlap_id(String id) {
		// TODO Auto-generated method stub
		return sst.selectOne(NAMESPACE+".overlap_id",id);
	}

	@Override
	public void join_ok(MemberDTO mdto) {
		sst.insert(NAMESPACE+".join_ok",mdto);
	}

	@Override
	public int login_ok(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return sst.selectOne(NAMESPACE+".login_ok",mdto);
	}
	
}