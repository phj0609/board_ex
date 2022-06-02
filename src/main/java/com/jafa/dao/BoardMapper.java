package com.jafa.dao;

import java.util.List;

import com.jafa.dto.Board;
import com.jafa.dto.Criteria;

public interface BoardMapper {
	List<Board> getList(Criteria criteria);
	void insert(Board board);
	Board findByBno(Long bno);
	void update(Board board);
	void delete(Long bno);
	int totalCount();
	
}
