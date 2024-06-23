package com.exam.service.user;

import java.util.List;
import java.util.Map;

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
	public void update(UserDTO user) {
		userMapper.update(user);
	}

	@Override
	public int delete(int id) {

		return userMapper.delete(id);
	}

	@Override
	public UserDTO idCheck(String login_id) {

		return userMapper.idCheck(login_id);
	}

	@Override
	public UserDTO login(Map<String, String> map) {

		return userMapper.login(map);
	}

	@Override
	public List<UserDTO> selectAllUsers() {
		return userMapper.selectAllUsers();
	}

}
