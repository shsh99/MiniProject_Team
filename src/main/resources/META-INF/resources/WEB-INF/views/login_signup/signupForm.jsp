<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jQuery 설치 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>

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

<script type="text/javascript">
	$(document).ready(function() {

		// 비밀번호 확인
		$("#passwd2").on("keyup", function() {
			var password = $("#password").val();
			var passwd2 = $("#passwd2").val();
			var mesg = "비밀번호 일치";
			if (password != passwd2) {
				mesg = "비밀번호 불일치";
			}
			$("#pwdcheck").text(mesg);
		});

		// 아이디 중복 체크
		$("#idDupulicatedcheck").on("click", function() {
			// jQuery Ajax
			$.ajax({
				method : "get",
				url : "idCheck", // 아이디 체크 URL
				dataType : "text", // 응답되는 데이터 타입 (사용 가능 | 사용 불가)
				data : {
					login_id : $("#login_id").val()
				},
				success : function(data, status, xhr) {
					console.log("data:", data);
					console.log("status:", status);
					$("#idcheck").text(data);
				},
				error : function(xhr, status, error) {
					console.log("error:", error);
				}
			});
		});

		// 회원가입 서브밋
		$("form").on("submit", function() {
			// alert("memberForm submit");
			this.action = "signup"; // 회원가입 처리 URL
			this.method = "post";
		});

		// 입력 필드에 입력이 있는지 체크하여 클래스 추가/제거
		$('.form-field input').on('input', function() {
			var isValid = this.checkValidity();
			$(this).toggleClass('valid', isValid);
		});
	});
</script>

<div class="container">
	<div class="mb-4">
		<img src="images/ssg/signup.png" alt="로고"
			style="height: 100px; width: 300px;">
	</div>
	<form class="shadow p-3 mb-5 bg-white rounded" action="signup"
		method="post">
		<div class="row mb-3">
			<label for="login_id" class="col-sm-2 col-form-label">아이디</label>
			<div class="col form-field">
				<input type="text" class="form-control" id="login_id"
					name="login_id" required>
				<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 100 100">
                    <circle class="checkmark__circle" cx="26" cy="26"
						r="25" fill="none" />
                    <path class="checkmark__check" fill="none"
						d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                </svg>
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-primary"
					id="idDupulicatedcheck">아이디 중복</button>
			</div>
			<div class="col-sm-3">
				<span id="idcheck" class="fs-5"></span>
			</div>
		</div>
		<div class="row mb-3">
			<label for="password" class="col-sm-2 col-form-label">비밀번호</label>
			<div class="col form-field">
				<input type="password" class="form-control" id="password"
					name="password" required>
				<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 100 100">
                    <circle class="checkmark__circle" cx="26" cy="26"
						r="25" fill="none" />
                    <path class="checkmark__check" fill="none"
						d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                </svg>
			</div>
		</div>
		<div class="row mb-3">
			<label for="passwd2" class="col-sm-2 col-form-label">비밀번호 확인</label>
			<div class="col form-field">
				<input type="password" class="form-control" id="passwd2"
					name="password_confirm" required>
				<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 100 100">
                    <circle class="checkmark__circle" cx="26" cy="26"
						r="25" fill="none" />
                    <path class="checkmark__check" fill="none"
						d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                </svg>
			</div>
			<div class="col-sm-3">
				<span id="pwdcheck" class="fs-5"></span>
			</div>
		</div>
		<div class="row mb-3">
			<label for="name" class="col-sm-2 col-form-label">이름</label>
			<div class="col form-field">
				<input type="text" class="form-control" id="name" name="name"
					required>
				<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 100 100">
                    <circle class="checkmark__circle" cx="26" cy="26"
						r="25" fill="none" />
                    <path class="checkmark__check" fill="none"
						d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                </svg>
			</div>
		</div>
		<div class="row mb-3">
			<label for="birth_date" class="col-sm-2 col-form-label">생년월일</label>
			<div class="col form-field">
				<input type="date" class="form-control" id="birth_date"
					name="birth_date" required>

			</div>
		</div>
		<hr>
		<div class="row mb-3">
			<div class="col">

				<label for="sample4_postcode" class="visually-hidden">우편번호</label> <input
					type="text" name="post" class="form-control" id="sample4_postcode"
					placeholder="우편번호" required>


			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-primary"
					onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col form-field">
				<label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
				<input type="text" name="address1" class="form-control"
					id="sample4_roadAddress" placeholder="도로명주소" required>

			</div>
			<div class="col form-field">
				<label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
				<input type="text" name="address2" class="form-control"
					id="sample4_jibunAddress" placeholder="지번주소" required> <span
					id="guide" style="color: #999"></span>

			</div>
		</div>
		<hr>
		<div class="row mb-3">
			<label for="phone" class="col-sm-2 col-form-label">전화번호</label>
			<div class="col form-field">
				<input type="text" class="form-control" id="phone" name="phone"
					required>
				<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 100 100">
                    <circle class="checkmark__circle" cx="26" cy="26"
						r="25" fill="none" />
                    <path class="checkmark__check" fill="none"
						d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                </svg>
			</div>
		</div>
		<div class="row mb-3">
			<label for="email" class="col-sm-2 col-form-label">이메일</label>
			<div class="col form-field">
				<input type="text" class="form-control" id="email" name="email"
					required>
				<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
					viewBox="0 0 100 100">
                    <circle class="checkmark__circle" cx="26" cy="26"
						r="25" fill="none" />
                    <path class="checkmark__check" fill="none"
						d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                </svg>
			</div>
		</div>
		<div class="row mb-3 d-none">
			<label for="role" class="col-sm-2 col-form-label">역할</label>
			<div class="col-auto">
				<select class="form-select" id="role" name="role">
					<option value="1">관리자</option>
					<option value="0" selected>일반 사용자</option>
				</select>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-12">
				<button type="submit" class="btn btn-primary">회원가입</button>
				<button type="reset" class="btn btn-primary">취소</button>
			</div>
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
</script>