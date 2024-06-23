package com.exam.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityFilterChainConfig {

	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
		http
				// HTTP 보안 설정
				.authorizeRequests()
				// 누구나 접근할 수 있는 URL 설정
				.antMatchers("/login", "/home", "/signup", "/webjars/**", "/images/**", "/idCheck", "/courseRetrieve*").permitAll()
				 .antMatchers("/admin/**").hasAuthority("ADMIN") // ADMIN 권한이 있는 사용자만 접근 가능한 URL
				// 나머지 URL은 인증을 요구함
				.anyRequest().authenticated().and()
				// 로그인 설정
				.formLogin().loginPage("/login") // 로그인 페이지 URL 설정
				.loginProcessingUrl("/auth") // 로그인 처리 URL 설정
				.usernameParameter("login_id") // 로그인 폼에서 사용자명 파라미터 이름 설정
				.passwordParameter("password") // 로그인 폼에서 비밀번호 파라미터 이름 설정
				.failureForwardUrl("/login_fail") // 로그인 실패 시 이동할 URL 설정
				.defaultSuccessUrl("/login_success", true) // 로그인 성공 시 기본 이동할 URL 설정
				.permitAll().and()
				// CSRF 설정 비활성화
				.csrf().disable()

				// 로그아웃 설정
				.logout().logoutUrl("/logout") // 로그아웃 처리 URL 설정
				.logoutSuccessUrl("/home") // 로그아웃 성공 시 이동할 URL 설정
				.permitAll();

		return http.build();
	}
}
