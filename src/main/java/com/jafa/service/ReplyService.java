package com.jafa.service;

import java.util.List;

import com.jafa.dto.Criteria;
import com.jafa.dto.ReplyVO;

public interface ReplyService {
	List<ReplyVO> getList(Criteria criteria, Long bno);
	int register(ReplyVO vo);
	ReplyVO get(Long rno);
	int remove(Long rno);
	int modify(ReplyVO vo);
}
