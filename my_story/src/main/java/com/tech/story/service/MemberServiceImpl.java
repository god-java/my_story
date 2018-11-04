package com.tech.story.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tech.story.dao.MemberDAO;
import com.tech.story.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO mdao;
	
	@Override
	public MemberDTO member_info(String id) {
		// TODO Auto-generated method stub
		return mdao.member_info(id);
	}

	@Override
	public int overlap_id(String id) {
		// TODO Auto-generated method stub
		return mdao.overlap_id(id);
	}

	@Override
	public void join_ok(MemberDTO mdto) {
		mdao.join_ok(mdto);
	}

	@Override
	public int login_ok(MemberDTO mdto) {
		// TODO Auto-generated method stub
		return mdao.login_ok(mdto);
	}

}
