package com.tech.story.service;

import com.tech.story.dto.MemberDTO;

public interface MemberService {
	public MemberDTO member_info(String id);
	public int overlap_id(String id);
	public void join_ok(MemberDTO mdto);
	public int login_ok(MemberDTO mdto);
	public MemberDTO member_info_type_cd(String member_cd);

}
