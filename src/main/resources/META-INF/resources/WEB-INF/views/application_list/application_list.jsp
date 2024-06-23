<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="TodoApp">
	<div class="container">
		<h2>수강목록</h2>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>유저이름</th>
						<th>강의제목</th>
						<th>가격</th>
						<th>기간</th>
						<th>이미지</th>
						<th>링크</th>
					</tr>
				</thead>
				<tbody>
					<c:set var="sum" value="0" />
					<c:forEach var="dto" items="${application_list}" varStatus="status">
						<c:forEach var="course" items="${dto.courseList}">
							<c:set var="endDate"
								value="${dto.application_date.plusMonths(course.period)}" />
							<tr>
								<td>${dto.user_name}</td>
								<td>${course.title}</td>
								<td><fmt:formatNumber value="${course.price}" type="number"
										groupingUsed="true" /> 원 => <c:set var="discountedPrice"
										value="${course.price - (course.price * course.sale / 100)}" />
									<fmt:formatNumber value="${discountedPrice}" type="number"
										groupingUsed="true" /> 원</td>
								<td>${dto.application_date}~${endDate}</td>
								<td><img src="images/logo/${course.image}.png" width="50"
									height="50"></td>
								<td><button class="btn btn-warning"
										onclick="window.open('${course.link}', '_blank')">시청</button></td>
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
						<td>총 결제금액: &nbsp; <fmt:formatNumber value="${sum}"
								type="number" groupingUsed="true" />원
						</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>
