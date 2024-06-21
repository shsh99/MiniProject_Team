<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<link rel="stylesheet"
    href="webjars/bootstrap/5.1.3/css/bootstrap.min.css">
<script src="webjars/jquery/3.6.0/jquery.min.js"></script>
<script>
    // Function to validate password fields
    function validatePassword() {
        var newPassword = document.getElementById("newPassword").value;
        var confirmPassword = document.getElementById("confirmPassword").value;

        if (newPassword !== confirmPassword) {
            $('#passwordMatchError').text("새로운 비밀번호와 확인 비밀번호가 일치하지 않습니다.");
            $('#passwordMatchError').show();
            return false;
        }

        return true;
    }

    // Function to close the popup window
    function closePopup() {
        window.close();
    }

    // Function to close the popup window and handle parent window
    function closePopupAndHandleParent(success, message) {
        if (window.opener && !window.opener.closed) {
            window.opener.handlePasswordChange(success, message);
        }
        window.close();
    }
</script>
</head>
<body>
    <div class="container mt-5">
        <div class="d-flex flex-column-reverse">
            <form action="changePasswordProcess" method="post" class="row g-3" onsubmit="return validatePassword()">
                <div class="mb-3 col-md-6">
                    <label for="currentPassword" class="form-label">현재 비밀번호</label>
                    <input type="password" class="form-control" id="currentPassword" name="currentPassword" required>
                </div>
                <div class="mb-3 col-md-6">
                    <label for="newPassword" class="form-label">새로운 비밀번호</label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword" required>
                </div>
                <div class="mb-3 col-md-6">
                    <label for="confirmPassword" class="form-label">새로운 비밀번호 확인</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" required>
                    <div id="passwordMatchError" class="text-danger" style="display: none;"></div>
                </div>
                <div class="col-12">
                    <button type="submit" class="btn btn-primary">비밀번호 변경</button>
                    <a href="javascript:closePopup()" class="btn btn-secondary">취소</a>
                </div>
            </form>

            <%-- 비밀번호 변경 성공 메시지 출력 --%>
            <c:if test="${not empty success}">
                <div class="alert alert-success mt-3">${success}</div>
                <script>
                    setTimeout(function() {
                        closePopupAndHandleParent(true, "${success}");
                    }, 1000); // 1초 후 자동으로 메시지 표시
                </script>
            </c:if>

            <%-- 비밀번호 변경 실패 메시지 출력 --%>
            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3">${error}</div>
                <script>
                    setTimeout(function() {
                        closePopupAndHandleParent(false, "${error}");
                    }, 1000); // 1초 후 자동으로 메시지 표시
                </script>
            </c:if>
        </div>
    </div>
</body>
</html>
