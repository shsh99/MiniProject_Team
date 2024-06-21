package com.exam.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.exam.dto.cart.CartDTO;
import com.exam.dto.user.UserDTO;
import com.exam.service.course.CartService;

@Controller
public class CartController {

    private static final Logger logger = LoggerFactory.getLogger(CartController.class);

    private final CartService cartService;

    public CartController(CartService cartService) {
        this.cartService = cartService;
    }

    @PostMapping("/cartAdd")
    public String cartAdd(@RequestParam("cs_id") int cs_id, RedirectAttributes redirectAttributes) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if (auth == null || !auth.isAuthenticated()) {
            // 인증되지 않은 사용자의 경우 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

        UserDTO user = (UserDTO) auth.getPrincipal();
        logger.debug("Logged in user: {}", user);

        CartDTO cartDTO = new CartDTO();
        cartDTO.setUs_id(user.getId());
        cartDTO.setCs_id(cs_id);

        int n = cartService.cartAdd(cartDTO);

        // 리다이렉트 시 메시지 전달
        redirectAttributes.addFlashAttribute("message", "장바구니에 추가되었습니다.");

        return "redirect:/home";
    }
    
    @GetMapping("/cartList")
    public String cartList(ModelMap model) {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        
        if (auth == null || !auth.isAuthenticated()) {
            // 인증되지 않은 사용자의 경우 로그인 페이지로 리다이렉트
            return "redirect:/login";
        }

        UserDTO user = (UserDTO) auth.getPrincipal();
        logger.debug("Logged in userrr: {}", user);

        // 사용자의 장바구니 정보 조회
        List<CartDTO> cartList = cartService.cartList(user.getId());
        model.addAttribute("cartList", cartList);
        
        return "cartList"; // JSP 파일의 경로와 이름
    }
}
