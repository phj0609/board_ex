<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/layout/header.jspf"%>
<script src="${contextPath}/resources/js/get.js"></script>
<sec:authorize access="isAuthenticated()">
	<sec:authentication property="principal.username" var="userId"/>
</sec:authorize>

<div class="container">
	<div class="getData">
		<input type="hidden" name="page" id="page" value="${param.page}">
		<input type="hidden" name="type" id="type" value="${param.type}">
		<input type="hidden" name="keyword" id="keyword" value="${param.keyword}">
	</div>
	<form id="getForm">
		<h2>게시글조회</h2>
		<p>제목 : ${board.title }</p>
		<p>작성자 : ${board.writer }</p>
		<p>
			작성일 :
			<fmt:parseDate var="regDate" value="${board.regDate}"
				pattern="yyyy-MM-dd'T'HH:mm:ss" />
			<fmt:formatDate value="${regDate}" pattern="yyyy-MM-dd HH:mm:ss" />
		</p>
		<p>
			수정일 :
			<fmt:parseDate var="updateDate" value="${board.updateDate}"
				pattern="yyyy-MM-dd'T'HH:mm:ss" />
			<fmt:formatDate value="${updateDate}" pattern="yyyy-MM-dd HH:mm:ss" />
			조회수 : ${board.viewCount} 
		</p>
		<div>내용 : ${board.content}</div>
		<div class="d-flex">
			<c:if test="${userId eq board.writer}">
			<form action="${contextPath}/board/remove" method="post">
				<input type="hidden" name="bno" value="${board.bno}">
				<button class="btn btn-danger">삭제</button>
			</form>
			<form action="${contextPath}/board/modify" class="mx-2">
				<input type="hidden" name="bno" value="${board.bno}" >
				<button class="btn btn-warning">수정</button>
			</form>
			</c:if>
			<form action="${contextPath}/board/list" class="mx-1">
				<input type="hidden" name="bno" value="${board.bno}" >
				<button class="btn btn-success">목록</button>
			</form>
		</form>
	</div>

	<div class="row my-5">
		<div class="col-lg-12">
			<div class="card">
				<div class="card-header">
					<h4>파일 첨부</h4>
				</div>
				<div class="card-body">
					<div class="uploadResult">
						<ul class="list-group"></ul>
					</div>
				</div>
				<!-- card body -->
			</div>
			<!-- card end -->
		</div>
		<!-- col end -->
	</div>
	<!-- row end -->

	<!-- 댓글 등록 -->
	<!-- Button trigger modal -->
	<sec:authorize access="isAuthenticated()">
	<button id="addReplyBtn" type="button" class="btn btn-primary"
		data-toggle="modal" data-target="#replyForm">
		댓글등록
	</button>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		댓글을 등록하시려면 로그인하세요
	</sec:authorize>

	<div>댓글 수 : ${board.replyCnt}</div>
	<!-- Modal -->
	<div class="modal fade" id="replyForm" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">댓글달기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="reply">내용입력</label> <input class="form-control"
							name="reply" id="reply">
					</div>
					<div class="form-group">
						<label class="replyer">작성자</label> <input class="form-control"
							name="replyer" id="replyer">
					</div>
					<div class="form-group">
						<label class="regDate">등록일</label> <input class="form-control"
							name="regDate" id="regDate">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" id="modalModBtn">수정</button>
					<button type="button" class="btn btn-danger" id="modalRemoveBtn">삭제</button>
					<button type="button" class="btn btn-primary" id="modalRegisterBtn">등록</button>
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 댓글 -->
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="test">댓글을 달아주세요</h4>
				</div>
				<div class="panel-body">
					<ul class="chat">
					</ul>
				</div>
			</div>
			<!-- panel end -->
		</div>
		<!-- col end -->
	</div>
	<!-- row end -->
</div>
<!-- container end -->

<script>

$(function(){	
	let getForm = $("#getForm");
	$('#getForm .list').on('click',function(){ // 목록페이지
		getForm.empty();
		getForm.append($('#page'));
		getForm.append($('#type'));
		getForm.append($('#keyword'));
		getForm.attr("action","list");
		getForm.submit();	
	})
	$('#getForm .modify').on('click',function(){ // 수정페이지
		getForm.attr("action","modify");
		getForm.submit();	
	})
	$('#getForm .remove').on('click',function(){ // 삭제처리
		getForm.append($('#writer'))
		getForm.attr("method","post");
		getForm.attr("action","remove");
		getForm.submit();
	});
	
	let bno = $('input[name="bno"]').val();
	
})

// 댓글 등록 테스트
/* $(function(){
	let bnoValue = $('input[name="bno"]').val();
	let reply = {
		bno : bnoValue,
		
		reply : "ajax 댓글 등록 테스트",
		replyer : "테스터"
	};
	let callback = function(result) {
		alert("결과 : " + result);
	}
	replyService.add(reply,callback);
}) */

$(function(){
	// 목록 테스트
	let bnoValue = $('input[name="bno"]').val();
	
	replyService.getList({bno:bnoValue},function(list){
		/* for(let i = 0, len = list.length || 0; i<len; i++) {
			console.log(list[i]);
		} */
		for(let reply of list) {
			console.log(reply)
		}
	});
})

$(function(){
	// 수정 테스트
	function updateTest() {
		replyService.update({
			rno : 4,
			bno : 1,
			reply : "댓글 내용을 수정합니다......."
		}, function(result) {
				alert(result)
		})
	}
	// updateTest();
	function deleteTest() {
		replyService.remove(4, function(result) {
			alert(result);
		}, function() {
			alert('실패')
		})
	}
	// deleteTest();
})	


</script>
<%@ include file="/WEB-INF/views/layout/footer.jspf"%>
