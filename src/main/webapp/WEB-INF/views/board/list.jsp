<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jspf" %>
<div class="container">
<style>
table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {background-color: #f2f2f2;}
</style>
</head>
<body>
<h2>게시판</h2>
<table>
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>등록일</th>
		<th>수정일</th>
	</tr>
	<c:forEach items="${list}" var="b">
		<tr>
			<td>${b.bno}</td>
			<td>
				<a href="get?bno=${b.bno}">${b.title}</a>
			</td>
			<td>${b.writer}</td>
			<td>
				<fmt:parseDate var="regDate" value="${b.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/> 
				<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd HH:mm"/>
			</td>
			<td>
				<fmt:parseDate var="updateDate" value="${b.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss"/> 
				<fmt:formatDate value="${updateDate}" pattern="yyyy-MM-dd HH:mm"/>
			</td>
		</tr>
	</c:forEach>
</table>
시작페이지 : ${pageMaker.startPage}<br>
끝페이지 : ${pageMaker.endPage}<br>
<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="pageNum">
	<a href="?page=${pageNum}">[${pageNum}]</a>
</c:forEach> 

<a href="${pageContext.request.contextPath}/board/register" class="btn btn-primary">글 등록</a>
	${message}
</body>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jspf" %>