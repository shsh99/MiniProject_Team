package com.exam.controller.user;

import java.util.Map;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.exam.dto.user.UserDTO;
import com.exam.service.user.UserService;

@Controller
@SessionAttributes("login")
public class LoginController {

	Logger logger = LoggerFactory.getLogger(getClass());

	UserService userService;

	public LoginController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping(value={"/login"})
	public String showLoginPage() {
		return "loginForm";
	}
	
	@PostMapping(value={"/login_fail"})
	public String showlogin_failPage() {
		logger.info("logger:showlogin_failPage");
		return "redirect:login";
	}
	
	@GetMapping(value={"/login_success"})
	public String showlogin_successPage() {
		logger.info("logger:showlogin_successPage");
		return "redirect:home";
	}
}
