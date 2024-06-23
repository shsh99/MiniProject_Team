<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Form</title>
<link rel="stylesheet" href="/login_signup/login.css">
<link rel="stylesheet"
	href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
<style>
@import url('https://fonts.googleapis.com/css?family=Roboto:400,300');

:root {
	--primary: #819FF7;
	--secondary: #04DFBD;
	--lighter: #9596A2;
	--light: #3D4256;
	--dark: #1E2137;
	--border-radius: 12px;
}



.container {
	display: flex; /* 중앙 정렬을 위한 플렉스 박스 설정 */
	justify-content: center; /* 수평 중앙 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	height: 100%; /* 전체 높이를 100%로 설정 */
}

.login {
	width: 420px; /* 로그인 박스 너비 설정 */
	background: #ffffff; /* 로그인 박스 배경색 설정 */
	box-shadow: 0 20px 50px rgba(0, 0, 0, 0.1); /* 그림자 효과 */
	border-radius: var(--border-radius); /* 모서리 둥글게 */
	overflow: hidden; /* 내용이 넘치지 않도록 설정 */
	position: relative; /* 상대적 위치 설정 */
	display: flex; /* 플렉스 박스 설정 */
	flex-direction: column; /* 플렉스 박스 방향을 세로로 설정 */
	align-items: center; /* 플렉스 항목을 중앙 정렬 */
	padding: 40px; /* 내부 여백 설정 */
}

.login h2 {
	background: #f5f5fa; /* 제목 배경색 설정 */
	width: 100%; /* 너비 100% 설정 */
	margin: 0 0 30px 0; /* 외부 여백 설정 */
	padding: 20px; /* 내부 여백 설정 */
	font-weight: 200; /* 글꼴 두께 설정 */
	color: var(--lighter); /* 글꼴 색상 설정 */
	font-size: 19px; /* 글꼴 크기 설정 */
	text-align: center; /* 텍스트 중앙 정렬 */
}

.form-field {
	display: flex; /* 플렉스 박스 설정 */
	align-items: center; /* 항목 수직 정렬 */
	width: 100%; /* 너비 100% 설정 */
	margin-bottom: 30px; /* 아래쪽 외부 여백 설정 */
	border-bottom: 1px solid var(--lighter); /* 아래쪽 테두리 설정 */
	position: relative; /* 상대적 위치 설정 */
}

.form-field label {
	width: 10px; /* 라벨 너비 설정 */
	padding-right: 15px; /* 오른쪽 패딩 설정 */
	color: var(--lighter); /* 라벨 색상 설정 */
}

.form-field input {
	width: 100%; /* 입력 필드 너비 설정 */
	background: transparent; /* 배경색 투명 */
	color: var(--lighter); /* 글꼴 색상 설정 */
	padding: 15px; /* 내부 여백 설정 */
	border: 0; /* 테두리 제거 */
	margin: 0; /* 외부 여백 제거 */
	transition: color 0.3s; /* 색상 전환 효과 */
}

