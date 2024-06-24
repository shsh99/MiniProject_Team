<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date,
    java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>리뷰 작성</title>
<!-- Bootstrap CSS -->
<link
   href="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/css/bootstrap.min.css"
   rel="stylesheet">
<!-- Bootstrap Icons CSS -->
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.0/font/bootstrap-icons.min.css"
   rel="stylesheet">
<style>
.container {
   width: 80%;
   margin: 0 auto;
   padding: 20px;
   border: 1px solid #dee2e6;
   border-radius: 50px;
   box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.rating-stars {
   font-size: 24px;
   cursor: pointer;
   color: #ffc107; /* 초기 색상을 지정합니다. */
}

.rating-stars.checked {
   color: #ffc107; /* 선택된 별의 색상을 지정합니다. */
}

.rating-container {
   display: flex;
   justify-content: center;
}

.btn.btn {
   background-color: #819FF7;
   color: #fff;
}
</style>
</head>
<body>
   <div class="container mt-5">
      <div class="mb-4 text-center">
         <img src="images/ssg/review.png" alt="로고"
            style="height: 100px; width: 300px;">
      </div>

      <form id="reviewForm" method="post" action="reviewAdd">
         <input type="hidden" name="cs_id" value="${param.cs_id}">

         <div class="mb-3">
            <label for="re_title" class="form-label">리뷰 제목</label> <input
               type="text" class="form-control" id="re_title" name="re_title"
               required>
         </div>

         <div class="mb-3">
            <label for="content" class="form-label">리뷰 내용</label>
            <textarea class="form-control" id="content" name="content" rows="5"
               required></textarea>
         </div>

         <%
         SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
         String currentDate = dateFormat.format(new Date());
         %>
         <input type="hidden" name="date" value="<%=currentDate%>">


         <div class="form-group mb-3">
            <label for="rating">평점</label> <select class="form-control"
               id="rating" name="rating" required>
               <option value="">평점을 선택하세요</option>
               <option value="1">1</option>
               <option value="2">2</option>
               <option value="3">3</option>
               <option value="4">4</option>
               <option value="5">5</option>
            </select>
         </div>
         <button type="submit" class="btn btn">제출</button>
      </form>
   </div>

   <!-- Bootstrap Bundle with Popper -->
   <script
      src="https://stackpath.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.bundle.min.js"></script>
   <!-- jQuery -->
   <script
      src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script>
      $(document).ready(
            function() {
               var ratingValue = 0;

               $('.rating-stars').mouseover(
                     function() {
                        var value = $(this).data('value');
                        $('.rating-stars').removeClass('checked');
                        $(this).prevAll('.rating-stars').addBack()
                              .addClass('checked');
                     });

               $('.rating-stars').mouseleave(
                     function() {
                        $('.rating-stars').removeClass('checked');
                        $(
                              '.rating-stars[data-value="'
                                    + ratingValue + '"]').prevAll(
                              '.rating-stars').addBack().addClass(
                              'checked');
                     });

               $('.rating-stars').click(
                     function() {
                        ratingValue = $(this).data('value');
                        $('#rating').val(ratingValue);
                        $('.rating-stars').removeClass('checked');
                        $(this).prevAll('.rating-stars').addBack()
                              .addClass('checked');
                     });
            });
   </script>
</body>
</html>
