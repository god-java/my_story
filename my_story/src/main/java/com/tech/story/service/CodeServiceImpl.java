package com.tech.story.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.tech.story.dao.CodeDAO;
import com.tech.story.dto.CodeDTO;

@Service
public class CodeServiceImpl implements CodeService {

	@Inject
	private CodeDAO cdao;
	
	@Override
	public List<CodeDTO> code_list() {
		// TODO Auto-generated method stub
		return cdao.code_list();
	}

	@Override
	public CodeDTO code_info(String code_cd) {
		// TODO Auto-generated method stub
		return cdao.code_info(code_cd);
	}

	@Override
	public void add_code(CodeDTO cdto) {
		// TODO Auto-generated method stub
		cdao.add_code(cdto);
	}

	@Override
	public List<CodeDTO> code_list_kind(String up_code) {
		// TODO Auto-generated method stub
		return cdao.code_list_kind(up_code);
	}

}
