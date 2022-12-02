<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp"%>    


<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1>Board Detail</h1>
	</div>
</div>

<div class="container">
<form action = "memberupdate" method = "post">
	<table class="table table-hover">
		<tr>
			<th>이름</th>
			<td>
			<input type = "text" name = "name" id = "name" value = "${member.name}"/>		
			</td>
			<th>아이디</th>
			<td>
			<input type = "text" name = "userid" id = "userid" value = "${member.userid}" readonly = "readonly"/>			
			</td>
		</tr>
		<tr>
			<th>번호</th>
			<td>
			<input type = "text" name = "phone" id = "phone" value = "${member.phone}"/>
			</td>
			<th>관리자여부</th>
			<td>
			<input type = "text" name = "admin" id = "admin" value = "${member.admin}" readonly = "readonly"/>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td colspan="3">
			<input type = "text" name = "pwd" id = "pwd" value = "${member.pwd}" readonly = "readonly"/>
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
			<input type = "text" name = "email" id = "email" value = "${member.email}"/>			
			</td>
		</tr>
	</table>
	<br />
		<button type="submit" class="btn btn-primary">수정</button>
		<button type="button" class="btn btn-secondary" id="delBtn">취소</button>
		</form>
</div>


<%@ include file="../include/footer.jsp"%>