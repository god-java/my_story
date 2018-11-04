package com.tech.story.service;

import java.util.List;

import com.tech.story.dto.CodeDTO;

public interface CodeService {
	public List<CodeDTO> code_list();
	public CodeDTO code_info(String code_cd);
	public void add_code(CodeDTO cdto);
	public List<CodeDTO> code_list_kind(String up_code);

}
