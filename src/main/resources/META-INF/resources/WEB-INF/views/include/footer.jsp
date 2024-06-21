<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<style>
body {
	padding-bottom: 100px; /* 푸터 공간을 만들기 위한 body 패딩 */
	position: relative; /* body를 relative로 설정하여 절대 위치를 설정할 수 있도록 함 */
	min-height: 100vh;
	/* 화면 높이를 최소 100%로 설정하여 내용이 적어도 푸터가 화면 하단에 고정될 수 있도록 함 */
}

.container {
	padding-top: 20px; /* 컨텐츠와 푸터 사이의 여백 설정 */
	padding-bottom: 20px; /* 컨텐츠와 푸터 사이의 여백 설정 */
}

footer {
	position: absolute; /* 절대 위치로 푸터를 설정 */
	bottom: 0; /* 화면 하단에 고정 */
	width: 100%;
	height: 100px; /* 푸터 높이 */
	background-color: #f8f9fa; /* 배경색 */
	text-align: center; /* 텍스트 가운데 정렬 */
	padding: 20px 0; /* 내부 패딩 */
}
</style>




<footer>

    <div class="container-fluid bg-dark text-light">
        <div class="row">
            <div class="col">
                <p>&copy; 2024 Your Company. All rights reserved.</p>
            </div>
            <div class="col">
                <ul class="list-unstyled">
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms of Service</a></li>
                </ul>
            </div>
        </div>
    </div>
    
</footer>

