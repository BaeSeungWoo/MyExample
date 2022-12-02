<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="../includes/header.jsp"%>

<div class="container">
	<input type="hidden" value="${view.num}" id="num" name="num">
	<table class="table table-hover">
		<tr>
			<th>글번호</th>
			<td>${view.num}</td>
			<th>조회수</th>
			<td>${view.hitcount}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${view.writer}</td>
			<th>작성일</th>
			<td><fmt:formatDate value="${view.regdate}" pattern="yyyy-MM-dd" /></td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">${view.title}</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3">${view.content}</td>
		</tr>
		<tr>
			<th>댓글 조회수</th>
			<td colspan="3">${view.replycnt}</td>
		</tr>
	</table>

	<br />
	<br />
	<sec:authorize access = "isAuthenticated()">
	<c:if test = "${pinfo.username == view.writer}">
	<button class="btn btn-primary" id="btnUpdate">수정</button>
	<button class="btn btn-secondary" id="delBtn">삭제</button>
    </c:if>
    </sec:authorize>
	<br /> <br />
	<div align="center">
		<textarea rows="3" cols="50" id=msg></textarea>
		<button class="btn btn-secondary btn-sm" id="btnComment">댓글쓰기</button>
	</div>
	<hr/>
	<div id = "replyResult"></div>
	<sec:authorize access = "isAnonymous()">
	<input type = "hidden" id = "prin" name = "prin" value = "null"/>
	</sec:authorize>
	<sec:authorize access = "isAuthenticated()">
	<input type = "hidden" id = "prin" name = "prin" value = "${pinfo.username}"/>
	</sec:authorize>
</div>
<script>
var init = function(){
	$.ajax({
		type : "get",
		url : "/app08/reply/commentList/${view.num}"
	})
	.done(function(resp){
		var str = "댓글("+resp.count+")<br/>";
		$.each(resp.carr, function(key, val){
			str += val.userid + " "
			str += val.content + " "
			str += val.regdate + " "
			if($("#prin").val() == val.userid){
			str += "<a href = 'javascript:fdel("+val.cnum+")'>삭제</a><br/>"
			}
			str += "<br/>"
		})
		
		$("#replyResult").html(str)
	})
	.fail(function(e){
		alert("실패")
	})
}
function fdel(cnum){
	$.ajax({
		type : "delete",
		url : "/app08/reply/delete/"+cnum,
		})
		.done(function(){
			alert("댓글이 삭제되었습니다")
			init();
		})
		.fail(function(e){
			alert("삭제를 실패했습니다")
		})	
}
	$("#btnUpdate").click(function() {
		location.href = "/app08/board/update/${view.num}"
	})
	  $("#delBtn").click(function(){
		$.ajax({
			type : "delete",
			url : "/app08/board/delete/${view.num}"
		})
		.done(function(){
			alert("삭제 성공")
			location.href = "/app08/board/list"; 
		})
		.fail(function(e){
			alert("삭제 실패")
		})
	}) 
	
	$("#btnComment").click(function(){ 
		if($("#prin").val() == "null"){
			alert("로그인해주세요")
			location.href = "/app08/customLogin"
			return;
		}
		if($("#msg").val() == ""){
		  alert("댓글 입력");
		  return;
	    }
	    data = {
	    	"bnum" : $("#num").val(),
	    	"content" : $("#msg").val(),
	    	"userid" : $("#prin").val()
	    }
	    $.ajax({
	    	type : "post",
	    	url : "/app08/reply/commentInsert",
	    	contentType : "application/json;charset=utf-8",
			data : JSON.stringify(data)
	    })
	    .done(function(){
	    	alert("댓글 추가 성공")
	    	init();
	    })
	    .fail(function(e){
	    	alert("댓글 추가 실패 : " + e)
	    })
	})
	init();
</script>





















<%@ include file="../includes/footer.jsp"%>
