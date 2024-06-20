<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- jQuery 설치 -->
<link rel="stylesheet"
	href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
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
	});
</script>

<div class="container">
	<form class="row g-3 m-4" action="signup" method="post">
		<div class="row mb-3">
			<label for="login_id" class="col-sm-2 col-form-label">*아이디</label>
			<div class="col-auto">
				<input type="text" class="form-control" id="login_id"
					name="login_id">
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-primary mb-3"
					id="idDupulicatedcheck">아이디 중복</button>
			</div>
			<div class="col-sm-3">
				<span id="idcheck" class="fs-5"></span>
			</div>
		</div>
		<div class="row mb-3">
			<label for="password" class="col-sm-2 col-form-label">*비밀번호</label>
			<div class="col-auto">
				<input type="password" class="form-control" id="password"
					name="password">
			</div>
		</div>
		<div class="row mb-3">
			<label for="passwd2" class="col-sm-2 col-form-label">비밀번호 확인</label>
			<div class="col-sm-5">
				<input type="password" class="form-control" id="passwd2"
					name="password_confirm">
			</div>
			<div class="col-sm-3">
				<span id="pwdcheck" class="fs-5"></span>
			</div>
		</div>
		<div class="row mb-3">
			<label for="name" class="col-sm-2 col-form-label">이름</label>
			<div class="col-auto">
				<input type="text" class="form-control" id="name" name="name">
			</div>
		</div>
		<div class="row mb-3">
			<label for="birth_date" class="col-sm-2 col-form-label">생년월일</label>
			<div class="col-auto">
				<input type="date" class="form-control" id="birth_date"
					name="birth_date">
			</div>
		</div>
		<hr>
		<div class="row mb-3">
			<div class="col-auto">
				<label for="sample4_postcode" class="visually-hidden">우편번호</label> <input
					type="text" name="post" class="form-control" id="sample4_postcode"
					placeholder="우편번호">
			</div>
			<div class="col-auto">
				<button type="button" class="btn btn-primary mb-3"
					onclick="sample4_execDaumPostcode()">우편번호 찾기</button>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-sm-5">
				<label for="sample4_roadAddress" class="visually-hidden">도로명주소</label>
				<input type="text" name="address1" class="form-control"
					id="sample4_roadAddress" placeholder="도로명주소">
			</div>
			<div class="col-sm-5">
				<label for="sample4_jibunAddress" class="visually-hidden">지번주소</label>
				<input type="text" name="address2" class="form-control"
					id="sample4_jibunAddress" placeholder="지번주소"> <span
					id="guide" style="color: #999"></span>
			</div>
		</div>
		<hr>
		<div class="row mb-3">
			<label for="phone" class="col-sm-2 col-form-label">전화번호</label>
			<div class="col-auto">
				<input type="text" class="form-control" id="phone" name="phone">
			</div>
		</div>
		<div class="row mb-3">
			<label for="email" class="col-sm-2 col-form-label">이메일</label>
			<div class="col-auto">
				<input type="text" class="form-control" id="email" name="email">
			</div>
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
		<div class="col-12">
			<button type="submit" class="btn btn-primary">회원가입</button>
			<button type="reset" class="btn btn-primary">취소</button>
		</div>
	</form>
</div>

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	// 본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('sample4_roadAddress').value = fullRoadAddr;
						document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';
						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>