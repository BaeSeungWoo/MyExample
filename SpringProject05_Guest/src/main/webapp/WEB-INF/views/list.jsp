<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>게스트 목록(${count})</h3>
<form action = "glist">
<select name = "field">
<option value = "name">글쓴이</option>
<option value = "content">내용</option>
</select>
<input type = "text" name = "word"/>
<input type = "submit" value = "검색"/>
</form>
<c:forEach items = "${guestlist}" var = "guest">
글 번호 : ${guest.num}<br/>
글쓴이 : ${guest.name}<br/>
내용 : ${guest.content}<br/>
평가 : ${guest.grade}<br/>
작성일 : ${guest.created}<br/>
아이피 : ${guest.ipaddr}<br/>
<br/>
</c:forEach>
</body>
</html>