<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
  <script src="webjars/bootstrap/5.1.3/js/bootstrap.min.js"></script>
  <script src="webjars/jquery/3.6.0/jquery.min.js"></script>
  <script>
  
  	  $(document).ready(function(){
  		  
  		  $("#login_id").on("keyup",function(){
  			 
  			  	$.ajax({
  			  	   url:'login_id-check',
  			  	   method:'get',
  			  	   dataType:"text",
  			  	   data:{
  			  		   "login_id":$(this).val()
  			  	   },
  			  	   success:function(res, status ,xhr){
  			  		   $("#result").text(res);
  			  	   },
  			  	   error:function(){}
  			  	});
  			  
  		  });
  		  
  	  });
  
  </script>
 
  <div class="TodoApp">
    <div class="container">
            <div class="Login">
            <h1>회원가입화면</h1>
            <div class="signUpForm">
              <form:form  method="post" modelAttribute="user" 
              action="signup">
                <div>
                    <label for="login_id">아이디 : </label>
                    <form:input type="text" path="login_id" />
                    <form:errors path="login_id" cssClass="text-warning"/>
                </div>
                <div>
                    <label for="password">비밀번호 : </label>
                    <form:input type="password" path="password" value="1234" />
  					 <form:errors path="password" cssClass="text-warning"/>
                </div>
                 <div>
                    <label for="name">이름 : </label>
                    <form:input type="text" path="name" />
                    <form:errors path="name" cssClass="text-warning"/>
                </div>
                <div>
                    <button name="login" class="btn btn-success m-5" >signup</button>
                </div>
               </form:form> 
            </div>
        </div>
        </div>
    </div>
