<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/layout/header.jspf" %>
<div class="container">
	<h2>게시글조회</h2>
	<p>제목 : ${board.title }</p>
	<p>작성자 : ${board.writer }</p>
	<p>작성일 : 
	<fmt:parseDate var="regDate" value="${board.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
	<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd HH:mm"/></p>
	<p>수정일 :
	<fmt:parseDate var="updateDate" value="${board.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" /> 
	<fmt:formatDate value="${updateDate}" pattern="yyyy-MM-dd HH:mm"/></p> 
	
	<div>
		내용 : ${board.content}
	</div>
	<div>
		<form action="${contextPath}/board/remove" method="post">
			<input type="hidden" name="bno" value="${board.bno}">
			<button class="btn btn-danger">삭제</button>
		</form>
		<form action="${contextPath}/board/modify">
		<input type="hidden" name="bno" value="${board.bno}">
			<button class="btn btn-warning">수정</button>
		</form>
		<form action="${contextPath}/board/list">
		<input type="hidden" name="bno" value="${board.bno}">
			<button class="btn btn-success">목록으로</button>
		</form>
	</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jspf" %>