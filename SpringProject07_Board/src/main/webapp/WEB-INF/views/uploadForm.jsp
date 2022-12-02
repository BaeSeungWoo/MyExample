<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp"%>


<div class="container">
	
	<form action="fileAction" method="post" enctype = "multipart/form-data">
		
		<div class="form-group">
			<input type = "file" name = "uploads"/> 
		</div>
		<div class="form-group">
            <input type = "file" name = "uploads"/>
		</div>		
		<div class="form-group">
			<input type = "file" name = "uploads"/>
		</div>
		    <button type="submit" class="btn btn-primary">등록</button>
		    
	</form>

</div>

<%@ include file="includes/footer.jsp"%>