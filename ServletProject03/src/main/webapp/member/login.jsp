<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Login</h1>      
  </div>
</div>

<div class="container">
		<form action="" method="post" id="frm">
			<div class="form-group">
				<label for="userid">UserID:</label> <input type="text"
					class="form-control" id="userid" placeholder="Enter name"
					name="name">
			</div>



			<div class="form-group">
				<label for="pwd">Password:</label> <input type="password"
					class="form-control" id="pwd" placeholder="Enter Password"
					name="pwd">
			</div>


			<br /> <br />


			<button type="button" class="btn btn-primary" id="loginBtn">로그인</button>
		</form>
	</div>
<script>
$("#loginBtn").click(function() {
	if ($("#userid").val() == "") {
		alert("아이디를 입력하세요.");
		$("#userid").focus();
		return false;
	}
	if ($("#pwd").val() == "") {
		alert("비밀번호를 입력하세요.");
		$("#pwd").focus();
		return false;
	} // pwd
	$.ajax({
		type : "post",
		url : "login",
		data : {
			"userid" : $("#userid").val(),
			"pwd" : $("#pwd").val()
		},
		success : function(resp) {
			if(resp.trim() == 0){
				alert("로그인에 성공하셨습니다. 일반회원입니다.")
				// 일반회원이면 memberView, 관리자면 memberList
				$(location).attr("href","/board/boardlist")
			} else if(resp.trim() == -1) {
				alert("등록된 회원이 아닙니다.")
			} else if(resp.trim() == 1) {
				alert("로그인에 성공하셨습니다. 관리자입니다.")
				$(location).attr("href","/board/boardlist")
			} else if(resp.trim() == 2) {
				alert("비밀번호가 올바르지 않습니다.")
			}
		},
		error : function(e) {
			alert(e + "error")
		}
	}) // ajax
})
</script>
<%@ include file="../include/footer.jsp"%>