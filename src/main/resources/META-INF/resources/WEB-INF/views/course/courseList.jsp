<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course List</title>
<style>
.course-card {
    border: 1px solid #343a40; /* 테두리 스타일 */
    margin: 10px; /* 요소 사이의 간격 */
    width: calc(33.33% - 20px); /* 각 요소의 너비 계산 (여백 포함) */
    box-sizing: border-box; /* 테두리를 포함한 크기 계산 */
    padding: 10px; /* 내부 여백 */
    float: left; /* 왼쪽으로 정렬 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

.clear {
    clear: both; /* float 해제 */
}
.course-card img {
    display: block; /* 이미지의 하단 여백 제거 */
    margin: 0 auto; /* 이미지를 중앙 정렬 */
}
</style>
<!-- Bootstrap CSS -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
<link rel="stylesheet"  href="webjars/bootstrap/5.3.3/css/bootstrap.min.css" >
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <div class="container">
        <!-- 캐러셀 시작 -->
        <div id="carouselExampleIndicators" class="carousel slide mb-4" data-ride="carousel">
            <div class="carousel-indicators">
                <c:forEach var="dto" items="${courseList}" varStatus="status">
                    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="${status.index}" class="<c:if test="${status.index eq 0}">active</c:if>" aria-current="true" aria-label="Slide ${status.index + 1}"></button>
                </c:forEach>
            </div>
            <div class="carousel-inner">
                <c:forEach var="dto" items="${courseList}" varStatus="status">
                    <div class="carousel-item <c:if test="${status.index eq 0}">active</c:if>">
                        <img src="images/logo/${dto.image}.png" class="d-block w-10" alt="Course Image">
                        <!-- 이미지 대신에 텍스트로 대체 -->
                        <div class="carousel-caption d-none d-md-block">
                            <h5>${dto.title}</h5>
                            <p>${dto.name}</p>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
            </button>
        </div>
        <!-- 캐러셀 끝 -->

        <!-- 강의 목록 시작 -->
        <div class="row">
            <c:forEach var="dto" items="${courseList}" varStatus="status">
                <div class="course-card">
                    <c:choose>
                        <c:when test="${dto.sale > 0}">
                            <div class="mt-2 fs-6">세일: ${dto.sale}%</div>
                        </c:when>
                        <c:otherwise>
                            <br>
                        </c:otherwise>
                    </c:choose>
                    <a href="courseRetrieve?id=${dto.id}"> 
                        <img src="images/logo/${dto.image}.png" width="150" height="100">
                    </a>
                    <div class="mt-4 fs-6">${dto.title}</div>
                    <div class="mt-2 fs-6">${dto.name}</div>
                    <div class="mt-2 fs-6">${dto.period}개월</div>
                    <div class="mt-2 fs-6">
                        가격: 
                        <fmt:formatNumber value="${dto.price}" type="number" groupingUsed="true" />
                        원 =>
                        <c:set var="discountedPrice" value="${dto.price - (dto.price * dto.sale / 100)}" />
                        <fmt:formatNumber value="${discountedPrice}" type="number" groupingUsed="true" />
                        원
                    </div>
                </div>
                <%-- 매 3개의 요소마다 clear 추가 --%>
                <c:if test="${(status.index + 1) % 3 == 0}">
                    <div class="clear"></div>
                </c:if>
            </c:forEach>
        </div>
        <!-- 강의 목록 끝 -->
    </div>
    <!-- Bootstrap JS (반드시 jQuery와 Popper.js를 먼저 추가해야 함) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
