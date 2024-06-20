<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


<div class="container">
    <form class="row g-3 m-4" action="auth" method="post">
        <div class="row mb-3">
            <div>${errorMessage }</div>
            <label for="login_id" class="col-sm-2 col-form-label">아이디</label>
            <div class="col-auto">
                <input type="text" class="form-control" id="login_id" name="login_id">
            </div>
        </div>
        <div class="row mb-3">
            <label for="password" class="col-sm-2 col-form-label">비밀번호</label>
            <div class="col-auto">
                <input type="password" class="form-control" name="password" id="password">
            </div>
        </div>
        <div class="col-12">
            <button type="submit" class="btn btn-primary">로그인</button>
            <button type="reset" class="btn btn-secondary">취소</button>
        </div>
    </form>
</div>
