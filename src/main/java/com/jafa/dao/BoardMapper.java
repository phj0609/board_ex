package com.jafa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.dto.Board;
import com.jafa.dto.Criteria;

public interface BoardMapper {
	List<Board> getList(Criteria criteria);
	void insert(Board board);
	Board findByBno(Long bno);
	void update(Board board);
	void delete(Long bno);
	int totalCount(Criteria criteria);
	void updateReplyCnt(
		@Param("bno") Long bno,
		@Param("amount") int amount
	);
}
