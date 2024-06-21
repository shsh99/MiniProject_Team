<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Withdraw</title>
<link rel="stylesheet"
    href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
//Function to close the popup window and handle parent window
function closeWindowAndHandleParent(success, message) {
    if (window.opener && !window.opener.closed) {
        window.opener.handleWithdrawal(success, message); // 부모 창의 처리 함수 호출
    }
    setTimeout(function() {
        window.close(); // 일정 시간 후 현재 창 닫기
    }, 1000); // 3 seconds
}

// Function to handle withdraw message from popup
function handleWithdrawal(success, message) {
    if (success) {
        // Success message handling
        $('#withdrawSuccess').text(message);
        $('#withdrawSuccess').show();
        setTimeout(function() {
            $('#withdrawSuccess').fadeOut('slow');
            closeWindowAndHandleParent(success, message); // 메시지 표시 후 창 닫기
        }, 1000); // 3 seconds
    } else {
        // Error message handling
        $('#withdrawError').text(message);
        $('#withdrawError').show();
        setTimeout(function() {
            $('#withdrawError').fadeOut('slow');
        }, 1000); // 3 seconds
    }
}
</script>
</head>
<body>
    <div class="container mt-5">
        <h2>회원 탈퇴</h2>
        <p>정말로 탈퇴하시겠습니까?</p>
        <form action="withdraw" method="post" onsubmit="closeWindowAndHandleParent()">
            <div class="mb-3">
                <label for="password" class="form-label">비밀번호</label> <input
                    type="password" id="password" name="password" class="form-control"
                    required>
            </div>
            <button type="submit" class="btn btn-danger">탈퇴하기</button>
        </form>
    </div>

    <%-- 회원 탈퇴 성공 메시지 출력 
    <c:if test="${not empty success}">
        <div id="withdrawSuccess" class="alert alert-success mt-3" style="display: none;">${success}</div>
        <script>
            $(document).ready(function() {
                setTimeout(function() {
                    $('#withdrawSuccess').fadeIn('slow');
                    handleWithdrawal(true, "${success}");
                }, 1000); // 1 second
            });
        </script>
    </c:if>--%>

    <%-- 회원 탈퇴 실패 메시지 출력 
    <c:if test="${not empty error}">
        <div id="withdrawError" class="alert alert-danger mt-3" style="display: none;">${error}</div>
        <script>
            $(document).ready(function() {
                setTimeout(function() {
                    $('#withdrawError').fadeIn('slow');
                    handleWithdrawal(false, "${error}");
                }, 1000); // 1 second
            }); 
        </script>
    </c:if> --%>
</body>
</html>
