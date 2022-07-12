package com.jafa.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import com.jafa.security.CustomLoginSuccessHandler;
import com.jafa.security.CustomNoopPasswordEncoder;
import com.jafa.security.CustomUserDetailService;
import com.jafa.security.LoginFailureHandler;

@Configuration
public class SecurityBean {
	
	@Autowired
	DataSource dataSource;

//	@Bean
//	public AuthenticationSuccessHandler loginSuccessHandler() {
//		return new CustomLoginSuccessHandler();
//	}
	
//	@Bean
//	public UserDetailsService userDetailsService() {
//		return new CustomUserDetailService();
//	}
	
	@Bean
	public PasswordEncoder bcryptPwEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Bean
	public PasswordEncoder nooPencoder() {
		return new CustomNoopPasswordEncoder();
	}
	
//	@Bean
//	public AuthenticationFailureHandler failureHandler() {
//		LoginFailureHandler lf = new LoginFailureHandler();
//		lf.setLoginId("loginId");
//		lf.setLoginPw("loginPw");
//		lf.setErrorMessage("errorMessage");
//		lf.setDefaultFailureUrl("/customLogin");
//		return lf;
//	}
	
	@Bean
	public  PersistentTokenRepository persistentTokenRepository() {
		JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
		repo.setDataSource(dataSource);
		return repo;
	}
	
}
