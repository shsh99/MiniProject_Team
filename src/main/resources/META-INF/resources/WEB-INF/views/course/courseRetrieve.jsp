<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Details</title>
=======
    pageEncoding="UTF-8"%>
>>>>>>> branch 'main' of https://github.com/shsh99/MiniProject_Team.git
<!-- jQuery 설치 -->
<<<<<<< HEAD
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
.left-align {
	text-align: left;
}

.average-rating {
	font-size: 16px;
	color: #333;
}
</style>
=======
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<!-- Bootstrap CSS 설치 -->
<link href="webjars/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">

>>>>>>> branch 'main' of https://github.com/shsh99/MiniProject_Team.git
<script type="text/javascript">
<<<<<<< HEAD
	$(document).ready(function() {
		// 수강신청 버튼 클릭
		$("#applicationForm").on("submit", function() {
			this.action = "applicationAdd"; // 서블릿의 맵핑값
			this.method = "post";
		});

		// 장바구니 버튼 클릭
		$("#cartForm").on("submit", function() {
			this.action = "cartAdd"; // 서블릿의 맵핑값
			this.method = "post";
		});
=======
    $(document).ready(function() {
        $("#up").on("click", function() {
            var gAmount = Number.parseInt($("#gAmount").val());
            $("#gAmount").val(gAmount + 1);
        });

        $("#down").on("click", function() {
            var gAmount = Number.parseInt($("#gAmount").val());
            if (gAmount == 1) {
                $("#gAmount").val(1);
            } else {
                $("#gAmount").val(gAmount - 1);
            }
        });

        // 회원가입 서브밋
        $("form").on("submit", function() {
            alert("cartAdd submit");
            this.action = "cartAdd"; //CartAddServlet의 맵핑값
            this.method = "post";
        });
    }); // ready()
</script>
>>>>>>> branch 'main' of https://github.com/shsh99/MiniProject_Team.git

<<<<<<< HEAD
		// 리뷰 작성 버튼 클릭
		$("#reviewForm").on("submit", function() {
			this.action = "reviewAdd"; // 리뷰 작성 폼으로 이동
			this.method = "get";
		});
	});
</script>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-6">
				<div class="card" style="width: 100%;">
					<img src="images/course/${courseRetrieve.image}.png"
						class="card-img-top" alt="...">
					<div class="card-body left-align">
						<h6 class="card-title">
							<span class="fw-bold">강의제목:</span> ${courseRetrieve.title}
						</h6>
						<h6 class="card-text">
							<span class="fw-bold">강사명:</span> ${courseRetrieve.name}
						</h6>
						<h6 class="card-text">
							<span class="fw-bold">기간:</span> ${courseRetrieve.period}개월
						</h6>
						<h6 class="card-text">
							<span class="fw-bold">세일:</span> ${courseRetrieve.sale}%
						</h6>
						<h6 class="card-text">
							<span class="fw-bold">가격:</span>
							<fmt:formatNumber value="${courseRetrieve.price}" type="number"
								groupingUsed="true" />
							원 =>
							<c:set var="discountedPrice"
								value="${courseRetrieve.price - (courseRetrieve.price * courseRetrieve.sale / 100)}" />
							<fmt:formatNumber value="${discountedPrice}" type="number"
								groupingUsed="true" />
							원
						</h6>
						<h6 class="card-text">
							<span class="fw-bold">강의 소개:</span>
							${courseRetrieve.introduction}
						</h6>
						<h6 class="card-text">
							<span class="fw-bold">강의시간:</span> ${courseRetrieve.session}시간
						</h6>
						<h6 class="card-text">
							<span class="fw-bold">카테고리:</span> ${courseRetrieve.category}
						</h6>

						<!-- 수강신청 버튼 폼 -->
						<form id="applicationForm" method="post">
							<input type="hidden" name="cs_id" value="${courseRetrieve.id}">
							<button type="submit" class="btn btn-primary mt-3">수강신청</button>
						</form>

						<!-- 장바구니 버튼 폼 -->
						<form id="cartForm" method="post">
							<input type="hidden" name="cs_id" value="${courseRetrieve.id}">
							<button type="submit" class="btn btn-warning mt-3">장바구니</button>
						</form>

						<!-- 리뷰 작성 버튼 폼 -->
						<form id="reviewForm" method="get">
							<input type="hidden" name="cs_id" value="${courseRetrieve.id}">
							<button type="submit" class="btn btn-secondary mt-3">리뷰
								작성</button>
						</form>

					</div>
				</div>
			</div>
=======
<div class="container mt-4">
    <div class="row">
        <div class="col-md-6">
            <form class="row g-3">
                <input type="hidden" name="cs_id" value="${courseRetrieve.id}">
                <div class="col-md-12">
                    <img src="images/course/${courseRetrieve.image}.png" class="img-fluid rounded mb-3" alt="Course Image">
                    <div class="bg-light p-4 rounded">
                        <p class="mb-1 text-start">
                            <span class="fw-bold">강의제목:</span> ${courseRetrieve.title}
                        </p>
                        <p class="mb-1 text-start">
                            <span class="fw-bold">강사명:</span> ${courseRetrieve.name}
                        </p>
                        <p class="mb-1 text-start">
                            <span class="fw-bold">기간:</span> ${courseRetrieve.period}개월
                        </p>
                        <p class="mb-1 text-start">
                            <span class="fw-bold">가격:</span> ${courseRetrieve.price}원
                        </p>
                        <p class="mb-1 text-start">
                            <span class="fw-bold">강의 소개:</span> ${courseRetrieve.introduction}
                        </p>
                        <p class="mb-1 text-start">
                            <span class="fw-bold">강의주소:</span> ${courseRetrieve.link}
                        </p>
                        <p class="mb-1 text-start">
                            <span class="fw-bold">세일:</span> ${courseRetrieve.sale}%
                        </p>
                        <p class="mb-1 text-start">
                            <span class="fw-bold">강의시간:</span> ${courseRetrieve.session}시간
                        </p>
                        <p class="mb-1 text-start">
                            <span class="fw-bold">카테고리:</span> ${courseRetrieve.category}
                        </p>
                        <div class="d-flex justify-content-start">
                            <a href="#" class="btn btn-primary me-2">수강신청</a>
                            <a href="review" class="btn btn-primary me-2">리뷰 작성</a>
                            <button type="submit" class="btn btn-secondary">장바구니</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
>>>>>>> branch 'main' of https://github.com/shsh99/MiniProject_Team.git

<<<<<<< HEAD
			<div class="col-6">
				<div class="card-body left-align">
					<!-- 리뷰 목록 출력 -->
					<h3>리뷰</h3>
					<c:choose>
						<c:when test="${not empty reviews}">
							<p class="average-rating">
								평균 평점:
								<c:set var="totalRating" value="0" />
								<c:forEach var="review" items="${reviews}">
									<c:set var="totalRating" value="${totalRating + review.rating}" />
								</c:forEach>
								<c:set var="averageRating"
									value="${totalRating / reviews.size()}" />
								${averageRating}
							</p>
							<c:forEach var="review" items="${reviews}">
								<div class="card">
									<p>제목: ${review.re_title} 평점: ${review.rating} / 5</p>
									<p>${review.content}</p>
									<p>${review.date}</p>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p>리뷰가 없습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
=======
<!-- Bootstrap JS 설치 -->
<script src="webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
>>>>>>> branch 'main' of https://github.com/shsh99/MiniProject_Team.git
