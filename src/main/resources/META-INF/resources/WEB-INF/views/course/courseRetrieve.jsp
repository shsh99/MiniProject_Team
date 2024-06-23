<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- jQuery 설치 -->
<script src="webjars/jquery/3.7.1/jquery.min.js"></script>
<!-- Bootstrap CSS 설치 -->
<link href="webjars/bootstrap/5.3.3/css/bootstrap.min.css" rel="stylesheet">

<script type="text/javascript">
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

<!-- Bootstrap JS 설치 -->
<script src="webjars/bootstrap/5.3.3/js/bootstrap.bundle.min.js"></script>
