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
	
	@Override
	public List<Board> getList(Criteria criteria) {
		return mapper.getList(criteria);
	}

	@Transactional
	@Override
	public Board get(Long bno, boolean isAddCount) {
		if(isAddCount) mapper.addViewCount(bno);
		return mapper.get(bno);
	}
	
	@Transactional
	@Override
	public void remove(Long bno) {
		attachMapper.deleteAll(bno);
		mapper.delete(bno);
	}

	@Transactional
	@Override
	public void register(Board board) {
		mapper.insert(board);
		if(board.getAttachList()==null ||board.getAttachList().size()==0) return;
		board.getAttachList().forEach(attach->{
			attach.setBno(board.getBno());
			attachMapper.insert(attach);
		});
	}
	
	@Transactional
	@Override
	public void modify(Board board) {
		attachMapper.deleteAll(board.getBno());
		mapper.update(board);
		if(board.getAttachList()!=null) {
			board.getAttachList().forEach(attach -> {
				attach.setBno(board.getBno());
				attachMapper.insert(attach);
			});
		}
		
	}
	
	@Override
	public int totalCount(Criteria criteria) {
		return mapper.totalCount(criteria);
	}

	@Override
	public List<BoardAttachVO> getAttachList(Long bno) {
		return attachMapper.findByBno(bno);
	}

	
	
	
}
