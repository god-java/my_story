package com.tech.story.dao;

import java.util.List;

import javax.inject.Inject;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.tech.story.dto.CodeDTO;

@Repository
public class CodeDAOImpl implements CodeDAO {

	@Inject
	private SqlSessionTemplate sst;
	
	private static final String NAMESPACE = "com.tech.story.dao.CodeDAO";
	
	@Override
	public List<CodeDTO> code_list() {
		// TODO Auto-generated method stub
		return sst.selectList(NAMESPACE+".code_list");
	}

	@Override
	public CodeDTO code_info(String code_cd) {
		// TODO Auto-generated method stub
		return sst.selectOne(NAMESPACE+".code_info",code_cd);
	}

	@Override
	public void add_code(CodeDTO cdto) {
		// TODO Auto-generated method stub
		sst.insert(NAMESPACE+".add_code",cdto);
	}

	@Override
	public List<CodeDTO> code_list_kind(String up_code) {
		// TODO Auto-generated method stub
		return sst.selectList(NAMESPACE+".code_list_kind",up_code);
	}



}
