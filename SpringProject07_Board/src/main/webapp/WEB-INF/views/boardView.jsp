<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>  
<%@ include file="includes/header.jsp"%> 
<div class="container">
<input type = "hidden" id = "num" name = "num" value = "${view.num}"/>
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
			<td><fmt:formatDate value = "${view.regdate}" pattern = "yyyy-MM-dd"/></td>
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
	<br/>
	<c:if test = "${sessionScope.sMember.id == view.writer}">
		<button class="btn btn-primary" id="btnUpdate">수정</button>
		<button class="btn btn-secondary" id="delBtn">삭제</button>
	</c:if>			
</div>
<br/>
<br/>
<div align = "center">
<textarea rows = "3" cols = "50" id = msg></textarea>
<button class = "btn btn-secondary btn-sm" id = "btnComment">댓글쓰기</button>
</div>
<hr/>
<div id = "replyResult"></div>
<script>

var init = function(){
	$.ajax({
		type : "get",
		url : "/app07/reply/commentList/${view.num}"
		/* url : "/app07/reply/commentList",
		data : {
			bnum : $("#num").val()			
		} */
	})
	.done(function(resp){
		var str = "";
		$.each(resp, function(key, val){
			str += val.userid +' '
			str += val.content +' '
			str += val.regdate +' '
			if("${sessionScope.sMember.id}" == val.userid){
				str += "<a href = 'javascript:fdel("+val.cnum+")'>삭제</a> <br/>"
			}			
		})
		$("#replyResult").html(str)
	}) // done
	.fail(function(e){
		alert("실패");
	}) // fail
	
} // init

function fdel(cnum){
	$.ajax({
		type : "delete",
		url : "/app07/reply/delete/"+cnum
	})
	.done(function(resp){
		alert(resp + "번 글 삭제 완료")
		init();		
	})
	.fail(function(e){
		alert("댓글 삭제 실패 : "+ e)
	})
}

// 댓글 쓰기
$("#btnComment").click(function(){
	if($("#msg").val() ==""){
		alert("댓글을 입력하세요")
		return;
	}
	if(${empty sessionScope.sMember}){
		alert("로그인해주세요")
		location.href = "/app07/member/login"
		return;
	}
	data = {
			"bnum" : $("#num").val(),
			"content" : $("#msg").val()
	}
	$.ajax({
		type : "post",
		url : "/app07/reply/commentInsert",
		contentType : "application/json;charset=utf-8",
		data : JSON.stringify(data),
		success : function(resp){
			if(resp == "success") {
			  alert("댓글 추가 성공");
			}
			init();
		},
		error : function(e){
			alert("댓글 추가 실패")
		}
	})
})

// 수정폼
$("#btnUpdate").click(function(){
	if(!confirm("정말 수정할까요")){ // 기본은 false
		return false;
	}
	    location.href = "/app07/update/${view.num}"		
})

// 삭제
	$("#delBtn").click(function(){
		if(!confirm("정말 삭제할까요")){ // 기본은 false
			return false;
		}
		$.ajax({
			type : "delete",
			url : "/app07/delete/${view.num}",
			success : function(resp){
				if(resp == "success"){
					alert("삭제 성공");
					location.href = "/app07/list"
				}				
			},
			error : function(e){
				alert("error"+e)
			}
		})
	})
	
	init();

</script>  
<%@ include file="includes/footer.jsp"%>