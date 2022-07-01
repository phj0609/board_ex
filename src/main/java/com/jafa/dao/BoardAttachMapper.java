package com.jafa.dao;

import java.util.List;

import com.jafa.dto.BoardAttachVO;

public interface BoardAttachMapper {
	
	void insert(BoardAttachVO vo);
	void delete(String uuid);
	List<BoardAttachVO> findByBno(Long bno);
}
