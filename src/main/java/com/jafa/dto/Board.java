package com.jafa.dto;

import java.time.LocalDateTime;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter 
@ToString
@AllArgsConstructor 
@NoArgsConstructor
public class Board {
	
	private long bno; // 게시물 번호
	private String title;
	private String content;
	private String writer;
	private int ReplyCnt;
	private Long viewCount;

	private LocalDateTime regDate;
	private LocalDateTime updateDate;
	
	private List<BoardAttachVO> attachList;
	// attachList[0].uuid
	// attachList[1]
	
}
