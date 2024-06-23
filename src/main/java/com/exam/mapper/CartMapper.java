package com.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.cart.CartDTO;
import com.exam.dto.course.CourseDTO;

@Mapper
public interface CartMapper {
	
	public int cartAdd( CartDTO dto);
	public List<CartDTO> cartList(int id);
	public int deleteCart(CartDTO dto);
	public int deleteAllCart(CartDTO dto);

}
