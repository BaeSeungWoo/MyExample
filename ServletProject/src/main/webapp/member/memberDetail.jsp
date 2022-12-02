<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/header.jsp"%>
<script>
	$(function() {
		$("#delBtn").click(function() {
			if (confirm("정말 삭제할까요?")) {
				location.href = "memberDelete?userid=${member.userid}"
			}
		})
	})
</script>
<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1>Member Detail</h1>
	</div>
</div>

<div class="container">
<input type="hidden" id="userid" value="${member.userid}" />
	<table class="table table-hover">
		<tr>
			<th>이름</th>
			<td>${member.name }</td>
			<th>아이디</th>
			<td>${member.userid }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td colspan="3">${member.pwd}</td>
			
		</tr>
		<tr>
			<th>번호</th>
			<td colspan="3">${member.phone}</td>
		</tr>
		<tr>
		    <th>이메일</th>
			<td>${member.email}</td>
			<th>관리자여부</th>
			<td>${member.admin}</td>
		</tr>
	</table>
	<br />

  <c:if test="${member.admin == 0}">
		<button type="button" class="btn btn-primary"
			onclick="location.href='memberupdate?userid=${member.userid}'">수정</button>
		<button type="button" class="btn btn-secondary" id="delBtn"
		onclick="location.href='memberDelete?userid=${member.userid}'">삭제</button>
</c:if>
</div>
<%@ include file="../include/footer.jsp"%>