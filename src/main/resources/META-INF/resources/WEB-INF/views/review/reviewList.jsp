<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Review List</title>
</head>
<body>
<div class="TodoApp">
    <div class="container">
        <h2>리뷰 목록</h2>
        <table class="table">
            <thead>
            <tr>
                <th>Review ID</th>
                <th>User Name</th>
                <th>Course Title</th>
                <th>Review Text</th>
                <th>Review Date</th>
                <th>Rating</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${reviews}" var="review">
                <tr>
                    <td>${review.reviewId}</td>
                    <td>${review.userName}</td>
                    <td>${review.courseTitle}</td>
                    <td>${review.reviewText}</td>
                    <td>${review.reviewDate}</td>
                    <td>${review.rating}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
