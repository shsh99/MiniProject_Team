<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course Details</title>
<!-- jQuery 설치 -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
:root {
   --primary: #819FF7;
   --secondary: #04DFBD;
   --lighter: #9596A2;
   --light: #3D4256;
   --dark: #1E2137;
   --border-radius: 12px;
}

body {
   font-family: Arial, sans-serif;
   background-color: #f8f9fa;
   margin: 0;
   padding: 0;
}

.container {
   width: 80%;
   margin: 0 auto;
   padding: 20px;
   border: 1px solid #dee2e6;
   border-radius: 50px;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.mb-4 {
   margin-bottom: 1.5rem;
   text-align: center;
}

.row {
   display: flex;
   flex-wrap: wrap;
}

.col-6 {
   flex: 0 0 50%;
   max-width: 50%;
   padding: 15px;
   box-sizing: border-box;
}

.card {
   background-color: #fff;
   border: 1px solid #dee2e6;
   border-radius: 10px;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
   overflow: hidden;
}

.card img {
   width: 100%;
   height: auto;
   margin-bottom: 1rem;
}

.card-body {
   padding: 20px;
   border-top: 1px solid #dee2e6;
}

.left-align {
   text-align: left;
}

.fw-bold {
   font-weight: bold;
}

.mt-3 {
   margin-top: 1rem;
}

.btn {
   display: inline-block;
   font-weight: 400;
   color: #fff;
   text-align: center;
   vertical-align: middle;
   user-select: none;
   background-color: #007bff;
   border: 1px solid #007bff;
   padding: 0.375rem 0.75rem;
   font-size: 1rem;
   line-height: 1.5;
   border-radius: 0.25rem;
   text-decoration: none;
   margin-right: 10px; /* Add margin to space the buttons */
}

.btn-primary {
   background-color: #007bff;
   border-color: #007bff;
}

.btn-warning {
   background-color: #ffc107;
   border-color: #ffc107;
}

.btn-secondary {
   background-color: #6c757d;
   border-color: #6c757d;
}

.btn-group {
   display: flex;
   justify-content: space-between;
}

.btn.btn1 {
   background-color: #819FF7;
   color: #fff;
}

.btn.btn2 {
   background-color: #819FF7;
   color: #fff;
}

.btn.btn3 {
   background-color: #819FF7;
   color: #fff;
}

.average-rating {
   font-size: 16px;
   color: #333;
}

.card-review {
   background-color: #f8f9fa;
   border: 1px solid #dee2e6;
   border-radius: 5px;
   padding: 10px;
   margin-bottom: 10px;
}

.review-title {
   font-size: 1.1rem;
   font-weight: bold;
}

.review-date {
   font-size: 0.875rem;
   color: #6c757d;
}

.review-content {
   margin-top: 0.5rem;
}
</style>
<script type="text/javascript">
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
      <div class="mb-4">
         <img src="images/ssg/course.png" alt="로고"
            style="height: 100px; width: 300px;">
      </div>

      <div class="row">
         <div class="col-6">
            <div class="card shadow-sm rounded" style="width: 100%;">
               <img src="images/course/${courseRetrieve.image}.png"
                  class="card-img-top mb-3" alt="...">
               <div class="card-body left-align">
                  <h6 class="card-title">
                     <span class="fw-bold">강의제목:</span> ${courseRetrieve.title}
                  </h6>
                  <hr>
                  <h6 class="card-text">
                     <span class="fw-bold">강사명:</span> ${courseRetrieve.name}
                  </h6>
                  <hr>
                  <h6 class="card-text">
                     <span class="fw-bold">기간:</span> ${courseRetrieve.period}개월
                  </h6>
                  <hr>
                  <h6 class="card-text">
                     <span class="fw-bold">세일:</span> ${courseRetrieve.sale}%
                  </h6>
                  <hr>
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
                  <hr>
                  <h6 class="card-text">
                     <span class="fw-bold">강의 소개:</span>
                     ${courseRetrieve.introduction}
                  </h6>
                  <hr>
                  <h6 class="card-text">
                     <span class="fw-bold">강의시간:</span> ${courseRetrieve.session}시간
                  </h6>
                  <hr>
                  <h6 class="card-text">
                     <span class="fw-bold">카테고리:</span> ${courseRetrieve.category}
                  </h6>
                  <hr>
                  <!-- 버튼 그룹 -->
                  <div class="btn-group mt-3">
                     <!-- 수강신청 버튼 폼 -->
                     <form id="applicationForm" method="post">
                        <input type="hidden" name="cs_id" value="${courseRetrieve.id}">
                        <button type="submit" class="btn btn1">수강신청</button>
                     </form>

                     <!-- 장바구니 버튼 폼 -->
                     <form id="cartForm" method="post">
                        <input type="hidden" name="cs_id" value="${courseRetrieve.id}">
                        <button type="submit" class="btn btn2">장바구니</button>
                     </form>

                     <!-- 리뷰 작성 버튼 폼 -->
                     <form id="reviewForm" method="get">
                        <input type="hidden" name="cs_id" value="${courseRetrieve.id}">
                        <button type="submit" class="btn btn3">리뷰 작성</button>
                     </form>
                  </div>
               </div>
            </div>
         </div>

         <div class="col-6">
            <div class="card-body left-align">
               <!-- 리뷰 목록 출력 -->
               <h3>Review</h3>
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
                        <div class="card card-review">
                           <p class="review-title">제목: ${review.re_title}</p>
                           <p class="review-rating">평점: ${review.rating} / 5</p>
                           <p class="review-content">내용 : ${review.content}</p>
                           <p class="review-date">작성일 : ${review.date}</p>
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
