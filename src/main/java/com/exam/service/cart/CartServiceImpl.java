package com.exam.service.cart;

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

	@Override
	public int deleteCart(CartDTO dto) {
		return cartMapper.deleteCart(dto);
	}

	@Override
	public int deleteAllCart(CartDTO dto) {
		return cartMapper.deleteAllCart(dto);
	}

	@Override
    public boolean isDuplicateItem(int us_id, int cs_id) {
        // 해당 사용자의 장바구니에 이미 동일 상품이 있는지 체크하는 로직
        List<CartDTO> cartList = cartMapper.cartList(us_id);
        for (CartDTO cartItem : cartList) {
            if (cartItem.getCs_id() == cs_id) {
                return true; // 동일 상품이 존재하면 true 반환
            }
        }
        return false; // 동일 상품이 없으면 false 반환
    }

}
