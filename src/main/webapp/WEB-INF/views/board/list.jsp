<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jspf"%>
<style>
table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}
</style>
<div class="container">
<div class="searchArea">
	<form action="${contextPath}/board/list" id="searchForm">
		<select name="type">
			<option value="">===</option>
			<option value="T" ${pageMaker.criteria.type eq 'T' ? 'selected':''}>제목</option>
			<option value="C" ${pageMaker.criteria.type eq 'C' ? 'selected':''}>내용</option>
			<option value="W" ${pageMaker.criteria.type eq 'W' ? 'selected':''}>작성자</option>
		</select>
		<input type="text" name="keyword" value="${pageMaker.criteria.keyword}">
		<button class="btn btn-primary">검색</button>
	</form>
</div>
<table class="table">
		<h2>게시판</h2>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>등록일</th>
				<th>수정일</th>
			</tr>
			<c:if test="${not empty list}">
			<c:forEach items="${list}" var="b">
				<tr>
					<td>${b.bno}</td>
					<td><a href="get?bno=${b.bno}">${b.title}</a></td>
					<td>${b.writer}</td>
					<td>
						<fmt:parseDate var="regDate" value="${b.regDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" />
					    <fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd HH:mm" /> 
					</td>
					<td>
						<fmt:parseDate var="updateDate" value="${b.updateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" /> 
						<fmt:formatDate value="${updateDate}" pattern="yyyy-MM-dd HH:mm" /> 
					</td>
				</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan="5">
						게시글이 존재하지 않습니다.
					</td>
				</tr>
			</c:if>
		</table>
		<form action="${contextPath}/board/list" id="pageForm">
			<input type="hidden" name="page" value="${pageMaker.criteria.page}">
			<input type="hidden" name="type" value="${pageMaker.criteria.type}">
			<input type="hidden" name="keyword" value="${pageMaker.criteria.keyword}">
			<ul class="pagination">
				<c:if test="${pageMaker.prev}">
					<li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}">이전페이지</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="pageNum">
					<li class="page-item ${pageMaker.criteria.page == pageNum ? 'active':''}">
						<a href="${pageNum}" class="page-link">${pageNum}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item"><a class="page-link" href="${pageMaker.endPage+1}">다음페이지</a></li>
				</c:if>
				<br>
			</ul>
		</form>
			
		<a href="${pageContext.request.contextPath}/board/register" class="btn btn-primary">글 등록</a> ${message}
</div>
<%@ include file="/WEB-INF/views/layout/footer.jspf"%>
<script>
	$(function(){
		let pageForm = $('#pageForm')
		$('#pageForm a').on('click',function (e){
			e.preventDefault();
			pageForm.find('input[name="page"]').val($(this).attr('href'));
			
			$('#pageForm').submit();
		});
	})
</script>