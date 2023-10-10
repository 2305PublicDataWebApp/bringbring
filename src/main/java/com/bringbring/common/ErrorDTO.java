package com.bringbring.common;

import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ErrorDTO {
	
	@ExceptionHandler(NullPointerException.class)
    public String nullex(NullPointerException e, Model model) {
		System.out.println(e.getMessage());
		model.addAttribute("msg", "NullPointerException 발생, return 확인, 실수 확인");
		model.addAttribute("url", "/");
        return "common/error";
    }
	
	@ExceptionHandler(RuntimeException.class)
    public String runtime(RuntimeException e, Model model) {
		System.out.println(e.getMessage());
		model.addAttribute("msg", "RuntimeException 발생, 수정요망");
		model.addAttribute("url", "/");
        return "common/error";
    }
	
	@ExceptionHandler(DataAccessException.class)
    public String runtime(DataAccessException e, Model model) {
		System.out.println(e.getMessage());
		model.addAttribute("msg", "DataAccessException 발생, DB오류 수정요망");
		model.addAttribute("url", "/");
        return "common/error";
    }
	
}
