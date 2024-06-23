<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.container {
	display: flex;
	width: 100%;
	height: 500px;
}

.back-image {
	flex: 1;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
}

 


</style>

<div class="TodoApp">

		<!-- content 보여주기 -->

		<jsp:include page="course/courseList.jsp" />
		
	
</div>






