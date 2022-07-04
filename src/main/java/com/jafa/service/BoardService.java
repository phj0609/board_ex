package com.jafa.service;

import java.util.List;

import com.jafa.dto.Board;
import com.jafa.dto.BoardAttachVO;
import com.jafa.dto.Criteria;

public interface BoardService {
	public List<Board> getList(Criteria criteria); 

	public Board get(Long bno); 
	
	public void remove(Long bno); 

	public void register(Board board); 

	public void update(Board board); 
	
	public int totalCount(Criteria criteria); 
	
	public List<BoardAttachVO> getAttachList(Long bno);

}
