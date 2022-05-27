<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
글조회<br>
<p>제목 : ${board.title }</p>
<p>작성자 : ${board.writer }</p>
<p>작성일 : ${board.regDate }</p>
<p>수정일 : ${board.updateDate }</p>
<div>
	내용 : <br>
	${board.content}
</div>
<div>
<form action="${pageContext.request.contextPath}/board/remove" method="post">
	<input type="hidden" name="bno" value="${board.bno}">
	<button>삭제</button>
</form>
</div>

</body>
</html>