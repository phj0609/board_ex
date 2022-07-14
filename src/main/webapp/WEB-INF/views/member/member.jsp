<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jspf" %>

<div class="container">
	<sec:authentication property="principal.memberVO.userId" var="userId"/>
	<h2>회원 페이지</h2>
	<div class="d-flex">
		<form action="${contextPath}/customLogout" method="post" class="mx-2">
			<button class="btn btn-primary">로그아웃</button>
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
		</form>
		<a href="${contextPath}/anno/myPage/${userId}" class="btn btn-primary">마이페이지</a>
	</div>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jspf" %>