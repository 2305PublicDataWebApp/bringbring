package com.bringbring.user.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.math.BigInteger;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import com.bringbring.user.domain.NaverLoginApi;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.SocialLoginService;
import com.bringbring.user.store.SocialLoginStore;
import com.bringbring.user.store.UserStore;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@Transactional
public class SocialLoginServiceImpl implements SocialLoginService{
	
	private final SocialLoginStore socialLoginStore;
	private final UserStore userStore;
	
	// 네이버 로그인 관련
	private final static String NAVER_CLIENT_ID = "oWq7iXzHYNRYo_as3iSc";
	private final static String NAVER_CLIENT_SECRET = "9GSiGzyMtY";
	private final static String NAVER_REDIRECT_URI = "http://127.0.0.1:8888/social/naverLogin.do";
	private final static String SESSION_STATE = "oauth_state";
	// 프로필 조회 API URL
	private final static String NAVER_PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";

	// 네이버 로그인 Url 가져오기
	public String getAuthorizational(HttpSession session) {
		// 세선 유효성 검증을 위한 난수 생성
		String state = UUID.randomUUID().toString();
		// 난수 값을 session에 저장
		session.setAttribute(SESSION_STATE, state);
		// Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성
		OAuth20Service oauthService = new ServiceBuilder().apiKey(NAVER_CLIENT_ID)
														  .apiSecret(NAVER_CLIENT_SECRET )
														  .callback(NAVER_REDIRECT_URI)
														  .state(state)
														  .build(NaverLoginApi.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	// 네이버 토큰 가져오기
	@Override
	public OAuth2AccessToken getNaverToken(HttpSession session, String code, String state) throws Exception {
		String sessionState = (String) session.getAttribute(SESSION_STATE);
		System.out.println("sessionState : " + sessionState + ", state : " + state);
		if(StringUtils.pathEquals(sessionState, state)) {			
			OAuth20Service oauthService = new ServiceBuilder().apiKey(NAVER_CLIENT_ID)
															  .apiSecret(NAVER_CLIENT_SECRET )
															  .callback(NAVER_REDIRECT_URI)
															  .state(state)
															  .build(NaverLoginApi.instance());
			// Scribe에서 제공하는 AccessToken 획득 기능으로 네아로 Access Token을 획득
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}else {
			return null;
		}
		
	}

	// 네이버 사용자 프로필 API 호출
	@Override
	public String getUserProfile(OAuth2AccessToken accessToken) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder().apiKey(NAVER_CLIENT_ID)
														  .apiSecret(NAVER_CLIENT_SECRET )
														  .callback(NAVER_REDIRECT_URI)
														  .build(NaverLoginApi.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.POST, NAVER_PROFILE_API_URL, oauthService);
		oauthService.signRequest(accessToken, request);
		Response response = request.send();
		
		return response.getBody();
	}

	// 네이버 사용자 회원가입
	@Override
	public int insertNaver(Map<String, Object> userInfo) {
		return socialLoginStore.insertNaver(userInfo);
	}

	// 카카오 토큰 가져오기
	@Override
	public String getKakaoToken(String code) throws Exception {
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

	// 카카오 로그인 
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
	        userInfo.put("userProfileName","default_image.png");
	        userInfo.put("userProfileRename","default_image.png");
	        userInfo.put("userProfilePath","../resources/assets/img/mypage/default_image.png");
	        userInfo.put("userProfileLength",0L);
	        
	        User kakaoUser = userStore.selectOneById(userId);
	        if(kakaoUser == null) {
	        	SecureRandom random = new SecureRandom();
	        	String userPwd = new BigInteger(40, random).toString(32);
	        	userInfo.put("userPwd", userPwd);
//	        	User kakaoUser1 = new User(userId, userPwd, userNickName);
	        	int insertResult = socialLoginStore.insertKakao(userInfo);
	        	if(insertResult > 0) {
	        		System.out.println("카카오 회원가입 성공");
	        	}
	        }
	      
	        return userInfo;
		}

	// 카카오 로그아웃
	@Override
	public void kakaoLogout(String kakaoAccessToken) throws Exception {
		String reqURL = "https://kapi.kakao.com/v1/user/unlink";
		URL url = new URL(reqURL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Authorization", "Bearer " + kakaoAccessToken);
        int responseCode = conn.getResponseCode();
        System.out.println("responseCode : " + responseCode);
        
        BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        
        String result = "";
        String line = "";
        
        while ((line = br.readLine()) != null) {
            result += line;
        }
        System.out.println(result);
		
	}

}
