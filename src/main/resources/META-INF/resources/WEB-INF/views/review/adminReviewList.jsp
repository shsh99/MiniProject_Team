<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="CourseApp">
	<div class="container">
		<h2>리뷰 관리</h2>
		<div>
			<table class="table">
				<thead>
					<tr>
						<th>사용자 아이디</th>
						<th>강의 제목</th>
						<th>이미지</th>
						<th>리뷰 제목</th>
						<th>별점</th>
						<th>리뷰 내용</th>
						<th>작성 날짜</th>
						<th>Delete</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="dto" items="${reviewList}" varStatus="status">
						<c:forEach var="course" items="${dto.courseList}"
							varStatus="status">
							<tr>
								<td>${dto.login_id}</td>
								<td>${course.title}</td>
								<td><img src="images/logo/${course.image}.png" alt="강의 이미지"
									style="max-width: 100px;"></td>
								<td>${dto.re_title}</td>
								<td>${dto.rating}</td>
								<td>${dto.content}</td>
								<td>${dto.date}</td>
								<td>
									<form action="deleteReview" method="post">
										<input type="hidden" name="id" value="${dto.id}">
										<button type="submit" class="btn btn-warning">삭제</button>
									</form>
								</td>
							</tr>
						</c:forEach>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<form action="deleteAllCourse" method="post">
			<button type="submit" class="btn btn-warning">전체삭제</button>
		</form>
	</div>
</div>
