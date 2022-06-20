<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jspf" %>
<div class="container">
<h2>글 수정 페이지</h2>
<form action="${contextPath}/board/update" method="post"> 
	<input type="hidden" name="bno" value="${board.bno}">
	제목 : <input type="text" name="title" value="${board.title}">
	작성자 : <input type="text" name="writer" value="${board.writer}"><br>
	<textarea rows="30" cols="70" name="content">
		${board.content}
	</textarea><br>
	<button class="btn btn-primary">등록</button>
</form>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jspf" %>