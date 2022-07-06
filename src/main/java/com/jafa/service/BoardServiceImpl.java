package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.dao.BoardAttachMapper;
import com.jafa.dao.BoardMapper;
import com.jafa.dto.Board;
import com.jafa.dto.BoardAttachVO;
import com.jafa.dto.Criteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardMapper mapper;
	
	@Autowired
	private BoardAttachMapper attachMapper;
	
	public List<Board> getList(Criteria criteria) {
		return mapper.getList(criteria);
	}

	public Board get(Long bno) {
		return mapper.findByBno(bno);
	}
	
	@Transactional
	public void remove(Long bno) {
		attachMapper.deleteAll(bno);
		mapper.delete(bno);
	}

	@Transactional
	public void register(Board board) {
		mapper.insert(board);
		if(board.getAttachList()==null ||board.getAttachList().size()==0) return;
		board.getAttachList().forEach(attach->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}

	@Transactional
	public void update(Board board) {
		attachMapper.deleteAll(board.getBno());
		mapper.update(board);
		if(board.getAttachList()!=null) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
	}
	
	public int totalCount(Criteria criteria) {
		return mapper.totalCount(criteria);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return attachMapper.findByBno(bno);
	}
	
	
}
