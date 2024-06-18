package com.exam.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.user.UserDTO;

@Mapper
public interface UserMapper {
	public int save(UserDTO user);

	public UserDTO findById(int id);

	public int update(UserDTO user);

	public int delete(int id);
}
