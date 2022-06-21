console.log('배고파');

// 즉시실행함수
(function myFunction() {
	console.log("즉시 실행 스트레스");
})();

// 객체
var obj = {
	"bno": 1,
	"reply": "밥내놔",
	"replyer": "배고파",
	add : function() {
		console.log("?!?!?!?!?!")
	}
}
console.log(obj);

// 객체 접근
console.log(obj.bno);
console.log(obj.reply);
console.log(obj.replyer);

// 객체를 함수로 반환
function myObjFun(bno, reply, replyer) {
	return {
		"bno": bno,
		"reply": reply,
		"replyer": replyer,
	};
}
let reply1 = myObjFun(10, "점심시간 언제와", "배고파");
console.log(reply1);