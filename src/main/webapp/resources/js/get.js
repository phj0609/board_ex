$(function(){
	let bnoValue = $('input[name="bno"]').val();
	
	
	// 모달창
	let modal = $('.modal');
	let modalInputReply = modal.find('input[name="reply"]');
	let modalInputReplyer = modal.find('input[name="replyer"]');
	let modalInputReplyDate = modal.find('input[name="regDate"]');
	
	let modalModBtn = $('#modalModBtn')
	let modalRemoveBtn = $('#modalRemoveBtn')
	let modalRegisterBtn = $('#modalRegisterBtn')
	let modalCloseBtn = $('#modalCloseBtn')
	
	// 댓글등록 모달창
	$('#addReplyBtn').click(function(){
		modal.find('input').val('');
		modalInputReplyDate.closest('div').hide();
		modalModBtn.hide();
		modalRegisterBtn.show();
		modalRemoveBtn.hide();
	});  
	
	// 댓글 등록 이벤트처리(등록버튼을 눌렀을 때)
	modalRegisterBtn.on('click', function(){
		let reply = {
			reply : modalInputReply.val(),
			replyer : modalInputReplyer.val(),
			bno : bnoValue,
		}
		replyService.add(reply, function(result){
			alert(result)
			modal.modal('hide');
			showList(1);
		})
	})
	
	showList(1);
	
	$('.chat').on('click', 'li', function() {
		let rno = $(this).data('rno');
		
		replyService.get(rno, function(reply){
			console.log(reply)
			modalInputReply.val(reply.reply);
			modalInputReplyer.val(reply.replyer);
			modalInputReplyDate.val(displayTime(reply.updateDate)).attr("readonly","readonly");
			modal.data("rno", reply.rno);
			
			modalInputReplyDate.closest('div').show();
			modalModBtn.show();
			modalRemoveBtn.show();
			modalRegisterBtn.hide();
			
			modal.modal("show");
		})
	})

	let replyUL = $('.chat');
	function showList(page) {
		replyService.getList({bno:bnoValue, page:page},function(list){
			
			let str = "";
			 for(let r of list) {
				str += `
				<li data-rno="${r.rno}">
					<div>
						<div class="header">
							<strong class="primary-font">${r.replyer}</strong>
							<small class="pull-right text muted">${ displayTime(r.regDate)}</small>
						</div>
						<p>${r.reply}</p>
					</div>
				</li>`
			} 
			replyUL.html(str);
		});
	}
	
	
	function displayTime(timeValue) {
		
		let timeArr = JSON.stringify(timeValue).substr(1).split(",");
		
		return `${timeArr[0]}년 ${timeArr[1]}월 ${timeArr[2]}일`;
	}
})