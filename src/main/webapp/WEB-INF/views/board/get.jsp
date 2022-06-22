<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/layout/header.jspf" %>
<script src="${contextPath}/resources/js/get.js"></script>
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
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4>댓글을 달아주세요</h4>
				</div>
				<div class="panel-body">
					<ul class="chat">
						<li data-rno='1'>
							<div>
								<div class='header'>
									<strong class='primary-font'>홍길동</strong>
									<small class='pull-right text muted'>2022-02-22</small>
								</div>
								<p>댓글 내용.......</p>
							</div>
						</li>
					</ul>
				</div>
			</div> <!-- panel end -->
		</div> <!-- col end -->
	</div> <!-- row end -->
</div> <!-- container end -->

<script>



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
<%@ include file="/WEB-INF/views/layout/footer.jspf" %>
