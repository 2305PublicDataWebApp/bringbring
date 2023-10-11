package com.bringbring.inquire.controller;

import org.springframework.stereotype.Controller;

import com.bringbring.inquire.service.InquireService;
import com.bringbring.member.service.MemberService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class InquireController {

	private final InquireService iService;
}
