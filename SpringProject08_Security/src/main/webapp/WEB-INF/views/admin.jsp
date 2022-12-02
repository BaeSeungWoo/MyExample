<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "sec" uri = "http://www.springframework.org/security/tags" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
admin
<p>principal:<sec:authentication property="principal" /> </p>
<p>member:<sec:authentication property="principal.member" /> </p>
<p>사용자 이름:<sec:authentication property="principal.member.username" /> </p>
<p>사용자 id:<sec:authentication property="principal.member.userid" /> </p>
<p>사용자 id(username):<sec:authentication property="principal.member.username" /> </p>
<p>권한:<sec:authentication property="principal.member.authList" /> </p>
<a href = "/app08/logout">로그아웃</a>
<!-- <a href = "/app08/customLogout">로그아웃</a> -->
</body>
</html>