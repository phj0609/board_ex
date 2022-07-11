package com.jafa.dao;

import com.jafa.dto.MemberVO;

public interface MemberMapper {
	
	MemberVO read(String userId);
	
}
