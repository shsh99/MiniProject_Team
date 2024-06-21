<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="TodoApp">
    <div class="container">
    ${cartList }
    <form>
        <div>
            <table class="table">
                <thead>
                    <tr>
                        <th>전체삭제
                            &nbsp;
                            <input type="checkbox" name="allCheck" id="allCheck"></th>
                        <th>유저번호</th>
                        <th>강의번호</th>
                        <th>제목</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="sum" value="0"/>
                    <c:forEach var="dto" items="${cartList}" varStatus="status">
                        <tr>
                            <td><input type="checkbox" name="check" class="check"></td> 
                            <td>${dto.us_id}</td> 
                            <td>${dto.cs_id}</td> 
                            <td>${dto.courseList[0].title}</td> 
                            <td><a href="#" class="btn btn-warning">Delete</a></td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td></td>
                        <td colspan="3">총합: &nbsp; ${sum}</td>
                    </tr>
                </tbody>
            </table>
        </div>
        <div class="btn btn-success m-5">전체삭제</div>
    </div>
    </form>
</div>

