package com.exam.controller.application_list;

import java.time.LocalDate;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.dto.application_list.Application_listDTO;
import com.exam.dto.user.UserDTO;
import com.exam.service.application_list.Application_listService;

@Controller
public class Application_listController {

    Logger logger = LoggerFactory.getLogger(Application_listController.class);

    Application_listService application_listService;

    public Application_listController(Application_listService application_listService) {
        this.application_listService = application_listService;
    }

    // 카트 추가 기능
    @PostMapping("/applicationAdd")
    public String applicationAdd(@RequestParam("cs_id") int cs_id, RedirectAttributes redirectAttributes) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        UserDTO user = (UserDTO) auth.getPrincipal();
        logger.debug("Logged in user: {}", user);
        
     // 중복 상품 체크
        if (application_listService.isDuplicateItem(user.getId(), cs_id)) {
            redirectAttributes.addFlashAttribute("message", "이미 수강신청하셨습니다");
            return "redirect:/applicationAddFail";
        }

        Application_listDTO application_listDTO = new Application_listDTO();
        application_listDTO.setUs_id(user.getId());
        application_listDTO.setCs_id(cs_id);
        application_listDTO.setApplication_date(LocalDate.now()); // 현재 날짜 설정

        
        int n = application_listService.applicationAdd(application_listDTO);

        // 리다이렉트 시 메시지 전달
        if (n > 0) {
            return "redirect:/applicationAddSuccess";
        } else {
            redirectAttributes.addFlashAttribute("message", "수강 신청 실패했습니다.");
            return "redirect:/home";
        }
    }
    
    // 장바구니 추가 성공 페이지 이동
    @GetMapping("/applicationAddSuccess")
    public String applicationAddSuccess() {
        return "applicationAddSuccess"; // JSP 파일의 경로와 이름
    }
    
    // 장바구니 추가 성공 페이지 이동
    @GetMapping("/applicationAddFail")
    public String applicationAddFail() {
        return "applicationAddFail"; // JSP 파일의 경로와 이름
    }
    
    // 장바구니 페이지 이동
    @GetMapping("/applicationList")
    public String applicationList(ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        UserDTO user = (UserDTO) auth.getPrincipal();
        logger.debug("Logged in userrr: {}", user);

        // 사용자의 장바구니 정보 조회
        List<Application_listDTO> application_list = application_listService.applicationList(user.getId());
        model.addAttribute("application_list", application_list);
        
        return "application_list"; // JSP 파일의 경로와 이름
    }
    
    // 장바구니 삭제
    @PostMapping("/deleteApplication")
	public String deleteApplication(Application_listDTO application_listDTO,
	                        BindingResult result,
	                        RedirectAttributes redirectAttributes) {

	    int dbResult = application_listService.deleteApplication(application_listDTO);

	    if (dbResult > 0) {
	        redirectAttributes.addFlashAttribute("message", "강의가 성공적으로 추가되었습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("message", "강의 추가에 실패했습니다.");
	    }

	    return "redirect:/home";
	}
    
    // 장바구니 전체 삭제
    @PostMapping("/deleteAllApplication")
	public String deleteAllApplication(Application_listDTO application_listDTO,
	                        BindingResult result,
	                        RedirectAttributes redirectAttributes) {

	    int dbResult = application_listService.deleteAllApplication(application_listDTO);

	    if (dbResult > 0) {
	        redirectAttributes.addFlashAttribute("message", "강의가 성공적으로 추가되었습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("message", "강의 추가에 실패했습니다.");
	    }

	    return "redirect:/home";
	}
}
