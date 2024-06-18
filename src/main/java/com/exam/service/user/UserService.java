package com.exam.service.user;

import com.exam.dto.user.UserDTO;

public interface UserService {

	public int save(UserDTO user);

	public  UserDTO findById(int id);

	public int update(UserDTO user);

	public  int delete(int id);
	
}
