package com.exam.service.user;

import java.util.Map;

import com.exam.dto.user.UserDTO;

public interface UserService {
	
	public UserDTO login(Map<String, String> map);

	public UserDTO idCheck(String login_id);

	public int save(UserDTO user);

	public UserDTO findById(int id);

	public void update(UserDTO user);

	public int delete(int id);

}
