package com.exam.service.course;

import java.util.List;

import org.springframework.stereotype.Service;

import com.exam.dto.cart.CartDTO;
import com.exam.mapper.CartMapper;

@Service
public class CartServiceImpl implements CartService {

	CartMapper cartMapper;
	
	public CartServiceImpl(CartMapper cartMapper) {
		this.cartMapper = cartMapper;
	}

	@Override
	public int cartAdd(CartDTO dto) {
		return cartMapper.cartAdd(dto);
	}

	@Override
	public List<CartDTO> cartList(int id) {
		return cartMapper.cartList(id);
	}

}
