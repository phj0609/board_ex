package com.jafa.dao;

import java.util.List;

import com.jafa.dto.Board;

public interface BoardMapper {
	List<Board> getList();
	void insert(Board board);
	Board findByBno(Long bno);
	void update(Board board);
	void delete(Long bno);
	
}
