package com.exam.service.user;

import org.springframework.stereotype.Service;

import com.exam.dto.user.UserDTO;
import com.exam.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	UserMapper userMapper;

	public UserServiceImpl(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

	@Override
	public int save(UserDTO user) {

		return userMapper.save(user);
	}

	@Override
	public UserDTO findById(int id) {

		return userMapper.findById(id);
	}

	@Override
	public int update(UserDTO user) {

		return userMapper.update(user);
	}

	@Override
	public int delete(int id) {

		return userMapper.delete(id);
	}

}
