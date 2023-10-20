package com.bringbring.user.service;

public interface EmailService {

	/**
	 * 이메일 인증 service
	 * @param email
	 * @return
	 * @throws Exception
	 */
	String sendSimpleMessage(String email) throws Exception;
}
