package com.jafa.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.jafa.dto.Board;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String Home(HttpServletResponse response) {
		
		Cookie cookie = new Cookie("myCookie", "쿠키먹고싶다");
		cookie.setMaxAge(60*60*24);
		response.addCookie(cookie);
		return "home";
	}
}
