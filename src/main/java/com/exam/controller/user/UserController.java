package com.exam.controller.user;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.dto.user.UserDTO;
import com.exam.service.user.UserService;

@Controller
public class UserController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	UserService userService;

	PasswordEncoder passwordEncoder;

	public UserController(UserService userService, PasswordEncoder passwordEncoder) {
		this.userService = userService;
		this.passwordEncoder = passwordEncoder;
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

	@PostMapping("/updateUser")
	public String updateUser(@ModelAttribute("user") UserDTO user, RedirectAttributes redirectAttributes) {
		try {
			// Spring Security를 이용하여 인증된 사용자 정보 가져오기
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			UserDTO userDTO = (UserDTO) auth.getPrincipal();

			// 현재 사용자의 정보 업데이트
			userDTO.setPost(user.getPost());
			userDTO.setAddress1(user.getAddress1());
			userDTO.setAddress2(user.getAddress2());
			userDTO.setPhone(user.getPhone());
			userDTO.setEmail(user.getEmail());

			// UserService를 사용하여 사용자 정보 업데이트
			userService.update(userDTO);

			// 성공 메시지 설정
			redirectAttributes.addFlashAttribute("success", "사용자 정보가 성공적으로 업데이트되었습니다.");
		} catch (Exception e) {
			// 오류 메시지 설정
			redirectAttributes.addFlashAttribute("error", "사용자 정보 업데이트 중 오류가 발생했습니다.");
		}
		return "redirect:/mypage";
	}

	@GetMapping(value = { "/changePassword" })
	public String changePasswordPage() {
		return "changePassword"; // 비밀번호 변경 폼을 보여주는 뷰 이름 반환
	}

	@PostMapping(value = { "/changePasswordProcess" })
	public String changePassword(@RequestParam("currentPassword") String currentPassword,
			@RequestParam("newPassword") String newPassword, @RequestParam("confirmPassword") String confirmPassword,
			RedirectAttributes redirectAttributes) {

		// 현재 인증된 사용자 정보 가져오기
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		UserDTO user = (UserDTO) auth.getPrincipal();

		// 입력된 현재 비밀번호가 사용자의 저장된 비밀번호와 일치하는지 확인
		if (!passwordEncoder.matches(currentPassword, user.getPassword())) {
			redirectAttributes.addFlashAttribute("error", "현재 비밀번호가 일치하지 않습니다.");
			return "redirect:changePassword";
		}

		// 새로운 비밀번호와 확인 비밀번호가 일치하는지 확인
		if (!newPassword.equals(confirmPassword)) {
			redirectAttributes.addFlashAttribute("error", "새로운 비밀번호가 일치하지 않습니다.");
			return "redirect:changePassword";
		}

		// 새로운 비밀번호를 암호화하여 설정
		String encodedPassword = passwordEncoder.encode(newPassword);

		// 사용자의 비밀번호 업데이트
		user.setPassword(encodedPassword);

		// UserService를 호출하여 사용자 정보 업데이트 (가상의 코드)
		userService.update(user);

		// 비밀번호 변경 성공 후 리다이렉트
		redirectAttributes.addFlashAttribute("success", "비밀번호가 성공적으로 변경되었습니다.");
		return "redirect:changePassword"; // 사용자의 프로필 또는 대시보드 페이지로 리다이렉트
	}

	// 회원 탈퇴 페이지(GET)
	@GetMapping("/withdraw")
	public String withdrawPage() {
		return "withdraw";
	}

	// 회원 탈퇴(POST) - 비밀번호 체크 후 탈퇴
	@PostMapping("/withdraw")
	public String withdrawUser(@RequestParam("password") String password, RedirectAttributes redirectAttributes) {
		try {
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			UserDTO currentUser = (UserDTO) auth.getPrincipal();

			// 비밀번호 체크
			if (!passwordEncoder.matches(password, currentUser.getPassword())) {
				redirectAttributes.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
				return "redirect:/withdraw";
			}

			userService.delete(currentUser.getId()); // userService에서 사용자 삭제 메서드 호출

			// 로그아웃 처리: 세션 무효화
			SecurityContextHolder.clearContext(); // 현재 사용자의 SecurityContext를 클리어하여 로그아웃 처리

			redirectAttributes.addFlashAttribute("success", "회원 탈퇴가 완료되었습니다.");
			return "redirect:/withdraw";
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "회원 탈퇴 중 오류가 발생했습니다.");
			return "redirect:/withdraw";
		}
	}
}