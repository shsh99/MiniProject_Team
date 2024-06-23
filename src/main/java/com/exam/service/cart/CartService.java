package com.exam.service.cart;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.cart.CartDTO;


@Service
public interface CartService {

	public int cartAdd( CartDTO dto);
	public List<CartDTO> cartList(int id);
	public int deleteCart(CartDTO dto);
	public int deleteAllCart(CartDTO dto);

	// 추가: 중복 상품 체크 메서드
    boolean isDuplicateItem(int us_id, int cs_id);
}
