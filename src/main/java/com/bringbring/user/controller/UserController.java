package com.bringbring.user.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.bringbring.admin.domain.Role;
import com.bringbring.admin.service.AdminService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bringbring.user.domain.User;
import com.bringbring.user.service.EmailService;
import com.bringbring.user.service.SocialLoginService;
import com.bringbring.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class UserController {
	
	private final AdminService adminService;
	private final UserService userService;
	private final EmailService emailService;

	// 로그인 
	@GetMapping("/login.do")
	public String showLoginform(Model model) {
		return "user/login";
	}
	
	// 로그인 기능
	@PostMapping("/login.do")
	public String userLogin(
			@ModelAttribute User user
			, Model model
			, HttpSession session) {
		User userOne = userService.selectCheckLogin(user);
		if(userOne != null) {

			// 권한 체크
			Role role = adminService.selectRoleByNo(userOne.getUserNo());
			session.setAttribute("sessionId", userOne.getUserId());
			session.setAttribute("sessionName", userOne.getUserName());
			session.setAttribute("sessionUserGrade", role.getUserGrade());
			session.setAttribute("sessionRoleNo", role.getRoleNo());
			//성공하면 메인화면
			return "redirect:/";
		} else {
			//실패하면 에러페이지로 이동
			model.addAttribute("msg", "로그인이 완료되지 않았습니다.");
			model.addAttribute("error", "로그인 실패");
			model.addAttribute("url", "/user/login.do");
			return "common/error";
		}
	}
	
	// 로그아웃 기능
	@GetMapping("/logout.do")
	public String userLogout(
			HttpSession session) {
		if(session != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	// 회원가입
	@GetMapping("/insert.do")
	public String showInsertUserForm() {
		return "user/insert";
	}
	
	// 회원가입 기능
	@ResponseBody
	@PostMapping("/insert.do")
	public String insertUser(
			@ModelAttribute User user
			, Model model) {
		
		user.setUserProfileName("Test_img2.png");
		user.setUserProfileRename("Test_img2.png");
		user.setUserProfilePath("../resources/assets/img/mypage/Test_img2.png");
		user.setUserProfileLength(0L);

		int result = userService.insertUser(user);
		if(result>0) {
			String response = "<script>alert('회원가입에 성공하였습니다.');"
					+ "location.href='/user/login.do'</script>";
			return response;
		}else {
			//실패하면 에러페이지로 이동
			model.addAttribute("msg", "회원가입이 완료되지 않았습니다.");
			model.addAttribute("error", "회원가입 실패");
			model.addAttribute("url", "/user/insert.do");
			return "common/error";
		}
	}
	
	// 회원탈퇴 
	@ResponseBody
	@GetMapping("/delete.do")
	public String deleteUser(
			HttpSession session) {
		String userId = (String)session.getAttribute("sessionId");
		
		int result = userService.deleteUser(userId);
		if(result > 0) {
			session.invalidate();
			String response = "<script>alert('탈퇴가 완료되었습니다.');"
					+ "location.href='/'</script>";
			return response;
		}else {
			String response = "<script>alert('탈퇴에 실패하였습니다.');"
					+ "location.href='/user/update.do'</script>";
			return response;
			
		}
	}

	// 아이디(이메일) 중복 확인
	@ResponseBody
	@PostMapping("/Email_check.do")
	public Map<String, String>  selectOneByuserId(
			@RequestParam("userId") String userId) {
		Map<String, String> response = new HashMap<>();
		
		User userOne = userService.selectOneById(userId);
		if(userOne != null) {
			if(userId.equals(userOne.getUserId())) {
				response.put("unavailable", "이미 사용중인 이메일입니다.");
			}else {				
				response.put("available", "사용가능한 이메일입니다.");
			}
		}else {
			response.put("available", "사용가능한 이메일입니다.");
		}
		return response;
	}
	
	// 아이디(이메일) 찾기
	@GetMapping("/findEmail.do")
	public String showFindEmailForm() {
		return "user/findEmail";
	}
	
	// 아이디(이메일) 찾기 기능
	@ResponseBody
	@PostMapping("/findEmail.do")
	public Map<String, String> selectOneFindEmail(
			@ModelAttribute User user
			, Model model) {
		Map<String, String> response = new HashMap<>();
		
		User userOne = userService.selectOneFindEmail(user);
		if(userOne != null) {
			String result = userOne.getUserId();
			response.put("userId", result);
		}else {
			response.put("error","정보를 찾을 수 없습니다.");
		}
		return response;
	}
	
	// 비밀번호 찾기 
	@GetMapping("/findPwd.do")
	public String showFindPwdForm() {
		return "user/findPwd";
	}
	
	// 비밀번호 찾기
	@ResponseBody
	@PostMapping("/findPwd.do")
	public Map<String, String> selectOneFindPwd(
			@ModelAttribute User user
			, Model model) {
		Map<String, String> response = new HashMap<>();
		
		User userOne = userService.selectOneFindPwd(user);
		if(userOne != null) {
			String result = userOne.getUserPwd();
			response.put("userPwd", result);
		}else {
			response.put("error","이름, 전화번호, 아이디를 맞게 입력해주세요.");
		}
		return response;
	}
	// 이메일 인증
	@ResponseBody
	@PostMapping("/mailConfirm")
	String emailConfirm(
			@RequestParam("email") String email) throws Exception {

	   String code = emailService.sendSimpleMessage(email);
	   System.out.println("인증코드 : " + code);
	   return code;
	}
	
	// 회원정보 수정
	@GetMapping("/update.do")
	public String showUpdateUserForm(
			Model model
			, HttpSession session) {
		
		String userId = (String)session.getAttribute("sessionId");
		User userOne = userService.selectOneById(userId);
		if(userOne != null) {
			model.addAttribute("userOne", userOne);
			
			return "user/update";
		}else {
			//실패하면 에러페이지로 이동
			model.addAttribute("msg", "정보를 찾을 수 없습니다.");
			model.addAttribute("error", "회원정보 가져오기 실패");
			model.addAttribute("url", "/mypage/main.do");
			return "common/error";
		}
		
	}
	
	// 회원정보 수정
	@PostMapping("/update.do")
	public String updateUser(
			@ModelAttribute User user
			, Model model
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile
			, HttpServletRequest request) throws IllegalStateException, IOException {
		
		if(uploadFile != null && !uploadFile.isEmpty()) {
			String fileName = user.getUserProfileRename();
			// 기존 업로드 된 파일 존재 여부 체크 후
			if(fileName != null) {
				// 있으면 기존 파일 삭제
				this.deleteFile(fileName, request);
			}
			Map<String, Object> infoMap = this.saveFile(request, uploadFile);
            user.setUserProfileName((String) infoMap.get("userProfileName"));
            user.setUserProfileRename((String) infoMap.get("userProfileRename"));
            user.setUserProfilePath((String) infoMap.get("userProfilePath"));
            user.setUserProfileLength((long) infoMap.get("userProfileLength"));
		}
		int result = userService.updateUser(user);
		if(result>0) {
			User userOne = userService.selectOneById(user.getUserId());
			model.addAttribute("userOne", userOne);
			return "redirect:/user/update.do";
		}else {
			//실패하면 에러페이지로 이동
			model.addAttribute("msg", "정보 수정이 완료되지 않았습니다.");
			model.addAttribute("error", "정보 수정 실패");
			model.addAttribute("url", "/mypage/main.do");
			return "common/error";
		}
	}
	
	// 파일 업로드(이미지)
	public Map<String, Object> saveFile(
			HttpServletRequest request
			, MultipartFile uploadFile) throws IllegalStateException, IOException {
	    Map<String, Object> fileMap = new HashMap<String, Object>();
	    // resource 경로 구하기
	    String root = request.getSession().getServletContext().getRealPath("resources/assets/img/user");
	    // 파일 저장경로 구하기
	    String savePath = root + "\\profileFiles";
	    // 파일 이름 구하기
	    String fileName = uploadFile.getOriginalFilename();
	    // 파일 확장자 구하기
	    String extension = fileName.substring(fileName.lastIndexOf(".") + 1);
	    // 시간으로 파일 리네임하기
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
	    String fileRename = sdf.format(new Date(System.currentTimeMillis())) + "." + extension;
	    // 파일 저장 전 폴더 만들기
	    File saveFolder = new File(savePath);
	    if (!saveFolder.exists()) {
	        saveFolder.mkdir();
	    }
	    // 파일 저장
	    File saveFile = new File(savePath + "\\" + fileRename);
	    uploadFile.transferTo(saveFile);
	    long fileLength = uploadFile.getSize();
	    // 파일 정보 리턴
	    fileMap.put("userProfileName", fileName);
	    fileMap.put("userProfileRename", fileRename);
	    fileMap.put("userProfilePath", "../resources/assets/img/user/profileFiles/" + fileRename);
	    fileMap.put("userProfileLength", fileLength);

	    return fileMap;
	}
	
	private void deleteFile(String fileName, HttpServletRequest request) {
	    String root = request.getSession().getServletContext().getRealPath("resources/assets/img/user");
	    String delFilePath = root + "\\profileFiles\\" + fileName;
	    File file = new File(delFilePath);
	    
	    // 파일 이름과 파일 리네임이 모두 "profile.png"이 아닌 경우에만 파일 삭제
	    if (file.exists() && (!fileName.equals("Test_img2.png"))) {
	        file.delete();
	    }
	}
	
}
