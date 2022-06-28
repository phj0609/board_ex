package com.jafa.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter @ToString
@AllArgsConstructor @NoArgsConstructor
public class Board {
	
	private long bno; // 게시물 번호
	private String title;
	private String content;
	private String writer;
	private int ReplyCnt;
	private LocalDateTime regDate;
	private LocalDateTime updateDate;
}
