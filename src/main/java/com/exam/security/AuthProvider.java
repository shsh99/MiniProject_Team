package com.exam.security;

import com.exam.dto.user.UserDTO;
import com.exam.service.user.UserService;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class AuthProvider implements AuthenticationProvider {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    // 생성자 주입 사용
    public AuthProvider(UserService userService, PasswordEncoder passwordEncoder) {
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String loginId = authentication.getName(); // 입력된 로그인 ID
        String password = (String) authentication.getCredentials(); // 입력된 비밀번호

        UserDTO user = userService.idCheck(loginId); // 해당 로그인 ID의 사용자 정보 조회

        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
            // 사용자의 역할(role)에 따라 권한을 부여
            List<GrantedAuthority> authorities = new ArrayList<>();
            authorities.add(new SimpleGrantedAuthority(user.getRole() == 1 ? "ROLE_ADMIN" : "ROLE_USER"));

            // 사용자 인증 성공 후, 인증 토큰 생성
            return new UsernamePasswordAuthenticationToken(user, null, authorities);
        }

        // 로그인 실패 시 예외 처리
        throw new BadCredentialsException("로그인 정보가 일치하지 않습니다.");
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return UsernamePasswordAuthenticationToken.class.isAssignableFrom(authentication);
    }
}
