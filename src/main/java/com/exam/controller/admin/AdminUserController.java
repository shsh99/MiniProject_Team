package com.exam.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.dto.user.UserDTO;
import com.exam.service.user.UserService;

@Controller
public class AdminUserController {

	private Logger logger = LoggerFactory.getLogger(getClass());

	private final UserService userService;
	private final PasswordEncoder passwordEncoder;

	private boolean isAdminUser(UserDTO user) {
	    // 역할 ID가 1인 경우를 관리자로 간주
	    return user.getRole() == 1;
	}
	
	public AdminUserController(UserService userService, PasswordEncoder passwordEncoder) {
		this.userService = userService;
		this.passwordEncoder = passwordEncoder;
	}

	// 모든 사용자 목록을 조회하여 뷰에 전달하는 메서드
	@GetMapping("/adminUserList")
	public String adminUserList(ModelMap model) {
		List<UserDTO> users = userService.selectAllUsers();
		model.addAttribute("users", users);
		return "adminUserList";
	}

	// 사용자 업데이트 폼 페이지
	@GetMapping("/adminUserUpdate")
	public String adminUserUpdateForm(@RequestParam("id") int id, ModelMap model) {
		UserDTO user = userService.findById(id);
		model.addAttribute("user", user);
		return "adminUserUpdate";
	}

	// 사용자 정보 업데이트 처리
	@PostMapping("/adminUserUpdate")
	public String adminUserUpdate(@ModelAttribute("user") UserDTO updatedUser,
	                              @RequestParam(value = "resetPassword", required = false) String resetPassword,
	                              ModelMap model) {
	    try {
	        UserDTO existingUser = userService.findById(updatedUser.getId());

	        // 관리자인지 여부를 확인하여 권한 수정을 막습니다.
	        if (isAdminUser(existingUser)) {
	            model.addAttribute("error", "관리자는 권한을 변경할 수 없습니다.");
	            return "adminUserUpdate";
	        }

	        existingUser.setPost(updatedUser.getPost());
	        existingUser.setAddress1(updatedUser.getAddress1());
	        existingUser.setAddress2(updatedUser.getAddress2());
	        existingUser.setPhone(updatedUser.getPhone());
	        existingUser.setEmail(updatedUser.getEmail());

	        if (resetPassword != null && resetPassword.equals("true")) {
	            String rawPassword = "0000";
	            String encodedPassword = passwordEncoder.encode(rawPassword);
	            existingUser.setPassword(encodedPassword);
	        }

	        userService.update(existingUser);
	        model.addAttribute("success", "사용자 정보가 성공적으로 업데이트되었습니다.");
	    } catch (Exception e) {
	        model.addAttribute("error", "사용자 정보 업데이트 중 오류가 발생했습니다.");
	    }
	    return "adminUserUpdate";
	}
	// 사용자 삭제 페이지(GET)
	@GetMapping("/adminDeleteUser")
	public String adminDeleteUser(@RequestParam("id") int userId, ModelMap model) {
		// 사용자 ID를 기반으로 사용자 정보를 가져옴
		UserDTO user = userService.findById(userId);

		// 사용자 정보를 모델에 추가
		model.addAttribute("user", user);

		return "adminDeleteUser";
	}

	// 사용자 정보를 삭제하는 메서드
	@PostMapping("/adminDeleteUser")
	public String adminUserDelete(@RequestParam("id") int id, @RequestParam("adminPassword") String adminPassword,
			RedirectAttributes redirectAttributes) {
		try {
			// 현재 인증된 관리자 정보 가져오기
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
			UserDTO admin = (UserDTO) auth.getPrincipal();

			// 관리자 비밀번호 확인
			if (!passwordEncoder.matches(adminPassword, admin.getPassword())) {
				redirectAttributes.addFlashAttribute("error", "관리자 비밀번호가 일치하지 않습니다.");
				return "redirect:/adminDeleteUser?id=" + id; // 비밀번호가 일치하지 않을 경우 관리자 목록 페이지로 리다이렉트
			}

			// 사용자 삭제
			userService.delete(id);

			redirectAttributes.addFlashAttribute("success", "사용자가 성공적으로 삭제되었습니다.");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("error", "사용자 삭제 중 오류가 발생했습니다.");
			return "redirect:/adminDeleteUser?id=" + id;
		}
		return "redirect:/adminUserList"; // 삭제 후 사용자 목록 페이지로 리다이렉트
	}

}
