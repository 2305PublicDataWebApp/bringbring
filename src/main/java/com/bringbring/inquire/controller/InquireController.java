package com.bringbring.inquire.controller;

import com.bringbring.inquire.service.InquireService;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/inquire")
public class InquireController {

	private final InquireService inquireService;
	private final UserService userService;

	@GetMapping("/insert.do")
	public String showInquireInsert(Model model){
		return "inquire/insert";
	}

//	@PostMapping("/insert.do")
//	public String insertInquire(Model model
//			, @ModelAttribute Inquire inquire
//			, @RequestParam(value="uploadFiles", required = false) MultipartFile[] uploadFiles
//			, HttpServletRequest request
//			, HttpSession httpSession) {
//
//		String userId = (String)httpSession.getAttribute("sessionId");
//		User user = userService.selectOneById(userId);
//		inquire.setUserNo(user.getUserNo());
//		int result = inquireService.insertInquire(inquire, uploadFiles, request );
//		if(result > 0 ) {
//			int max = inquireService.selectMaxNo();
//			model.addAttribute("redirect:/inquire/detail.do?inqNo="+max);
//			return "redirect:/inquire/detail.do?inqNo=" + max;
//		} else {
//			return "/";
//		}
//	}
}
