package com.exam.controller.user;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.exam.dto.user.UserDTO;
import com.exam.service.user.UserService;

@Controller
public class UserController {

	Logger logger = LoggerFactory.getLogger(getClass());

	UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping(value = { "/signup" })
	public String signupPage(ModelMap model) {
		model.put("user", new UserDTO());
		return "signupForm";
	}

	@PostMapping(value = { "/signup" })
	public String signupUser(@Valid @ModelAttribute("user") UserDTO user, BindingResult result) {

		if (result.hasErrors()) {
			return "signupForm";
		}

		// 서비스 연동
		// 비번 암호화 필수
		String encptPw = new BCryptPasswordEncoder().encode(user.getPassword());
		user.setPassword(encptPw);

		int n = userService.save(user);

		return "redirect:home";
	}

	@GetMapping(value = { "/mypage" })
	public String mypage() {

		// AuthProvider에 저장된 Authentication 얻기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		logger.info("logger:Authentication:{}", auth);
		UserDTO user = (UserDTO) auth.getPrincipal();
		logger.info("logger:user:{}", user);

		return "redirect:home";
	}
}
