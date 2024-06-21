<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Page</title>
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