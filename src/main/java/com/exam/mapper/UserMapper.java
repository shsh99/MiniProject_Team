package com.exam.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.exam.dto.user.UserDTO;

@Mapper
public interface UserMapper {
	
	public UserDTO login(Map<String, String> map);
	
	public UserDTO idCheck(String login_id);
	
	public int save(UserDTO user);

	public UserDTO findById(int id);

	public void update(UserDTO user);

	public int delete(int id);
	
	List<UserDTO> selectAllUsers();
}