.form-field input+svg {
	width: 35px; /* SVG 너비 설정 */
	height: 35px; /* SVG 높이 설정 */
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

.form-field input:focus {
	outline: none; /* 포커스 시 외곽선 제거 */
}

.form-field *::placeholder {
	color: var(--lighter); /* 플레이스홀더 색상 설정 */
}

.button {
	width: 100%; /* 버튼 너비 설정 */
	position: relative; /* 상대적 위치 설정 */
	cursor: pointer; /* 커서 모양 설정 */
	box-sizing: border-box; /* 박스 모델 설정 */
	padding: 0; /* 내부 여백 제거 */
	border: 0; /* 테두리 제거 */
	background: transparent; /* 배경색 투명 */
	outline: none; /* 외곽선 제거 */
	transition: color 0.3s; /* 색상 전환 효과 */
}

.button .arrow-wrapper {
	width: 55px; /* 화살표 래퍼 너비 설정 */
	height: 55px; /* 화살표 래퍼 높이 설정 */
	  background: #819FF7; /* 배경색 업데이트 */
	box-shadow: 0 3px 20px rgba(var(--primary), 0.4); /* 그림자 효과 */
	border-radius: var(--border-radius); /* 모서리 둥글게 */
	position: absolute; /* 절대적 위치 설정 */
	right: 0; /* 오른쪽 끝 위치 */
	top: 50%; /* 수직 중앙 정렬 */
	transform: translateY(-50%); /* 수직 중앙 이동 */
	transition: all 0.45s ease-in-out; /* 전환 효과 */
}

.button .arrow {
	position: absolute; /* 절대적 위치 설정 */
	top: 50%; /* 수직 중앙 정렬 */
	right: 35px; /* 오른쪽 위치 설정 */
	transform: translateY(-50%); /* 수직 중앙 이동 */
	width: 15px; /* 화살표 너비 설정 */
	height: 2px; /* 화살표 높이 설정 */
	background: none; /* 배경색 없음 */
  opacity: 1; /* 기본 투명도 설정 */
    transition: opacity 0.3s; /* 투명도 전환 효과 */
}

.button .arrow:before {
	content: ''; /* 화살표 내용 설정 */
	position: absolute; /* 절대적 위치 설정 */
	top: -4px; /* 상단 위치 설정 */
	right: 0; /* 오른쪽 끝 위치 */
	width: 8px; /* 너비 설정 */
	height: 8px; /* 높이 설정 */
	border-top: 2px solid #fff; /* 상단 테두리 설정 */
	border-right: 2px solid #fff; /* 오른쪽 테두리 설정 */
	transform: rotate(45deg); /* 45도 회전 */
}

.button-text {
position: absolute; /* 절대적 위치 설정 */
    top: 0; /* 상단 위치 */
    left: 0; /* 왼쪽 위치 */
    right: 0; /* 오른쪽 위치 */
    padding: 0; /* 내부 여백 제거 */
    margin: 0; /* 외부 여백 제거 */
    color: #fff; /* 글자 색상 */
    line-height: 55px; /* 줄 높이 설정 */
    text-align: center; /* 중앙 정렬 */
    text-transform: uppercase; /* 대문자로 변환 */
    opacity: 0; /* 기본 투명도 설정 */
    transition: opacity 0.45s ease-in-out; /* 전환 효과 */
}

.button:hover .arrow-wrapper {
	width: 100%; /* 버튼에 마우스를 올리면 화살표 래퍼 너비 설정 */
}

.button:hover .arrow {
	background: #fff; /* 버튼에 마우스를 올리면 화살표 배경색 설정 */
	opacity: 0; /* 버튼에 마우스를 올리면 화살표 투명도 설정 */
}

.button .arrow-wrapper:hover .arrow {
    opacity: 0;
}
.button .button-text {
   position: absolute; /* 절대적 위치 설정 */
    top: 0; /* 상단 위치 */
    left: 0; /* 왼쪽 위치 */
    right: 0; /* 오른쪽 위치 */
    padding: 0; /* 내부 여백 제거 */
    margin: 0; /* 외부 여백 제거 */
    color: #fff; /* 글자 색상 */
    line-height: 55px; /* 줄 높이 설정 */
    text-align: center; /* 중앙 정렬 */
    text-transform: uppercase; /* 대문자로 변환 */
    opacity: 0; /* 기본 투명도 설정 */
    transition: opacity 0.45s ease-in-out; /* 전환 효과 */
}

.button .arrow-wrapper:hover .button-text {
    opacity: 1;
}

.loading .button .arrow-wrapper {
	width: 0; /* 로딩 중에는 화살표 래퍼 너비 0으로 설정 */
	transition: none; /* 전환 효과 제거 */
}

.loading .button-text {
	opacity: 0; /* 로딩 중에는 버튼 텍스트 투명도 0으로 설정 */
	transition: none; /* 전환 효과 제거 */
}

.active .button-text {
	opacity: 0; /* 활성화된 버튼에서는 버튼 텍스트 투명도 0으로 설정 */
	transition: none; /* 전환 효과 제거 */
}

.finished {
	position: absolute; /* 절대적 위치 설정 */
	top: 50%; /* 수직 중앙 정렬 */
	left: 50%; /* 수평 중앙 정렬 */
	transform: translate(-50%, -50%); /* 중앙 이동 */
	z-index: 7; /* z-index 설정 */
	display: none; /* 표시 안 함 */
}
</style>
</head>
<body>

	<div class="container">
	<div class="mb-4" style="box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1); border-radius: 12px; overflow: hidden;">
    <img src="images/main.png" alt="로고" style="height: 600px; width: 500px; object-fit: cover;">
</div>
	
		<div class="login">
		<div class="mb-4">
		<img src="images/ssg/login.png" alt="로고"
			style="height: 100px; width: 300px;">
	</div>
			<form class="row g-3 m-4" action="auth" method="post">
				<div class="form">
					<h2>Hello User</h2>
					<div class="form-field">
						<label for="login_id"><i class="fa fa-user"></i></label> <input
							id="login_id" type="text" name="login_id" placeholder="아이디"
							required>
						<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 100 100">
                            <circle class="checkmark__circle" cx="26"
								cy="26" r="25" fill="none" />
                            <path class="checkmark__check" fill="none"
								d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                        </svg>
					</div>
					<div class="form-field">
						<label for="password"><i class="fa fa-lock"></i></label> <input
							id="password" type="password" name="password" placeholder="비밀번호"
							required>
						<svg class="checkmark" xmlns="http://www.w3.org/2000/svg"
							viewBox="0 0 100 100">
                            <circle class="checkmark__circle" cx="26"
								cy="26" r="25" fill="none" />
                            <path class="checkmark__check" fill="none"
								d="M14.1 27.2l7.1 7.2 16.7-16.8" />
                        </svg>
					</div>
					<button type="submit" class="button">
						<div class="arrow-wrapper">
							<span class="arrow"></span> <span class="button-text">로그인</span>
						</div>
					</button>
				</div>
			</form>
		</div>
	</div>

	<!-- 스크립트 -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script>
		// 입력 필드에 입력이 있는지 체크하여 클래스 추가/제거
		$('.form-field input').on('input', function() {
			var isValid = this.checkValidity();
			$(this).toggleClass('valid', isValid);
		});

		// 로그인 버튼 클릭 시 로딩 효과
		$('.button').on(
				'click',
				function() {
					$(this).closest('.login').addClass('loading').delay(2200)
							.queue(
									function() {
										$(this).addClass('active').removeClass(
												'loading');
									});
				});
	</script>

</body>
</html>
