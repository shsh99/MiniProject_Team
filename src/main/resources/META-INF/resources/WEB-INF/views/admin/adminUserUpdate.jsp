<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>사용자 정보 수정</title>
<style>
:root {
	--primary: #819FF7;
	--secondary: #04DFBD;
	--lighter: #9596A2;
	--light: #3D4256;
	--dark: #1E2137;
	--border-radius: 12px;
}

.container {
	max-width: 600px !important;
	margin: 0 auto;
	padding: 20px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* 그림자 추가 */
	border-radius: 10px; /* 모서리를 둥글게 */
	background-color: #fff; /* 배경색 추가 */
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 15px;
}

.form-control {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	border: 1px solid #ddd; /* 입력란 테두리 색상 추가 */
	border-radius: 5px; /* 입력란 모서리를 둥글게 */
}

.btn {
	background: #819FF7;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	padding: 10px 20px;
}

.btn.btn1{
background-color: #819FF7;
color: #fff;
}

.btn.btn2{
	background-color: #088A4B;
	color: #fff;
}

  

.btn.btn3 {
	background-color: #DF013A;
	color: #fff;
}



.input-group {
	display: flex;
}

.input-group button {
	margin-left: 10px;
}

.alert {
	padding: 15px;
	margin-bottom: 20px;
	border-radius: 5px;
}

.alert-success {
	background-color: #d4edda;
	color: #155724;
	border: 1px solid #c3e6cb;
}

.alert-danger {
	background-color: #f8d7da;
	color: #721c24;
	border: 1px solid #f5c6cb;
}
</style>
</head>
<body>
	<div class="container">


		<!-- 성공 및 오류 메시지 표시 -->
		<c:if test="${not empty success}">
			<div class="alert alert-success">${success}</div>
		</c:if>
		<c:if test="${not empty error}">
			<div class="alert alert-danger">${error}</div>
		</c:if>
		<div class="mb-4">
			<img src="images/ssg/add.png" alt="로고"
				style="height: 100px; width: 300px;">
		</div>
		<form action="${pageContext.request.contextPath}/adminUserUpdate"
			method="post" class="row g-3" id="updateForm">
			<input type="hidden" name="id" value="${user.id}">
			<div class="form-group col-md-12">
				<label for="name">이름</label> <input type="text" class="form-control"
					name="name" id="name" value="${user.name}" readonly="readonly">
			</div>
			<div class="form-group col-md-12">
				<label for="login_id">아이디</label> <input type="text"
					class="form-control" id="login_id" name="login_id"
					value="${user.login_id}" readonly="readonly">
			</div>
			<div class="form-group col-md-12">
				<label for="password">비밀번호</label>
				<div class="input-group">
					<input type="password" class="form-control" id="password"
						name="password" readonly="readonly">
					<button type="submit" class="btn btn1" name="resetPassword"
						value="true">비밀번호 초기화</button>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label for="sample4_postcode">우편번호</label>
				<div class="input-group">
					<input type="text" name="post" value="${user.post}"
						class="form-control" id="sample4_postcode" placeholder="우편번호">
					<button type="button" class="btn btn1"
						onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label for="sample4_roadAddress">도로명주소</label> <input type="text"
					name="address1" value="${user.address1}" class="form-control"
					id="sample4_roadAddress" placeholder="도로명주소">
			</div>
			<div class="form-group col-md-12">
				<label for="sample4_jibunAddress">지번주소</label> <input type="text"
					name="address2" value="${user.address2}" class="form-control"
					id="sample4_jibunAddress" placeholder="지번주소"> <span
					id="guide" class="form-text text-muted"></span>
			</div>
			<div class="form-group col-md-12">
				<label for="phone">전화번호</label> <input type="text" name="phone"
					value="${user.phone}" class="form-control" id="phone">
			</div>
			<div class="form-group col-md-12">
				<label for="email">이메일</label> <input type="email" name="email"
					value="${user.email}" class="form-control" id="email">
			</div>
			<div class="row mb-3">
				<label for="role" class="col-sm-2 col-form-label">역할</label>
				<div class="col-auto">
					<select class="form-select" id="role" name="role">
						<option value="1">관리자</option>
						<option value="2">일반 사용자</option>
					</select>
				</div>
			</div>
			<div class="col-12 d-flex justify-content-between mt-4">
				<button type="button" class="btn btn2"
					onclick="prepareUpdate()">회원 정보 수정</button>
				<a class="btn btn3"
					href="${pageContext.request.contextPath}/adminDeleteUser?id=${user.id}">회원
					탈퇴</a> <a class="btn btn1" href="adminUserList">뒤로가기</a>
			</div>
		</form>
	</div>
</body>
</html>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// Function to execute Daum postcode search
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// Handle postcode data
						var fullRoadAddr = data.roadAddress;
						var extraRoadAddr = '';

						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}

						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}

						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}

						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						document.getElementById('sample4_postcode').value = data.zonecode;
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						if (data.autoRoadAddress) {
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
						} else if (data.autoJibunAddress) {
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ data.autoJibunAddress + ')';
						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}

	function prepareUpdate() {
		// Submit form
		document.getElementById('updateForm').submit();
	}
</script>
