package com.jafa.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jafa.dto.Criteria;
import com.jafa.dto.ReplyVO;

public interface ReplyMapper {
	List<ReplyVO> getListAll();

	List<ReplyVO> getListWithPaging(@Param("cri") Criteria criteria, @Param("bno") Long bno);
	int insert(ReplyVO vo);
	ReplyVO read(Long rno);
	int delete(Long rno);
	int update(ReplyVO vo);

}
