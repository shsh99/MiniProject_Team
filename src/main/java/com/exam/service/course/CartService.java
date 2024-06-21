package com.exam.service.course;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.cart.CartDTO;


@Service
public interface CartService {

	public int cartAdd( CartDTO dto);
	public List<CartDTO> cartList(int id);
}
