package com.jafa.dao;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jafa.config.RootConfig;
import com.jafa.dto.Board;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { RootConfig.class })
public class PagingTest {

	@Autowired
	BoardMapper mapper;

	@Test
	public void insertData() {

		for (int i = 1; i <= 212; i++) {
			Board board = new Board();
			board.setTitle("제목 :  스프링 중입니다" + i);
			board.setContent("내용 : 자바 중입니다." + i);
			board.setWriter("홍길동" + i);
			mapper.insert(board);
		}
	}
}
