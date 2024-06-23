<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript">
	$(document).ready(
			function() {
				// 수강신청 버튼 클릭
				$("#applicationForm").on(
						"submit",
						function() {
							var form = this;
							// Ajax 또는 fetch API를 사용하여 수강 신청 처리

							// 수강 신청이 완료되면 장바구니에서 해당 항목을 삭제
							var deleteForm = $(form).closest("tr").find(
									"form[action='deleteCart']");
							$.post($(form).attr("action"), $(form).serialize())
									.done(function() {
										// 수강신청 처리 후, 해당 장바구니 항목 삭제
										deleteForm.submit();
									});

							return false; // 폼 제출 중지
						});
			});
</script>

<div class="TodoApp">
	<div class="container">
			<h2>카트 목록</h2>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>이미지</th>
						<th>강의제목</th>
						<th>세일</th>
						<th>가격</th>
						<th>기간</th>
						<th></th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:set var="sum" value="0" />
					<c:forEach var="dto" items="${cartList}" varStatus="status">
						<c:forEach var="course" items="${dto.courseList}">
							<tr>
								<td><img src="images/logo/${course.image}.png" width="50"
									height="50"></td>
								<td>${course.title}</td>
								<td>${course.sale}%</td>
								<td><fmt:formatNumber value="${course.price}" type="number"
										groupingUsed="true" /> 원 => <c:set var="discountedPrice"
										value="${course.price - (course.price * course.sale / 100)}" />
									<fmt:formatNumber value="${discountedPrice}" type="number"
										groupingUsed="true" /> 원</td>
								<td>${course.period}개월</td>
								<td>
									<form id="applicationForm" action="applicationAdd"
										method="post">
										<input type="hidden" name="cs_id" value="${dto.cs_id}">
										<button type="submit" class="btn btn-primary">수강신청</button>
									</form>
								</td>
								<td>
									<form action="deleteCart" method="post">
										<input type="hidden" name="id" value="${dto.id}">
										<button type="submit" class="btn btn-warning">삭제</button>
									</form>
								</td>
							</tr>
							<c:set var="sum" value="${sum + discountedPrice}" />

						</c:forEach>
					</c:forEach>

					<tr>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>총액: &nbsp; <fmt:formatNumber value="${sum}"
								type="number" groupingUsed="true" />원
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<form action="deleteAllCart" method="post">
			<button type="submit" class="btn btn-warning">전체삭제</button>
		</form>
	</div>
</div>
