<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/includes/header.jsp"%>


<div class="container">
		<div class="form-group">
			<label for="title">아이디 :</label> <input type="text"
				class="form-control" id="id" value = "${sessionScope.sMember.id}" name="id"
				readonly = "readonly">
		</div>

		<div class="form-group">
			<label for="email">이름 :</label> <input type="text"
				class="form-control" id="name" value = "${sessionScope.sMember.name}" name="name">
		</div>
		<div class="form-group">
			<label for="content">비밀번호 :</label>
			 <input type="text"
				class="form-control" id="pass" value = "${sessionScope.sMember.pass}" name="pass">
		</div>
		<div class="form-group">
			<label for="content">주소 :</label>
			 <input type="text"
				class="form-control" id="addr" value = "${sessionScope.sMember.addr}" name="addr">
		</div>
		    <button type = "button" class="btn btn-primary" id = "btnUpdate">수정</button>
</div>
<script>
$("#btnUpdate").click(function(){
	
	  if($("#pass").val() == ""){
		alert("비밀번호를 입력하세요")
		$("#pass").focus()
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
			"addr" : $("#addr").val()
	}
	
	$.ajax({
		type : "put",
		url : "/app07/member/update",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data)
	})
	.done(function(resp){
		alert("수정되었습니다")
		location.href = "/app07/member/login"
	})
	.fail(function(e){
		alert("error"+e)
	})
})
</script>
<%@ include file="/WEB-INF/views/includes/footer.jsp"%>