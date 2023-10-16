package com.bringbring.inquire.controller;

import com.bringbring.inquire.domain.Inquire;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import org.springframework.stereotype.Controller;

import com.bringbring.inquire.service.InquireService;
import com.bringbring.member.service.MemberService;

import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/inquire")
public class InquireController {

	private final InquireService iService;

}
