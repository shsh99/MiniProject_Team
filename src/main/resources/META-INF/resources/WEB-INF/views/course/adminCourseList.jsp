<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="CourseApp">
	<div class="container">
			<h2>강의 관리</h2>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>강의 제목</th>
						<th>강사 이름</th>
						<th>강의 기간</th>
						<th>가격</th>
						<th>강의 링크</th>
						<th>이미지</th>
						<th>세일</th>
						<th>강의 시간</th>
						<th>카테고리</th>
						<th>수정하기</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${courseList}" varStatus="status">
						<tr>
							<td>${dto.title}</td>
							<td>${dto.name}</td>
							<td>${dto.period}개월</td>
							<td>${dto.price}원</td>
							<td><button class="btn btn-warning"
										onclick="window.open('${dto.link}', '_blank')">링크</button></td>
							<td><img src="images/logo/${dto.image}.png" alt="강의 이미지"
								style="max-width: 100px;"></td>
							<td>${dto.sale}</td>
							<td>${dto.session}</td>
							<td>${dto.category}</td>
							<td><a href="updateCourse?id=${dto.id}"
								class="btn btn-warning">수정</a></td>
							<td>
								<form action="deleteCourse" method="post">
									<input type="hidden" name="id" value="${dto.id}">
									<button type="submit" class="btn btn-warning">삭제</button>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<form action="deleteAllCourse" method="post">
			<button type="submit" class="btn btn-warning">전체삭제</button>

			<div class="btn btn-success m-5">전체삭제</div>
		</form>
	</div>
</div>
