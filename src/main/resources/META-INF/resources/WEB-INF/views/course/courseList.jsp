<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Course List</title>
<!-- Bootstrap 5 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.course-card {
	border: 1px solid #343a40; /* 테두리 스타일 */
	margin: 10px; /* 요소 사이의 간격 */
	box-sizing: border-box; /* 테두리를 포함한 크기 계산 */
	padding: 10px; /* 내부 여백 */
	text-align: left; /* 텍스트 왼쪽 정렬 */
	height: 100%; /* 고정된 높이 설정 */
	display: flex; /* Flexbox 사용 */
	flex-direction: column; /* Flexbox 방향 설정 */
	justify-content: space-between; /* Flexbox 요소 간 간격 설정 */
}

.card {
	height: 100%; /* 카드 높이를 100%로 설정 */
	background-color: #f8f9fa; /* 배경색 설정 */
}

.card .image-container {
	height: 200px; /* 이미지 컨테이너 높이 설정 */
	overflow: hidden; /* 넘치는 부분 숨김 */
}

.card .text-container {
	overflow: hidden; /* 넘치는 텍스트 숨김 */
	text-overflow: ellipsis; /* 넘치는 텍스트 생략 기호 */
	white-space: nowrap; /* 텍스트 한 줄로 표시 */
}

.course-title {
	white-space: nowrap; /* 제목 한 줄로 표시 */
	overflow: hidden; /* 넘치는 제목 숨김 */
	text-overflow: ellipsis; /* 넘치는 제목 생략 기호 */
}

.card-text {
	height: 90px; /* 카드 텍스트 높이 설정 */
	overflow: hidden; /* 넘치는 내용 숨김 */
	background-color: #e9ecef; /* 카드 텍스트 배경색 살짝 어둡게 */
	padding: 10px; /* 카드 텍스트 내부 여백 */
	border: 1px solid #ced4da; /* 카드 텍스트 테두리 */
	font-size: 14px; /* 텍스트 사이즈 설정 */
	color: #495057; /* 텍스트 색상 설정 */
}

.card-text .price {
	color: #0056b3; /* 가격 텍스트 색상 (어두운 파란색) */
}

.card-text .sale {
	color: #c82333; /* 세일 텍스트 색상 (어두운 빨간색) */
}

/* 캐러셀 크기 조정 */
#carouselExampleControls {
	max-width: 600px; /* 최대 너비 설정 */
	margin: 0 auto; /* 가운데 정렬 */
}

.carousel-inner {
	height: 350px; /* 고정된 높이 설정 */
}

.carousel-item {
	height: 90%; /* 캐러셀 아이템 높이를 부모 컨테이너에 맞추기 */
	background-size: cover; /* 배경 이미지 크기 조정 */
	background-position: center; /* 배경 이미지 가운데 정렬 */
}

.carousel-caption {
	display: none !important; /* 캡션 숨기기 */
}

.carousel-control-prev-icon, .carousel-control-next-icon {
	background-color: rgba(0, 0, 0, 0.5); /* 배경색 설정 */
	width: 50px; /* 너비 설정 */
	height: 50px; /* 높이 설정 */
	border-radius: 50%; /* 둥근 모서리 설정 */
}

/* 세일 알림 */
.sale-alert {
	position: absolute;
	top: 0;
	left: 0;
	background-color: rgba(220, 53, 69, 0.8);
	color: #fff;
	padding: 5px 10px;
	border-top-left-radius: 5px;
	border-bottom-right-radius: 5px;
	z-index: 999;
}

.container {
	width: 700px;
	max-width: 100%;
	background-color: #ffffff;
	border-radius: var(--border-radius);
	overflow: hidden;
	padding: 40px;
	margin: auto;
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}
231f20

</style>
</head>
<body>
	<div id="back" class="mt-0 mb-5" style="background-color: #231f20; width: 100%; height: 300px; overflow: hidden; box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1); /* 그림자 효과 */">
    <img src="images/banner.png" alt="로고" style="width: 700px; height: 250px; ">
</div>
	<div class="container mb-5">
		<!-- 캐러셀 -->
		<div id="carouselExampleControls" class="carousel slide mb-4"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<c:forEach var="dto" items="${courseList}" varStatus="status">
					<div class="carousel-item ${status.index == 0 ? 'active' : ''}"
						style="background-image: url('images/logo/${dto.image}.png'); background-position: center; background-size: contain; background-repeat: no-repeat; width: 600px; height: 350px;">
						<a href="courseRetrieve?id=${dto.id}" class="text-decoration-none"
							style="display: block; width: 100%; height: 100%;"> <!-- 이미지 클릭 시 상세 페이지로 이동 -->
						</a>
					</div>
				</c:forEach>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleControls" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</div>
	<!-- 캐러셀 끝 -->
	<div class="container mb-5">
		<div class="text-start fw-bold fs-5 my-4">
			<h2>실무 완벽 적응! 주니어 개발자 로드맵</h2>
		</div>
		<!-- 카드들을 2행 3열로 배치 -->
		<div class="row row-cols-1 row-cols-md-3 g-4">
			<c:forEach var="dto" items="${courseList}" varStatus="status">
				<div class="col">
					<div
						class="card rounded-4 border-0 shadow-sm p-3 position-relative">
						<a href="courseRetrieve?id=${dto.id}"> <img
							src="images/logo/${dto.image}.png" width="150" height="100">
							
						</a>

						<div class="card-body p-0">
							<!-- 세일 퍼센트 표시 -->
							<c:if test="${dto.sale > 0}">
								<div class="sale-alert">${dto.sale}%할인</div>
							</c:if>
							<!-- 강의 제목 -->
							<a href="courseRetrieve?id=${dto.id}" class="text-decoration-none">
								<h5 class="course-title py-2 m-0">${dto.title}</h5>
							</a>
							<!-- 카드 텍스트 -->
							<div class="card-text">
								<div class="mt-2 fs-6">
									가격: <span class="price"> <fmt:formatNumber
											value="${dto.price}" type="number" groupingUsed="true" />
									</span> 원 => <span class="price"> <fmt:formatNumber
											value="${dto.price - (dto.price * dto.sale / 100)}"
											type="number" groupingUsed="true" />
									</span> 원
								</div>
								<!-- 세일 퍼센트 표시 -->
								<c:if test="${dto.sale > 0}">
									<div class="mt-2 fs-6">
										세일: <span class="sale">${dto.sale}%</span>
									</div>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Bootstrap 5 JavaScript (반드시 Popper.js와 Bootstrap Bundle을 먼저 추가해야 함) -->
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
