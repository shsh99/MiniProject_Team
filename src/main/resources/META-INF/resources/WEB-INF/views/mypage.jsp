<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인홈페이지</title>
<style type="text/css">
.App {
	text-align: center;
	font-size: 16px;
}

label, input, button {
	margin: 10px;
	padding: 5px;
}

footer {
	bottom: 0;
	position: absolute;
	width: 90%;
	height: 40px;
}
</style>
<link rel="stylesheet"
	href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div class="App">
		<jsp:include page="common/header.jsp" flush="true" /><br>
		
		<hr>
		<jsp:include page="user/mypage.jsp" flush="true" />
		
			<!-- footer 보여주기 -->
		<jsp:include page="common/footer.jsp" />
	</div>
</body>
</html>