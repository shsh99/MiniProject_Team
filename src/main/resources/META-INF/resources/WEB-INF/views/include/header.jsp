<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"
	rel="stylesheet">
<style>
</style>

<header class="border-bottom border-light border-5 mb-5 p-2">
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="home"><img
				src="images/ssgonline.jpg" alt="Logo" style="height: 40px;"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">강의</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">전체 강의</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">개발 프로그래밍</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">웹 개발</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">기타</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#">Link</a></li>
				</ul>
				<form class="d-flex mx-auto"
					style="width: 70%; justify-content: center;">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>

			</div>
			<ul class="navbar-nav">
				<!-- 인증이 안된 사용자 -->
				<sec:authorize access="isAnonymous()">
					<li class="nav-item"><a class="nav-link" href="login">login / signup</a></li>
					<!-- <li class="nav-item"><a class="nav-link" href="signup">signup</a></li> -->
				</sec:authorize>
				<!-- 인증이 된 사용자 -->
				<sec:authorize access="isAuthenticated()">
					<li class="nav-item"><a class="nav-link" href="logout">logout</a></li>
					<li class="nav-item"><a class="nav-link" href="mypage">mypage</a></li>
				</sec:authorize>
			</ul>
		</div>
	</nav>
	<div class="alert alert-dark" role="alert">
		감사 할인 특가 이벤트, 인기 강의 30% 할인!<a href="#" class="alert-link"
			style="margin-right: 200px; text-decoration: none;"> 자세히 보기 </a> 기본부터 실무까지! 현업 개발자에게 배우는 웹
		개발<a href="#" class="alert-link" style="text-decoration: none;"> 자세히 보기 </a>
	</div>
	<!-- Bootstrap JS 및 Popper.js 추가 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>
	<script>
		function dropdownToggleHandler() {
			$('.dropdown-toggle').on('click', function(e) {
				e.preventDefault();
				var $el = $(this).next('.dropdown-menu');
				$('.dropdown-menu').not($el).removeClass('show');
				$el.toggleClass('show');
			});
		}

		$(document).ready(dropdownToggleHandler);
	</script>
</header>