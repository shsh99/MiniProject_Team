<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.Date,
    java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 작성</title>
<link rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="mb-4">리뷰 작성</h1>

        <form id="reviewForm" method="post" action="reviewAdd">
            <input type="hidden" name="cs_id" value="${param.cs_id}">
            
            <div class="form-group">
                <label for="re_title">리뷰 제목</label>
                <input type="text" class="form-control" id="re_title" name="re_title" required>
            </div>

            <div class="form-group">
                <label for="content">리뷰 내용</label>
                <textarea class="form-control" id="content" name="content" rows="5" required></textarea>
            </div>
            
             <% 
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                String currentDate = dateFormat.format(new Date());
            %>
            <input type="hidden" name="date" value="<%= currentDate %>">

            <div class="form-group">
                <label for="rating">평점</label>
                <select class="form-control" id="rating" name="rating" required>
                    <option value="">평점을 선택하세요</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                </select>
            </div>


            <button type="submit" class="btn btn-primary">제출</button>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>
