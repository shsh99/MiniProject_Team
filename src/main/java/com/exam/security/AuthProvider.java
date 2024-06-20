package com.exam.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.exam.dto.user.UserDTO;
import com.exam.service.user.UserService;

@Component
public class AuthProvider implements AuthenticationProvider {

	UserService userService;
	// BCryptPasswordEncoder passwordEncoder;

	public AuthProvider(UserService userService) {
		this.userService = userService;
		// this.passwordEncoder = new BCryptPasswordEncoder();
	}

	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {

		String login_id = (String) authentication.getPrincipal(); // 입력된 로그인 ID
		String password = (String) authentication.getCredentials(); // 입력된 비밀번호

		UserDTO user = userService.idCheck(login_id); // 해당 로그인 ID의 사용자 정보 조회

		if (user != null && new BCryptPasswordEncoder().matches(password, user.getPassword())) {

			// 로그인 성공 조건: 사용자 정보가 존재하고, 입력된 비밀번호가 DB에 저장된 암호와 일치할 경우
			if (user != null && new BCryptPasswordEncoder().matches(password, user.getPassword())) {

			}
			List<GrantedAuthority> list = new ArrayList<>();

			// 사용자의 역할(role)에 따라 권한을 부여
			if (user.getRole() == 1) { // 1은 관리자를 나타내는 역할 코드
				list.add(new SimpleGrantedAuthority("ROLE_ADMIN"));
			} else {
				list.add(new SimpleGrantedAuthority("ROLE_USER"));
			}

			// 사용자 인증 성공 후, 인증 토큰 생성
			return new UsernamePasswordAuthenticationToken(user, null, list);

		}
		// 로그인 실패 시 예외 처리
		throw new BadCredentialsException("로그인 정보가 일치하지 않습니다.");

	}

	@Override
	public boolean supports(Class<?> authentication) {
		return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
	}
}