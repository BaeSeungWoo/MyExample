<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="includes/header.jsp"%>


<div class="container">
	<div class="row">
		<c:forEach items="${files}" var="fboard">
			<div class="col-3" style="width: 400px">
				<div class="card">
					<img class = "card-imp-top" src="/app07/resources/img/${fboard.fileImage}"
					alt = "Card Image" style = "width:100%;height:200px">
					<div class="card-body">
						<h4 class="card-title">title : ${fboard.title}</h4>
							<p class="card-text">writer : ${fboard.writer}</p>
							<p class="card-text">content : ${fboard.content}</p>						
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
</div>

<%@ include file="includes/footer.jsp"%>