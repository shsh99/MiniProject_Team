<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>사용자 삭제</title>
<style>
body {
   font-family: Arial, sans-serif;
   background-color: #f0f0f0;
   padding: 20px;
}

h2 {
   color: #333;
}

form {
   max-width: 400px;
   background-color: #fff;
   padding: 20px;
   border-radius: 5px;
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   margin: 0 auto;
}

label {
   font-weight: bold;
}

input[type="text"], input[type="password"] {
   width: 100%;
   padding: 10px;
   margin-bottom: 10px;
   border: 1px solid #ccc;
   border-radius: 4px;
   box-sizing: border-box;
}

input[type="submit"] {
   background-color: #4CAF50;
   color: white;
   padding: 12px 20px;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   font-size: 16px;
}

input[type="submit"]:hover {
   background-color: #45a049;
}

.message {
   margin-top: 10px;
   padding: 10px;
   border-radius: 4px;
   display: none; /* 초기에는 숨김 */
}

.message.success {
   background-color: #dff0d8;
   border: 1px solid #d0e9c6;
   color: #3c763d;
}

.message.error {
   background-color: #f2dede;
   border: 1px solid #ebccd1;
   color: #a94442;
}
</style>
<script type="text/javascript">
   // URL에서 success 또는 error 메시지를 가져와서 메시지를 표시하는 함수
   function showMessage() {
      var urlParams = new URLSearchParams(window.location.search);
      var successMsg = urlParams.get('success');
      var errorMsg = urlParams.get('error');

      if (successMsg) {
         var successDiv = document.getElementById('successMessage');
         successDiv.innerHTML = successMsg;
         successDiv.style.display = 'block';
         // 2초 후 리다이렉트
         setTimeout(
               function() {
                  window.location.href = "${pageContext.request.contextPath}/adminUserList";
               }, 2000);
      }

      if (errorMsg) {
         var errorDiv = document.getElementById('errorMessage');
         errorDiv.innerHTML = errorMsg;
         errorDiv.style.display = 'block';
      }
   }

   // 페이지 로드될 때 showMessage 함수 실행
   window.onload = function() {
      showMessage();
   };

   // 비밀번호 입력 시 에러 메시지 숨김
   function clearErrorMessage() {
      document.getElementById('errorMessage').style.display = 'none';
   }
</script>
</head>
<body>
   <h2>사용자 삭제</h2>

   <!-- 오류 및 성공 메시지 표시 -->
   <div id="successMessage" class="message success">${success}</div>
   <div id="errorMessage" class="message error">${error}</div>

   <!-- 삭제 폼 -->
   <form id="deleteForm"
      action="${pageContext.request.contextPath}/adminDeleteUser"
      method="post" onsubmit="return clearErrorMessage();">
      <label for="login_id">사용자 ID:</label> <input type="text" id="login_id"
         name="login_id" value="${user.login_id}" readonly="readonly"><br>
      <br> <input type="hidden" id="id" name="id" value="${user.id}">
      <label for="adminPassword">관리자 비밀번호:</label> <input type="password"
         id="adminPassword" name="adminPassword" required><br>
      <br> <input type="submit" value="사용자 삭제">
   </form>
</body>
</html>
