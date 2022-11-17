<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<%@ include file="../include/header.jsp"%>
<body>
<div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1>Board Detail</h1>      
  </div>
</div>
	<div class="container">
		<table>
			<thead>
				<tr>
					<th>번호</th>	
					<th>작성자</th>
					<th>이메일</th>					
					<th>제목</th>
					<th>내용</th>	
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
					<tr>
						<td>${board.num}</td>
						<td>${board.userid}</td>
						<td>${board.email}</td>
						<td>${board.subject}</td>
						<td>${board.content}</td>
						<td>${board.reg_date}</td>
						<td>${board.readcount}</td>
					</tr>
			</tbody>
		</table>
		<button class="btn btn-primary" id="updateBtn" onclick="location.href='update'">수정</button>
	</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>