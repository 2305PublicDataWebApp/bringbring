package com.bringbring.user.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
//import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bringbring.user.domain.User;
import com.bringbring.user.service.SocialLoginService;
import com.bringbring.user.store.UserStore;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class SocialLoginServiceImpl implements SocialLoginService{
	
	private final UserStore userStore;

	@Override
	public String getToken(String code) throws Exception {
		String access_Token = "";
		
		// EndPoint Url = API가 서버에서 자원에 접근할 수 있도록 하는 Url
		final String requestUrl = "https://kauth.kakao.com/oauth/token";
		
		// 토근을 요철할 URL 객체 생성
		URL url = new URL(requestUrl);
		
		// HTTP 연결 설정
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");
		con.setDoOutput(true);
		
		// 서버로 요청 보내기
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(con.getOutputStream()));
		StringBuilder sb = new StringBuilder();
		sb.append("grant_type=authorization_code");
		sb.append("&client_id=b82d0f1e81f80d7dfb52a8b896d5b146"); // JavaScript 키
		sb.append("&redirect_uri=http://127.0.0.1:8888/social/kakaoLogin.do");
		sb.append("&code=" + code);
		bw.write(sb.toString());
		bw.flush();
		
		// 결과 코드가 200이라면 성공
		int responseCode = con.getResponseCode();
		System.out.println("responseCode : " + responseCode);
		
		// 서버의 응답 데이터 가져옴
		BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String line = "";
		String result = "";
		
		// result에 토큰이 포함된 응답데이터를 한줄씩 저장
		while((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println("result : " +result);
		
//		// 이미 JSON 데이터를 파싱한 결과, 그 안에서 필요한 데이터를 추출가능
//		JsonObject jsonobject = (JsonObject) JsonParser.parseString(result); 
//		
//		access_token = jsonobject.getAsJsonObject().get("access_token").getAsString();
		
		Gson gson = new Gson();
		JsonElement element = gson.fromJson(result, JsonElement.class);
		
		access_Token = element.getAsJsonObject().get("access_token").getAsString();
		
		System.out.println("access_Token : " + access_Token);
		
		br.close();
		bw.close();
		System.out.println(access_Token);
	
		return access_Token;
	}

	@Override
	public Map<String, Object> getUserInfo(String access_token) throws Exception{
		Map<String, Object> userInfo = new HashMap<>();
		
		final String requestUrl = "https://kapi.kakao.com/v2/user/me";
		
		// reuqestUrl 사용해서 HTTP 요청으로 보내고 응답을 수신하기 위한 코드
		URL url = new URL(requestUrl);
		HttpURLConnection con = (HttpURLConnection) url.openConnection();
		con.setRequestMethod("POST");
		con.setRequestProperty("Authorization", "Bearer " + access_token);
		
		int responseCode = con.getResponseCode();
		System.out.println("responseCode : " + responseCode);
		
		// BufferedReader를 사용하여 InputStream에서 데이터를 읽어들이는 코드
		BufferedReader bf = new BufferedReader(new InputStreamReader(con.getInputStream()));
		String line = "";
		String result = "";
		
		// result에 토큰이 포함된 응답데이터를 한줄씩 저장
		while((line = bf.readLine()) != null) {
			result += line;
		}
		
//		JsonObject jsonobject = (JsonObject) JsonParser.parseString(result); 
//		JsonObject properties = jsonobject.getAsJsonObject().get("properties").getAsJsonObject();
//	    JsonObject kakao_account = jsonobject.getAsJsonObject().get("kakao_account").getAsJsonObject();
	    
		Gson gson = new Gson();
		JsonElement element = gson.fromJson(result, JsonElement.class);

		JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
		JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
		
	  //콘솔창 확인 후 필요한 정보 추출
        System.out.println("===== properties : "+properties + "=====");
        System.out.println("===== kakao_account : "+kakao_account + "=====");
        
        String userNickName = properties.getAsJsonObject().get("nickname").getAsString();
        String userId = kakao_account.getAsJsonObject().get("email").getAsString();
        
        userInfo.put("userName", userNickName);
        userInfo.put("userId", userId);
        userInfo.put("access_token", access_token);
        userInfo.put("userProfileName","Test_img2.png");
        userInfo.put("userProfileRename","Test_img2.png");
        userInfo.put("userProfilePath","../resources/assets/img/mypage/Test_img2.png");
        userInfo.put("userProfileLength",0L);
        
        User kakaoUser = userStore.selectOneById(userId);
        if(kakaoUser == null) {
        	SecureRandom random = new SecureRandom();
        	String userPwd = new BigInteger(40, random).toString(32);
        	userInfo.put("userPwd", userPwd);
//        	User kakaoUser1 = new User(userId, userPwd, userNickName);
        	int insertResult = userStore.insertKakao(userInfo);
        	if(insertResult > 0) {
        		System.out.println("카카오 회원가입 성공");
        	}
        }
        
        return userInfo;
	}
	
//	public int insertUserAndSocial(User kakaoUser, User kakaoUser1) {
//		int result = userStore.insertKakao(kakaoUser1);
//		int result1 = userStore.insertkakao1(kakaoUser);
//		return result+result1;
//	}

	
	
//    @Value("${spring.security.oauth2.client.registration.naver.client-id}")
//    private String naverClientId;
//    @Value("${spring.security.oauth2.client.registration.naver.redirect-uri}")
//    private String naverRedirectUri;
//    @Value("${spring.security.oauth2.client.provider.naver.authorization-uri}")
//    private String naverAuthorizationUri;
//	
//	@Override
//	public String getNaverAuthorizeUrl(String type) {
//		naverAuthorizationUri += "?response_type=code"
//				+ "&client_id=" + naverClientId
//				+ "&redirect_uri=" + naverRedirectUri
//				+ "&state=" + type;
//		return naverAuthorizationUri;
//	}

}
