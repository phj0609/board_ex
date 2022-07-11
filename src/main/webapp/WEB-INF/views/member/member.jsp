<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/layout/header.jspf" %>

<div class="container">
	<h2>회원 페이지</h2>
	<form action="${contextPath}/customLogout" method="post">
		<button class="btn btn-primary">로그아웃</button>
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	</form>
</div>
<%@ include file="/WEB-INF/views/layout/footer.jspf" %>