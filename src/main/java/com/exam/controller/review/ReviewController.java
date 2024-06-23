package com.exam.controller.review;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.controller.cart.CartController;
import com.exam.dto.cart.CartDTO;
import com.exam.dto.course.CourseDTO;
import com.exam.dto.review.ReviewDTO;
import com.exam.dto.user.UserDTO;
import com.exam.service.application_list.Application_listService;
import com.exam.service.cart.CartService;
import com.exam.service.review.ReviewService;

@Controller
public class ReviewController {
	
    Logger logger = LoggerFactory.getLogger(CartController.class);


    ReviewService reviewService;
    Application_listService application_listService;

    public ReviewController(ReviewService reviewService, Application_listService application_listService) {
		this.reviewService = reviewService;
		this.application_listService = application_listService;
	}

	// 리뷰 추가 기능
    @PostMapping("/reviewAdd")
    public String cartAdd(@Valid ReviewDTO reviewDTO, @RequestParam("cs_id") int cs_id, RedirectAttributes redirectAttributes) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        UserDTO user = (UserDTO) auth.getPrincipal();
        logger.debug("Logged in user: {}", user);
        
        // 수강신청했는지 확인
        if (!application_listService.isDuplicateItem(user.getId(), cs_id)) {
            redirectAttributes.addFlashAttribute("message", "이미 수강신청하셨습니다");
            return "redirect:/applicationAddFail2";
        }
        
     // 중복 상품 체크
        if (reviewService.isDuplicateItem(user.getId(), cs_id)) {
            redirectAttributes.addFlashAttribute("message", "이미 리뷰를 작성하셨습니다.");
            return "redirect:/reviewAddFail";
        }

        reviewDTO.setUs_id(user.getId());
        reviewDTO.setCs_id(cs_id);

        int n = reviewService.reviewAdd(reviewDTO);

     // 리다이렉트 시 메시지 전달
        if (n > 0) {
            return "redirect:/reviewAddSuccess";
        } else {
            redirectAttributes.addFlashAttribute("message", "리뷰 작성에 실패했습니다.");
            return "redirect:/home";
        }
    }
    
 // 장바구니 추가 성공 페이지 이동
    @GetMapping("/reviewAddSuccess")
    public String reviewAddSuccess() {
        return "reviewAddSuccess"; // JSP 파일의 경로와 이름
    }
    
    // 장바구니 추가 성공 페이지 이동
    @GetMapping("/reviewAddFail")
    public String reviewAddFail() {
        return "reviewAddFail"; // JSP 파일의 경로와 이름
    }
    
    // 리뷰 추가 페이지 이동
    @GetMapping("/reviewAdd")
    public String reviewAdd() {
        
        return "reviewAdd";
    }
    
 // 관리자 리뷰 페이지
    @GetMapping("/adminReviewList")
    public String adminReviewList(ModelMap model) {
    	
    	Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		// 관리자만 접근 가능
		UserDTO user = (UserDTO) auth.getPrincipal();
		if (user.getRole() != 1) {

			return "redirect:/home";
		}
        
    	List<ReviewDTO> reviewList = new ArrayList<>();
    	model.addAttribute("reviewList", reviewList);
    	reviewList.addAll(reviewService.allReviewList());
    	
    	
        return "adminReviewList";
    }
    
 // 강의 삭제 처리
 	@PostMapping("/deleteReview")
 	public String deleteCourse(ReviewDTO reviewDTO, BindingResult result, RedirectAttributes redirectAttributes) {


 		int dbResult = reviewService.deleteReview(reviewDTO);

 		if (dbResult > 0) {
 			redirectAttributes.addFlashAttribute("message", "강의가 성공적으로 추가되었습니다.");
 		} else {
 			redirectAttributes.addFlashAttribute("message", "강의 추가에 실패했습니다.");
 		}

 		return "redirect:/home";
 	}
    
}
