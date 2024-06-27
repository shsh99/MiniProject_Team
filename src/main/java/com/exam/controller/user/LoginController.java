package com.exam.controller.user;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@SessionAttributes("login") // 세션에 "login" 속성을 유지하도록 지정
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);


	public LoginController( ) {

	}

	// 로그인 페이지(GET)
	@GetMapping("/login")
	public String showLoginPage() {
		return "loginForm"; // 로그인 폼을 보여주는 뷰 이름 반환
	}

	// 로그인 실패 시 처리(POST)
	@PostMapping("/login_fail")
	public String showLoginFailPage() {
		logger.info("Login failed"); // 로그인 실패 로그 기록
		return "redirect:/login"; // 로그인 페이지로 리다이렉트
	}

	// 로그인 성공 시 처리(GET)
	@GetMapping("/login_success")
	public String showLoginSuccessPage() {
		logger.info("Login successful"); // 로그인 성공 로그 기록
		return "redirect:/home"; // 홈 페이지로 리다이렉트
	}
}
