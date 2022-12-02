<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ include file="../include/header.jsp"%>
<div class="jumbotron jumbotron-fluid">
	<div class="container">
		<h1>Member List(${count})</h1>
	</div>
</div>

<div class="container">
	<table class="table table-hover">
		<thead>
			<tr>
				<th>이름</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>번호</th>
				<th>관리자여부</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${member}" var="member" varStatus="st">
				<tr>
					<td>${member.name}</td>
					<td><a href="memberDetail?userid=${member.userid}">${member.userid}</a></td>
					<td>${member.email}</td>
					<td>${member.phone}</td>
					<td>${member.admin}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<%@ include file="../include/footer.jsp"%>