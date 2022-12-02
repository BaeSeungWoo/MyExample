<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      
<%@ include file="/WEB-INF/views/includes/header.jsp"%>

<div class="container">
	<form action="join" method="post">
		<div class="form-group">
			<label for="userid">아이디 :</label> <input type="text"
				class="form-control" id="id" placeholder="Enter Userid"
				name="id">
			<div class = "col align-self-end">
			<span id = "idcheck"></span>
			</div>				
		</div>

		<div class="form-group">
			<label for="pass">비밀번호 :</label> <input type="text"
				class="form-control" id="pass" placeholder="Enter pass"
				name="pass">
		</div>
		<div class="form-group">
			<label for="pass-check">비밀번호 확인 :</label>
			<input type="text"
				class="form-control" id="pass-check" placeholder="Enter pass-check"
				name="pass-check">
		</div>
		<div class="form-group">
			<label for="name">이름 :</label>
			<input type="text" class="form-control" id="name" name="userid">
		</div>
		<div class="form-group">
			<label for="addr">주소 :</label>
			<input type="text" class="form-control" id="addr" name="addr">
		</div>
		    <button type = "button" class="btn btn-primary" id = "btnJoin">회원가입</button>
	</form>
</div>

<script>
$("#btnJoin").click(function(){
	if($("#id").val() == ""){
		alert("아이디를 입력하세요")
		$("#id").focus()
		return false;
		
	} if($("#pass").val() == ""){
		alert("비밀번호를 입력하세요")
		$("#pass").focus()
		return false;
		
	} if($("#pass-check").val() == ""){
		alert("비밀번호 중복확인 해주세요")
		$("#pass-check").focus()
		return false;
		
	} if($("#pass-check").val() != $("#pass").val()){
		alert("비밀번호가 맞지 않습니다")
		$("#pass-check").focus()
		return false;
		
	} if($("#name").val() == ""){
		alert("이름을 입력하세요")
		$("#name").focus()
		return false;
		
	} if($("#addr").val() == ""){
		alert("주소를 입력하세요")
		$("#addr").focus()
		return false;
	}
	
	data = {
		"id" : $("#id").val(),
		"pass" : $("#pass").val(),
		"name" : $("#name").val(),
		"addr" : $("#addr").val(),
	}
	
	$.ajax({
		type : "post",
		url : "/app07/member/join",
		contentType : "application/json;charset=utf-8",
		data:JSON.stringify(data)
	})
	.done(function(resp){
	    if(resp == "success"){
	    	alert("회원가입을 축하합니다.")
	    	location.href = "login"
	    } else if(resp == "fail") {
	    	$("#idcheck").html("<b>아이디가 중복됩니다</b>")
	    	$("#id").val("");
	    }
	    	
	})
	.fail(function(e){
		alert("회원가입 실패")
	})
})


</script>



<%@ include file="/WEB-INF/views/includes/footer.jsp"%>