<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Course List</title>
<style>
.course-card {
    border: 1px solid #343a40; /* 테두리 스타일 */
    margin: 10px; /* 요소 사이의 간격 */
    width: calc(33.33% - 20px); /* 각 요소의 너비 계산 (여백 포함) */
    box-sizing: border-box; /* 테두리를 포함한 크기 계산 */
    padding: 10px; /* 내부 여백 */
    float: left; /* 왼쪽으로 정렬 */
    text-align: left; /* 텍스트 왼쪽 정렬 */
}

.clear {
    clear: both; /* float 해제 */
}
.course-card img {
    display: block; /* 이미지의 하단 여백 제거 */
    margin: 0 auto; /* 이미지를 중앙 정렬 */
}
</style>
<link href="webjars/bootstrap/5.1.3/css/bootstrap.min.css"
    rel="stylesheet">
</head>
<body>
    <h1>강의 수정</h1>
    <form action="updateCourse" method="post">
        <input type="hidden" name="id" value="${course.id}">
        <div>
            <label for="title">강의 제목:</label>
            <input type="text" id="title" name="title" value="${course.title}" required>
        </div>
        <div>
            <label for="name">강사 이름:</label>
            <input type="text" id="name" name="name" value="${course.name}" required>
        </div>
        <div>
            <label for="period">강의 기간 (일):</label>
            <input type="number" id="period" name="period" value="${course.period}" required>
        </div>
        <div>
            <label for="price">가격:</label>
            <input type="number" id="price" name="price" value="${course.price}" required>
        </div>
        <div>
            <label for="introduction">강의 소개:</label>
            <textarea id="introduction" name="introduction" required>${course.introduction}</textarea>
        </div>
        <div>
            <label for="link">강의 링크:</label>
            <input type="text" id="link" name="link" value="${course.link}" required>
        </div>
        <div>
            <label for="image">강의 이미지 링크:</label>
            <input type="text" id="image" name="image" value="${course.image}" required>
        </div>
        <div>
            <label for="sale">세일 퍼센트:</label>
            <input type="number" id="sale" name="sale" value="${course.sale}" required>
        </div>
        <div>
            <label for="session">강의 시간:</label>
            <input type="number" id="session" name="session" value="${course.session}" required>
        </div>
        <div>
        <label for="category">카테고리:</label>
<select id="category" name="category" required>
    <c:choose>
        <c:when test="${course.category eq 'front'}">
            <option value="front" selected>front</option>
            <option value="back">back</option>
        </c:when>
        <c:when test="${course.category eq 'back'}">
            <option value="front">front</option>
            <option value="back" selected>back</option>
        </c:when>
        <c:otherwise>
            <option value="front">front</option>
            <option value="back">back</option>
        </c:otherwise>
    </c:choose>
</select>
        
        </div>
        <div>
            <button type="submit">강의 수정</button>
        </div>
    </form>
</body>
</html>
