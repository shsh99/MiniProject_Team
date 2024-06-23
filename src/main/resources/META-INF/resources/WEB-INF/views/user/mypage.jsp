<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
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
	width: 700px !important;
	max-width: 100%;
	background-color: #ffffff;
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1);
	border-radius: var(--border-radius);
	overflow: hidden;
	padding: 40px;
	margin: auto; /* 중앙 정렬을 위한 추가 */
}

.container h2 {
	background-color: #f5f5fa;
	padding: 20px;
	font-weight: 200;
	color: var(--lighter);
	font-size: 19px;
	text-align: center;
	margin: 0 0 30px 0;
}

.form-control {
	border-radius: var(--border-radius);
}

.btn-primary {
	background: #819FF7 !important; /* 모든 버튼의 기본 배경색 */
	border: none;
	border-radius: var(--border-radius);
	padding: 12px 24px;
	cursor: pointer;
	transition: background-color 0.3s ease;;
}

.btn-primary:hover {
	background-color: var(--secondary);
}

.mb-3, .mb-4 {
	margin-bottom: 1.5rem !important;
}

.col-auto {
	display: flex;
	align-items: center;
	margin-left: -15px;
}

.fs-5 {
	font-size: 1.25rem !important;
}

hr {
	border-color: var(--lighter);
}

.visually-hidden {
	position: absolute;
	width: 1px;
	height: 1px;
	margin: -1px;
	padding: 0;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	border: 0;
}

.form-field {
	display: flex;
	align-items: center;
	position: relative;
}

.form-field input {
	flex: 1;
}

.form-field svg {
	position: absolute;
	right: 10px; /* 오른쪽 끝에 위치하도록 설정 */
	width: 20px; /* SVG 너비 설정 */
	height: 20px; /* SVG 높이 설정 */
	fill: none; /* SVG 채우기 없음 */
	stroke: var(--light); /* SVG 테두리 색상을 기본 색상으로 설정 */
	stroke-width: 7; /* SVG 테두리 두께 */
	stroke-linecap: round; /* SVG 테두리 끝 모양 */
	stroke-dasharray: 1000; /* SVG 테두리 대시 배열 */
	stroke-dashoffset: -100; /* SVG 테두리 대시 오프셋 */
	transition: stroke-dashoffset 0.3s, stroke 0.3s;
	/* 대시 오프셋 및 색상 전환 효과 */
}

.form-field input:valid+svg {
	stroke-dashoffset: 0; /* 입력 필드가 유효할 때 대시 오프셋 설정 */
	stroke: var(--primary); /* 입력 필드가 유효할 때 테두리 색상 변경 */
}
</style>
<script>
	// Function to open the change password popup
	function openChangePasswordPopup() {
		var popupUrl = 'changePassword'; // URL of the change password page
		var popupName = 'changePasswordPopup'; // Name of the popup window
		var popupWidth = 400; // Width of the popup window
		var popupHeight = 300; // Height of the popup window
		var left = (screen.width - popupWidth) / 2;
		var top = (screen.height - popupHeight) / 2;

		window.open(popupUrl, popupName, 'width=' + popupWidth + ', height='
				+ popupHeight + ', left=' + left + ', top=' + top);
	}

	// Function to handle password change message from popup
	function handlePasswordChange(success, message) {
		if (success) {
			// Success message handling
			$('#passwordChangeSuccess').text(message);
			$('#passwordChangeSuccess').show();
			setTimeout(function() {
				$('#passwordChangeSuccess').fadeOut('slow');
			}, 1000); // 3 seconds
		} else {
			// Error message handling
			$('#passwordChangeError').text(message);
			$('#passwordChangeError').show();
			setTimeout(function() {
				$('#passwordChangeError').fadeOut('slow');
			}, 1000); // 3 seconds
		}
	}
	
	
</script>
</head>
<body>

	<div class="container mt-5">
		<%-- 비밀번호 변경 성공 메시지 출력 --%>
		<div id="passwordChangeSuccess" class="alert alert-success mt-3"
			style="display: none;">성공</div>

		<%-- 비밀번호 변경 실패 메시지 출력 --%>
		<div id="passwordChangeError" class="alert alert-danger mt-3"
			style="display: none;">실패</div>
			<div class="mb-4">
		<img src="images/ssg/mypage.png" alt="로고"
			style="height: 100px; width: 300px;">
	</div>
		<form action="updateUser" method="post" class="row g-3">
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
						name="password" value="${user.password}" readonly="readonly">
					<button type="button" class="btn btn-primary"
						onclick="openChangePasswordPopup()">비밀번호 변경하기</button>
				</div>
			</div>
			<div class="form-group col-md-12">
				<label for="sample4_postcode">우편번호</label>
				<div class="input-group">
					<input type="text" name="post" value="${user.post}"
						class="form-control" id="sample4_postcode" placeholder="우편번호">
					<button type="button" class="btn btn-primary"
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
			<div class="col-12 d-flex justify-content-between mt-4">
				<button type="submit" class="btn btn-primary">회원 정보 수정</button>
				<a class="btn btn-primary" href="withdraw">회원 탈퇴</a>
			</div>
		</form>


	</div>



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

							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}

							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
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
	</script>