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
    <h1>Board List</h1>      
  </div>
</div>
	<div class="container">
	<input type="button" class="btn btn-primary"  value="글쓰기" onclick="location.href = 'boardWrite.jsp'"/>
		<table>
			<thead>
				<tr>
					<th>번호</th>					
					<th>제목</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${arr}" var="board">
					<tr>
						<td>${board.num}</td>
						<td><a href="boardDetail?num=${board.num}">${board.subject}</a></td>
						<td>${board.reg_date}</td>
						<td>${board.readcount}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
<%@ include file="../include/footer.jsp"%>
</body>
</html>