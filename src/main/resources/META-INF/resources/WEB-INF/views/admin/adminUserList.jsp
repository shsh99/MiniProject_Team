<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Admin - User List</title>
<link rel="stylesheet" href="path/to/your/css/styles.css">
<style>
/* CSS for button */
.btn2 {
	display: inline-block;
	padding: 10px 16px; /* 버튼 안쪽 여백 조정 */
	background: #819FF7 !important; /* 버튼 배경색: 819FF7 */
	color: #ffffff; /* 텍스트 색상: 흰색 */
	text-decoration: none;
	border: 1px solid #819FF7; /* 테두리 색상: 819FF7 */
	cursor: pointer;
	border-radius: 4px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3); /* 그림자 효과 */
	font-family: 'Noto Sans KR', sans-serif; /* 폰트 설정 */
	line-height: 14px; /* 텍스트 수직 정렬 조정 */
}

.btn2:hover {
	background-color: #6A85A6; /* 호버 시 배경색 변경 */
	border-color: #6A85A6; /* 호버 시 테두리 색상 변경 */
}

/* CSS for table */
.table {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
}

.table th, .table td {
	border: 1px solid #ddd;
	padding: 10px; /* 셀 안쪽 여백 조정 */
	text-align: center;
	border-radius: 10px; /* 둥글게 모서리 조정 */
	font-family: 'Noto Sans KR', sans-serif; /* 폰트 설정 */
}

.table th {
	background-color: #f2f2f2;
}

/* Remove underline from links */
a {
	text-decoration: none;
	font-family: 'Noto Sans KR', sans-serif; /* 폰트 설정 */
}

.table td {
	color: #6E6E6E; /* 테이블 셀 내의 글자 색상 */
	font-family: 'Noto Sans KR', sans-serif; /* 폰트 설정 */
}
</style>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap"
	rel="stylesheet">
<!-- Noto Sans KR 폰트를 Google Fonts에서 가져오기 -->
</head>
<body>
	<div class="TodoApp">
		<div class="container">
			<div class="mb-4">
				<img src="images/ssg/user.png" alt="로고"
					style="height: 100px; width: 300px;">
			</div>
			<div>
				<table class="table">
					<thead>
						<tr>
							<th>ID</th>
							<th>로그인 ID</th>
							<th>이름</th>
							<th>이메일</th>
							<th>전화번호</th>
							<th>역할</th>
							<th>자세히 보기</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="user" items="${users}">
							<tr>
								<td>${user.id}</td>
								<td>${user.login_id}</td>
								<td>${user.name}</td>
								<td>${user.email}</td>
								<td>${user.phone}</td>
								<td><c:choose>
										<c:when test="${user.role == 1}">
                                            관리자
                                        </c:when>
										<c:otherwise>
                                            사용자
                                        </c:otherwise>
									</c:choose></td>
								<td><a class="btn2" href="adminUserUpdate?id=${user.id}">자세히
										보기</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<a class="btn2" href="home">홈으로 돌아가기</a>
</body>
</html>
