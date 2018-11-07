package com.tech.story.dao;

import com.tech.story.dto.MemberDTO;

public interface MemberDAO {

	public MemberDTO member_info(String id);
	public int overlap_id(String id);
	public void join_ok(MemberDTO mdto);
	public int login_ok(MemberDTO mdto);
	public MemberDTO member_info_type_cd(String member_cd);
}
