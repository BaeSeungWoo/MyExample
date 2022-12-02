<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp"%>    


<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1>Board Detail</h1>
	</div>
</div>

<div class="container">
<form action = "update" method = "post">
	<table class="table table-hover">
		<tr>
			<th>글번호</th>
			<td>
			<input type = "text" name = "num" id = "num" value = "${board.num}" readonly = "readonly"/>		
			</td>
			<th>조회수</th>
			<td>
			<input type = "text" name = "readcount" id = "readcount" value = "${board.readcount}" readonly = "readonly"/>			
			</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>
			<input type = "text" name = "userid" id = "userid" value = "${board.userid}" readonly = "readonly"/>
			</td>
			<th>작성일</th>
			<td>
			<input type = "text" name = "regdate" id = "regdate" value = "${board.regdate}" readonly = "readonly"/>
			</td>
		</tr>
		<tr>
			<th>글제목</th>
			<td colspan="3">
			<input type = "text" name = "subject" id = "subject" value = "${board.subject}"/>
			</td>
		</tr>
		<tr>
			<th>글내용</th>
			<td colspan="3">
			<input type = "text" name = "content" id = "content" value = "${board.content}"/>
			
			</td>
		</tr>
	</table>
	<br />
		<button type="submit" class="btn btn-primary">수정</button>
		<button type="button" class="btn btn-secondary" id="delBtn">취소</button>
		</form>
</div>


<%@ include file="../include/footer.jsp"%>