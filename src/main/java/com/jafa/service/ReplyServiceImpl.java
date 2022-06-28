package com.jafa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jafa.dao.BoardMapper;
import com.jafa.dao.ReplyMapper;
import com.jafa.dto.Criteria;
import com.jafa.dto.ReplyVO;

import lombok.Setter;

@Service
public class ReplyServiceImpl implements ReplyService {

	private final static int REPLY_ADD = 1;
	private final static int REPLY_DEL = -1;
	
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<ReplyVO> getList(Criteria criteria, Long bno) {
		return mapper.getListWithPaging(criteria, bno);
	}

	@Override
	public int register(ReplyVO vo) {
		boardMapper.updateReplyCnt(vo.getBno(), REPLY_ADD);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(Long rno) {
		return mapper.read(rno);
	}

	@Transactional
	@Override
	public int remove(Long rno) {
		boardMapper.updateReplyCnt(mapper.read(rno).getBno(), REPLY_DEL);
		return mapper.delete(rno);
	}

	@Override
	public int modify(ReplyVO vo) {
		return mapper.update(vo);
	}

}
