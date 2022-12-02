<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/includes/header.jsp"%>
<div class="container">
	<form action="join" method="post">
		<div class="form-group">
			<label for="id">아이디 :</label> <input type="text"
				class="form-control" id="id" placeholder="Enter Userid" name="id">
		</div>

		<div class="form-group">
			<label for="pass">비밀번호 :</label> <input type="text"
				class="form-control" id="pass" placeholder="Enter pass" name="pass">
		</div>
		
		<button type = "button" class = "btn btn-primary" id = "btnLogin">로그인</button>
	</form>
</div>

<script>
$("#btnLogin").click(function(){
	
	data = {
			"id" : $("#id").val(),
			"pass" : $("#pass").val()
	}
	
	$.ajax({
		type : "post",
		url : "/app07/member/login",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data)
	})
	.done(function(resp){
		if(resp == "no"){
			alert("회원이 아닙니다.")
			location.href = "join"
		} else if(resp == "success"){
			alert("로그인에 성공하셨습니다.")
			location.href = "/app07/"
		} else {
			alert("비밀번호를 확인하세요.")
		}
	})
	.fail(function(e){
		alert("error" +e)
	})
})

</script>

<%@ include file="/WEB-INF/views/includes/footer.jsp"%>