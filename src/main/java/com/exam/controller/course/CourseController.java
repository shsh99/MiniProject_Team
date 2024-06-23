package com.exam.controller.course;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.dto.course.CourseDTO;
import com.exam.dto.review.ReviewDTO;
import com.exam.dto.user.UserDTO;
import com.exam.service.course.CourseService;
import com.exam.service.review.ReviewService;

@Controller
public class CourseController {

	Logger logger = LoggerFactory.getLogger(getClass());

	CourseService courseService;
	
	ReviewService reviewService;

	// 생성자 주입
	public CourseController(CourseService courseService, ReviewService reviewService) {
		this.courseService = courseService;
		this.reviewService = reviewService;
	}

	// 강의 상세 페이지 이동
	@GetMapping("/courseRetrieve")
	public String courseRetrieve(@RequestParam int id, ModelMap m) {

		CourseDTO dto = courseService.courseRetrieve(id);
		m.addAttribute("courseRetrieve", dto);
		
		// 리뷰 목록 추가
        List<ReviewDTO> reviewdto = reviewService.reviewList(id);
        m.addAttribute("reviews", reviewdto);
		
		return "courseRetrieve";
	}

	// 관리자용 강의 관리 페이지
	@GetMapping("/adminCourseList")
	public String courseList(ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		// 관리자만 접근 가능
		UserDTO user = (UserDTO) auth.getPrincipal();
		if (user.getRole() != 1) {

			return "redirect:/home";
		}

		List<CourseDTO> courseList = new ArrayList<>();
		model.addAttribute("courseList", courseList);
		courseList.addAll(courseService.courseList("front"));
		courseList.addAll(courseService.courseList("back"));

		return "adminCourseList";
	}

	// 강의 추가 페이지 이동
	@GetMapping("/addCourse")
	public String addCourse() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		// 관리자만 접근 가능
		UserDTO user = (UserDTO) auth.getPrincipal();
		if (user.getRole() != 1) {

			return "redirect:/home";
		}

		return "addCourse";
	}

	// 강의 추가 처리
	@PostMapping("/addCourse")
	public String addCourse(@Valid CourseDTO courseDTO, BindingResult result, RedirectAttributes redirectAttributes) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		if (auth == null || !auth.isAuthenticated()) {
			// 인증되지 않은 사용자의 경우 로그인 페이지로 리다이렉트
			return "redirect:/login";
		}

		if (result.hasErrors()) {
			// 유효성 검사 오류가 있는 경우, 다시 입력 폼으로 이동
			redirectAttributes.addFlashAttribute("message", "입력한 정보에 오류가 있습니다. 다시 확인해 주세요.");
			redirectAttributes.addFlashAttribute("courseDTO", courseDTO); // 입력한 데이터를 다시 폼에 표시하기 위해 저장
			return "redirect:/addCourse";
		}

		int dbResult = courseService.addCourse(courseDTO);

		if (dbResult > 0) {
			redirectAttributes.addFlashAttribute("message", "강의가 성공적으로 추가되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("message", "강의 추가에 실패했습니다.");
		}

		return "redirect:/home";
	}

	// 강의 수정 페이지 이동
	@GetMapping("/updateCourse")
	public String editCourse(@RequestParam int id, ModelMap model) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		// 관리자만 접근 가능
		UserDTO user = (UserDTO) auth.getPrincipal();
		if (user.getRole() != 1) {

			return "redirect:/home";
		}

		CourseDTO course = courseService.courseRetrieve(id);
		model.addAttribute("course", course);
		return "updateCourse"; //
	}

	// 강의 수정 처리
	@PostMapping("/updateCourse")
	public String updateCourse(CourseDTO courseDTO, RedirectAttributes redirectAttributes) {
		int result = courseService.updateCourse(courseDTO);

		if (result > 0) {
			redirectAttributes.addFlashAttribute("message", "강의가 성공적으로 수정되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("message", "강의 수정에 실패했습니다.");
		}

		return "redirect:/adminCourseList"; // 수정 후에 메인 페이지로 리다이렉트
	}

	// 강의 삭제 처리
	@PostMapping("/deleteCourse")
	public String deleteCourse(CourseDTO courseDTO, BindingResult result, RedirectAttributes redirectAttributes) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		int dbResult = courseService.deleteCourse(courseDTO);

		if (dbResult > 0) {
			redirectAttributes.addFlashAttribute("message", "강의가 성공적으로 추가되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("message", "강의 추가에 실패했습니다.");
		}

		return "redirect:/adminCourseList";
	}

	// 강의 전체 삭제 처리
	@PostMapping("/deleteAllCourse")
	public String deleteAllCourse(CourseDTO courseDTO, BindingResult result, RedirectAttributes redirectAttributes) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		int dbResult = courseService.deleteAllCourse(courseDTO);

		if (dbResult > 0) {
			redirectAttributes.addFlashAttribute("message", "강의가 성공적으로 추가되었습니다.");
		} else {
			redirectAttributes.addFlashAttribute("message", "강의 추가에 실패했습니다.");
		}

		return "redirect:/home";
	}
}
