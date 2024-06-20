package com.exam.controller.user;

import java.time.LocalDate;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.exam.dto.user.UserDTO;
import com.exam.service.user.UserService;

@Controller
public class UserController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	
	@GetMapping("/idCheck")
	public @ResponseBody String idCheck(@RequestParam String login_id) {
		UserDTO user = userService.idCheck(login_id);
		String message = user == null ? "사용 가능한 ID입니다." : "이미 사용 중인 ID입니다.";
		return message;
	}

	@GetMapping("/signup")
	public String signupForm(ModelMap model) {
		if (!model.containsAttribute("user")) {
			
		
      
			model.addAttribute("user", new UserDTO());

			
		}
		return "signupForm"; // 회원 가입 폼 템플릿 이름에 맞게 수정 필요
	}

	@PostMapping(value = { "/signup" })
	public String showSignUpSuccessPage(@Valid UserDTO user, BindingResult result) {
		logger.debug("logger:{}", user);

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
	    public String mypage(ModelMap model) {
	        // Spring Security를 이용하여 인증된 사용자 정보 가져오기
	        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	        
	        // Principal로부터 사용자 정보 가져오기 (여기서는 UserDTO 클래스를 예시로 사용)
	        // Principal 객체는 UserDetails 인터페이스를 구현한 객체임을 전제로 합니다.
	        UserDTO user = (UserDTO) auth.getPrincipal();
	        
	        // 모델에 사용자 정보 추가
	        model.addAttribute("user", user);

	        // 마이페이지 템플릿 이름에 맞게 수정 필요 (여기서는 "mypage"로 가정)
	        return "mypage";
	    }

}
