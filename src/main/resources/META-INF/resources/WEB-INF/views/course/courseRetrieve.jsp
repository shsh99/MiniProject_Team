<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jQuery 설치 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
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

	});// ready()
</script>
<div class="container">
	<form class="row g-3 m-4">
		<input type="hidden" name="cs_id" value="${courseRetrieve.id}">
		<div class="row">
			<div class="card" style="width: 25rem;">
				<img src="images/course/${courseRetrieve.image}.png"
					class="card-img-top" alt="...">
				<div class="card-body">
					<h6 class="card-title">
						<span class="fw-bold">강의제목:</span> ${courseRetrieve.title}
					</h6>
					<h6 class="card-text">
						<span class="fw-bold ">강사명:</span> ${courseRetrieve.name}
					</h6>
					<h6 class="card-text">
						<span class="fw-bold ">기간:</span> ${courseRetrieve.period}
					</h6>
					<h6 class="card-text">
						<span class="fw-bold ">가격:</span> ${courseRetrieve.price}
					</h6>
					<h6 class="card-text">
						<span class="fw-bold ">강의 소개:</span>
						${courseRetrieve.introduction}
					</h6>
					<h6 class="card-text">
						<span class="fw-bold ">강의 주소:</span> ${courseRetrieve.link}
					</h6>
					<h6 class="card-text">
						<span class="fw-bold ">세일:</span> ${courseRetrieve.sale}
					</h6>
					<h6 class="card-text">
						<span class="fw-bold ">강의시간:</span> ${courseRetrieve.session}
					</h6>
					<h6 class="card-text">
						<span class="fw-bold ">카테고리:</span> ${courseRetrieve.category}
					</h6>

					<a href="#" class="btn btn-primary mt-3">수강신청</a>
					<button type="submit" class="btn btn-primary mt-3">장바구니</button>
				</div>
			</div>

		</div>
	</form>
</div>