package com.exam.controller.cart;

import java.util.List;

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

import com.exam.dto.cart.CartDTO;
import com.exam.dto.user.UserDTO;
import com.exam.service.application_list.Application_listService;
import com.exam.service.cart.CartService;

@Controller
public class CartController {

    Logger logger = LoggerFactory.getLogger(CartController.class);

    CartService cartService;
    Application_listService application_listService;

    public CartController(CartService cartService, Application_listService application_listService) {
        this.cartService = cartService;
        this.application_listService = application_listService;
    }

 // 장바구니 추가 기능
    @PostMapping("/cartAdd")
    public String cartAdd(@RequestParam("cs_id") int cs_id, RedirectAttributes redirectAttributes, Model model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        UserDTO user = (UserDTO) auth.getPrincipal();
        logger.debug("Logged in user: {}", user);
        
        if (application_listService.isDuplicateItem(user.getId(), cs_id)) {
            redirectAttributes.addFlashAttribute("message", "이미 수강신청하셨습니다");
            return "redirect:/applicationAddFail";
        }
        
        // 중복 상품 체크
        if (cartService.isDuplicateItem(user.getId(), cs_id)) {
            redirectAttributes.addFlashAttribute("message", "이미 장바구니에 해당 상품이 존재합니다.");
            return "redirect:/cartAddFail";
        }

        CartDTO cartDTO = new CartDTO();
        cartDTO.setUs_id(user.getId());
        cartDTO.setCs_id(cs_id);

        int n = cartService.cartAdd(cartDTO);

        // 리다이렉트 시 메시지 전달
        if (n > 0) {
            return "redirect:/cartAddSuccess";
        } else {
            redirectAttributes.addFlashAttribute("message", "장바구니 추가에 실패했습니다.");
            return "redirect:/home";
        }
    }    
    
 // 장바구니 추가 성공 페이지 이동
    @GetMapping("/cartAddSuccess")
    public String cartAddSuccess() {
        return "cartAddSuccess"; // JSP 파일의 경로와 이름
    }
    
    // 장바구니 추가 성공 페이지 이동
    @GetMapping("/cartAddFail")
    public String cartAddFail() {
        return "cartAddFail"; // JSP 파일의 경로와 이름
    }
    
    // 장바구니 페이지 이동
    @GetMapping("/cartList")
    public String cartList(ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        UserDTO user = (UserDTO) auth.getPrincipal();
        logger.debug("Logged in userrr: {}", user);

        // 사용자의 장바구니 정보 조회
        List<CartDTO> cartList = cartService.cartList(user.getId());
        model.addAttribute("cartList", cartList);
        
        return "cartList"; // JSP 파일의 경로와 이름
    }
    
    // 장바구니 삭제
    @PostMapping("/deleteCart")
	public String deleteCart(CartDTO cartDTO,
	                        BindingResult result,
	                        RedirectAttributes redirectAttributes) {

	    int dbResult = cartService.deleteCart(cartDTO);

	    if (dbResult > 0) {
	        redirectAttributes.addFlashAttribute("message", "강의가 성공적으로 추가되었습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("message", "강의 추가에 실패했습니다.");
	    }

	    return "redirect:/cartList";
	}
    
    // 장바구니 전체 삭제
    @PostMapping("/deleteAllCart")
	public String deleteAllCart(CartDTO cartDTO,
	                        BindingResult result,
	                        RedirectAttributes redirectAttributes) {

	    int dbResult = cartService.deleteAllCart(cartDTO);

	    if (dbResult > 0) {
	        redirectAttributes.addFlashAttribute("message", "강의가 성공적으로 추가되었습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("message", "강의 추가에 실패했습니다.");
	    }

	    return "redirect:/cartList";
	}
}
