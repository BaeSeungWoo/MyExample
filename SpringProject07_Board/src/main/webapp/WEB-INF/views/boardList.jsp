<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>   
<%@ include file="includes/header.jsp"%>
<div class="container">
<h3>게시판(${count})</h3>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${board}" var="board" varStatus="st">
				<tr>
				    <td>${rowNo-st.index}</td>
					<td><a href = "view/${board.num}">${board.title}[${board.replycnt}]</a></td>
					<td>${board.writer }</td>
					<td><fmt:formatDate value = "${board.regdate}" pattern = "yyyy-MM-dd"/></td>
					<td>${board.hitcount}</td>
				</tr>
			</c:forEach>

		</tbody>
	</table>
	
	<div class = "d-flex justify-content-between">
	<ul class="pagination">
	<!-- 이전 -->
	<c:if test="${p.startPage > p.blockPage}">
      <li class="page-item"><a class="page-link" 
      href="list?pageNum=${p.startPage-p.blockPage}&field=${p.field}&word=${p.word}">Previous</a>
      <%-- <a class="page-link" 
      href="list?pageNum=${p.startPage-p.blockPage}&field=${param.field}&word=${param.word}">Previous</a> --%>
      </li>
      </c:if>
      <!-- 페이지 -->
      <c:forEach begin = "${p.startPage}" end = "${p.endPage}" var = "i">
      <c:if test = "${p.currentPage == i}">
       <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
      </c:if>
      <c:if test = "${p.currentPage != i}">
       <li class="page-item"><a class="page-link" 
       href="list?pageNum=${i}&field=${p.field}&word=${p.word}">${i}</a></li>
      </c:if>
      </c:forEach>
      <!-- 다음 -->
      <c:if test = "${p.endPage < p.totPage}">
      <li class="page-item"><a class="page-link" 
      href="list?pageNum=${p.endPage+1}&field=${p.field}&word=${p.word}">Next</a>
      <%-- <a class="page-link" 
      href="list?pageNum=${p.endPage+1}&field=${param.field}&word=${param.word}">Next</a> --%>
      </li>
      </c:if>
    </ul>
	
	<form class="form-inline" action="/app07/list">
		<select class="form-control mr-sm-1" id="field" name="field">
			<option value="title">제목</option>
			<option value="content">내용</option>
			<option value="writer">작성자</option>
		</select> 
		<input class="form-control" type="text" placeholder="Search"
			id="word" name="word">
		<button class="btn btn-success" type="submit">Search</button>
	</form>
	</div>
	
</div>
<%@ include file="includes/footer.jsp"%>