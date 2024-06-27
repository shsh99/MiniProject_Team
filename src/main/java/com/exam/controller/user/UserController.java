package com.exam.controller.user;

import com.exam.dto.user.UserDTO;
import com.exam.service.user.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	private final UserService userService;
	private final PasswordEncoder passwordEncoder;


	public UserController(UserService userService, PasswordEncoder passwordEncoder) {
		this.userService = userService;
		this.passwordEncoder = passwordEncoder;
	}

	// ID 중복 체크
	@GetMapping("/idCheck")
	@ResponseBody
	public String idCheck(@RequestParam String login_id) {
		UserDTO user = userService.idCheck(login_id);
		return user == null ? "사용 가능한 ID입니다." : "이미 사용 중인 ID입니다.";
	}

	// 회원 가입 페이지(GET)
	@GetMapping("/signup")
	public String signupForm(ModelMap model) {
		if (!model.containsAttribute("user")) {
			model.addAttribute("user", new UserDTO());
		}
		return "signupForm";
	}

	// 회원 가입 처리(POST)
	@PostMapping("/signup")
	public String showSignUpSuccessPage(@Valid UserDTO user, BindingResult result) {
		if (result.hasErrors()) {
			return "signupForm"; // 입력 유효성 검사 에러 시 다시 회원 가입 폼으로 이동
		}

		// 비밀번호 암호화
		user.setPassword(encodePassword(user.getPassword()));

		// 회원 정보 저장
		userService.save(user);

		return "redirect:loginForm"; // 회원 가입 성공 시 로그인 페이지로 리다이렉트
	}

	// 마이페이지(GET)
	@GetMapping("/mypage")
	public String mypage(ModelMap model) {
		// 인증된 사용자 정보 가져오기
		UserDTO user = getAuthenticatedUser();
		model.addAttribute("user", user);
		return "mypage"; // 마이페이지 템플릿으로 이동
	}

	// 회원 정보 업데이트(POST)
	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") UserDTO user, RedirectAttributes redirectAttributes) {
		try {
			// 인증된 사용자 정보 가져오기
			UserDTO currentUser = getAuthenticatedUser();

			// 입력된 정보로 현재 사용자 정보 업데이트
			currentUser.setPost(user.getPost());
			currentUser.setAddress1(user.getAddress1());
			currentUser.setAddress2(user.getAddress2());
			currentUser.setPhone(user.getPhone());
			currentUser.setEmail(user.getEmail());

			// 사용자 정보 업데이트
			userService.update(currentUser);

			// 성공 메시지 설정
			redirectAttributes.addFlashAttribute("success", "사용자 정보가 성공적으로 업데이트되었습니다.");
		} catch (Exception e) {
			// 오류 메시지 설정
			return handleException(redirectAttributes, "사용자 정보 업데이트 중 오류가 발생했습니다.");
		}
		return "redirect:/user/mypage"; // 마이페이지로 리다이렉트
	}

	// 비밀번호 변경 페이지(GET)
	@GetMapping("/changePassword")
	public String changePasswordPage() {
		return "changePassword"; // 비밀번호 변경 폼을 보여주는 뷰 이름 반환
	}

	// 비밀번호 변경 처리(POST)
	@PostMapping("/changePasswordProcess")
	public String changePassword(@RequestParam("currentPassword") String currentPassword,
								 @RequestParam("newPassword") String newPassword,
								 @RequestParam("confirmPassword") String confirmPassword,
								 RedirectAttributes redirectAttributes) {
		try {
			// 인증된 사용자 정보 가져오기
			UserDTO user = getAuthenticatedUser();

			// 입력된 현재 비밀번호가 사용자의 저장된 비밀번호와 일치하는지 확인
			if (!passwordEncoder.matches(currentPassword, user.getPassword())) {
				return handleException(redirectAttributes, "현재 비밀번호가 일치하지 않습니다.");
			}

			// 새로운 비밀번호와 확인 비밀번호가 일치하는지 확인
			if (!newPassword.equals(confirmPassword)) {
				return handleException(redirectAttributes, "새로운 비밀번호가 일치하지 않습니다.");
			}

			// 새로운 비밀번호를 암호화하여 설정
			user.setPassword(encodePassword(newPassword));

			// 사용자의 비밀번호 업데이트
			userService.update(user);

			// 비밀번호 변경 성공 후 리다이렉트
			redirectAttributes.addFlashAttribute("success", "비밀번호가 성공적으로 변경되었습니다.");
		} catch (Exception e) {
			// 오류 메시지 설정
			return handleException(redirectAttributes, "비밀번호 변경 중 오류가 발생했습니다.");
		}
		return "redirect:/user/changePassword"; // 비밀번호 변경 페이지로 리다이렉트
	}

	// 회원 탈퇴 페이지(GET)
	@GetMapping("/withdraw")
	public String withdrawPage() {
		return "withdraw"; // 회원 탈퇴 폼을 보여주는 뷰 이름 반환
	}

	// 회원 탈퇴 처리(POST)
	@PostMapping("/withdraw")
	public String withdrawUser(@RequestParam("password") String password, RedirectAttributes redirectAttributes) {
		try {
			// 인증된 사용자 정보 가져오기
			UserDTO currentUser = getAuthenticatedUser();

			// 입력된 비밀번호가 사용자의 저장된 비밀번호와 일치하는지 확인
			if (!passwordEncoder.matches(password, currentUser.getPassword())) {
				return handleException(redirectAttributes, "비밀번호가 일치하지 않습니다.");
			}

			// 사용자 삭제
			userService.delete(currentUser.getId());

			// 로그아웃 처리: 세션 무효화
			SecurityContextHolder.clearContext(); // 현재 사용자의 SecurityContext를 클리어하여 로그아웃 처리

			// 성공 메시지 설정
			redirectAttributes.addFlashAttribute("success", "회원 탈퇴가 완료되었습니다.");
		} catch (Exception e) {
			// 오류 메시지 설정
			return handleException(redirectAttributes, "회원 탈퇴 중 오류가 발생했습니다.");
		}
		return "redirect:/"; // 홈 페이지로 리다이렉트
	}

	// 비밀번호 암호화 메서드
	private String encodePassword(String password) {
		return passwordEncoder.encode(password);
	}

	// 인증된 사용자 정보 가져오는 메서드
	private UserDTO getAuthenticatedUser() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		return (UserDTO) auth.getPrincipal();
	}

	// 예외 처리 메서드
	private String handleException(RedirectAttributes redirectAttributes, String error) {
		redirectAttributes.addFlashAttribute("error", error);
		return "redirect:/";
	}
}
