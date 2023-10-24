package com.bringbring.notice.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.admin.service.AdminService;
import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.service.NoticeService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService noticeService;
	private final AdminService adminService;
	private final UserService userService;
	
	@GetMapping("/insert.do")
	public String showNoticeInsert(Model model, HttpSession session) {
		Integer userGrade = (Integer)session.getAttribute("sessionUserGrade");
		String userId = (String)session.getAttribute("sessionId");
		Integer adminAll = adminService.selectListCount();
		PageInfo pInfo = new PageInfo(1, 0, 0, adminAll, 0, 0, 0);
		List<AdminDetails> adminList = adminService.selectAdminDetailsList(pInfo);
		for(AdminDetails adminDetail : adminList) {
			if(adminDetail.getUserId().equals(userId)) {
				model.addAttribute("regionName", adminDetail.getRegionName());
				break;
			}
		}
		if(userGrade != null && userGrade >= 2) {
			return "notice/insert";
		}else {
			model.addAttribute("msg", "관리자만 작성이 가능합니다.");
			model.addAttribute("url", "/index.jsp");
			return "common/error";
		}
	}
	
	
	@GetMapping("/delete.do")
	public String deleteNotice(Model model, @ModelAttribute Notice notice, 
			@RequestParam("userNo") Integer writerNo, @RequestParam("noticeNo") Integer noticeNo, HttpSession session) {
		
		Integer userGrade = (Integer)session.getAttribute("sessionUserGrade");
		// 현재 로그인한 사람의 회원번호
		String userId = (String)session.getAttribute("sessionId");
		User user = userService.selectOneById(userId);
		Integer userNo = user.getUserNo();
		
		if ((writerNo != null && writerNo.equals(userNo)) || userGrade == 3) {
			int result = noticeService.deleteNotice(noticeNo);
			if (result > 0) {
				return "redirect:/notice/list.do";
			} else {
				model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
				model.addAttribute("url", "/notice/list.do");
				return "common/error";
			}
		} else {
			model.addAttribute("msg", "본인 글만 삭제 가능!");
			model.addAttribute("url", "/notice/list.do");
			return "common/error";
		}
	}
	
	@PostMapping("/insert.do")
	public String insertNotice(@ModelAttribute Notice notice, 
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, HttpSession session,
			HttpServletRequest request, Model model) throws Exception {
	// 현재 로그인한 사람의 회원번호
		String userId = (String)session.getAttribute("sessionId");
		User user = userService.selectOneById(userId);
		Integer userNo = user.getUserNo();
		
		if(userNo != null && !userNo.equals("")) {
			notice.setUserNo(userNo);
			int result = noticeService.insertNotice(notice);
			if(result > 0) {
				if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
					Image image = new Image();
					Map<String, Object> imgMap = this.saveFile(request, uploadFile);
					image.setTableName("notice");
					image.setImageGroupNo(notice.getNoticeNo());
					image.setImageName((String)imgMap.get("imageName"));
					image.setImageRename((String)imgMap.get("imageRename"));
					image.setImagePath((String)imgMap.get("imagePath"));
					noticeService.insertImage(image);
				}
				return "redirect:/notice/list.do";
			} else {
				model.addAttribute("msg","관리자 로그인 필요!");
				model.addAttribute("url","/index.jsp");
				return "common/error";
			}
		}
		return "redirect:/notice/list.do"; // 예외 상황이나 다른 경우에 대한 기본 다이렉트
	}
	
	@PostMapping("/update.do")
	public String updateNotice(@ModelAttribute Notice notice, @ModelAttribute Image image
			, Model model, HttpSession session, HttpServletRequest request
			, @RequestParam(value="uploadFile", required=false) MultipartFile uploadFile) throws Exception {
		
		Integer userGrade = (Integer)session.getAttribute("sessionUserGrade");
		// 현재 로그인한 사람의 회원번호
		String userId = (String)session.getAttribute("sessionId");
		User user = userService.selectOneById(userId);
		Integer userNo = user.getUserNo();
		// 게시글 작성자 번호
		Integer writerNo = notice.getUserNo();

		if((writerNo != null && writerNo.equals(userNo)) || userGrade == 3) {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				String imageRename = image.getImageRename();
				if(imageRename != null) {
					this.deleteFile(imageRename, request);
				}
				Map<String,Object> imgMap = this.saveFile(request, uploadFile);
				image.setTableName("notice");
				image.setImageGroupNo(notice.getNoticeNo());
				image.setImageName((String)imgMap.get("imageName"));
				image.setImageRename((String)imgMap.get("imageRename"));
				image.setImagePath((String)imgMap.get("imagePath"));
				noticeService.insertImage(image);
			}
			int result = noticeService.updateNotice(notice);
			if(result > 0) {
				return "redirect:/notice/detail.do?noticeNo="+notice.getNoticeNo();
			}else {
				model.addAttribute("msg", "게시글 수정 실패!");
				model.addAttribute("url", "/notice/detail.do?noticeNo="+notice.getNoticeNo());
				return "common/error";
			}
		} else {
			model.addAttribute("msg", "수정 권한 없음!");
			model.addAttribute("url", "/notice/detail.do?noticeNo="+notice.getNoticeNo());
			return "common/error";
		}
	}
	
	private void deleteFile(String imageRename, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String delImgpath = root + "\\nUploadFiles\\" + imageRename;
		File delFile = new File(delImgpath);
		if (delFile.exists()) {
			delFile.delete();
		}
	}

	@GetMapping("/update.do")
	public String showNoticeUpdate(@RequestParam("noticeNo") Integer noticeNo,
			Model model, HttpSession session) {
		Integer userGrade = (Integer)session.getAttribute("sessionUserGrade");
		// 현재 로그인한 사람의 회원번호
		String userId = (String)session.getAttribute("sessionId");
		User user = userService.selectOneById(userId);
		Integer userNo = user.getUserNo();
		// 게시물 번호
		Notice notice = noticeService.selectNoticeByNo(noticeNo);
		// 게시물 작성자 번호 얻어오기
		Integer writerNo = notice.getUserNo();
		
		if((writerNo != null && writerNo.equals(userNo)) || userGrade == 3 ) {
			model.addAttribute("notice", notice);
			return "notice/update";
		}else {
			model.addAttribute("msg", "본인 글만 수정 가능!");
			model.addAttribute("url","/notice/detail.do?noticeNo=" + notice.getNoticeNo());
			return "common/error";
		}
	}
	
	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception {
		Map<String, Object> imgMap = new HashMap<String, Object>();
		// resources경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일 이름 구하기
		String imageName = uploadFile.getOriginalFilename();
		// 파일 확장자 구하기
		String extension = imageName.substring(imageName.lastIndexOf(".")+1);
		// 시간으로 파일리네임
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String imageRename = sdf.format(new Date(System.currentTimeMillis()));
		// 파일 저장경로 구하기
		String savePath = root + "\\assets\\img\\nUploadFiles";
		// 파일 저장 전 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		// 파일 저장
		File saveFile = new File(savePath+"\\"+imageRename+"."+extension);
		uploadFile.transferTo(saveFile);
		// 파일 정보 리턴
		imgMap.put("imageName", imageName);
		imgMap.put("imageRename", imageRename);
		imgMap.put("imagePath", "../resources/assets/img/nUploadFiles/"+imageRename+"."+extension);
		
		return imgMap;
	}

	@GetMapping("/detail.do") 
	public String showNoticeDetail(@RequestParam("noticeNo") Integer noticeNo, Model model) {
		Notice selectOne = noticeService.selectNoticeByNo(noticeNo);
	    // 이미지가 하나인 경우에만 이미지 정보를 가져옴
	    if (selectOne != null) {
	        Image image = noticeService.selectImageByNo(noticeNo);
	        model.addAttribute("image", image);
	    }
		model.addAttribute("notice", selectOne);
		return "notice/detail";
	}
	
	private PageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage = 10;
		int naviTotalCount;
		naviTotalCount = (int) Math.ceil((double) totalCount / recordCountPerPage);

		int startNavi = ((int) ((double) currentPage / naviCountPerPage + 0.9) - 1) * recordCountPerPage + 1;
		int endNavi = startNavi + naviCountPerPage - 1;
		if (endNavi > naviTotalCount) {
			endNavi = naviTotalCount;
		}
		return new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi,
				endNavi);
	}

	@GetMapping("/list.do")
	public String showNoticeList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage, Model model) {
		Integer totalCount = noticeService.getListCount();
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<Notice> noticeList = noticeService.selectNoticeList(pInfo);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pInfo", pInfo);
		return "notice/list";
	}
	
	@GetMapping("/search.do")
	public String searchNoticeList(
			@RequestParam("searchKeyword")String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1")Integer currentPage
			, Model model) {
		int totalCount = noticeService.getListCount(searchKeyword);
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<Notice>searchList = new ArrayList<Notice>();
		searchList = noticeService.searchNoticeByKeyword(pInfo, searchKeyword);
		if(!searchList.isEmpty()) {
			model.addAttribute("totalCount", totalCount);
			model.addAttribute("searchKeyword",searchKeyword);
			model.addAttribute("pInfo",pInfo);
			model.addAttribute("searchList", searchList);
			return "notice/search";
		} else {
			model.addAttribute("msg", "데이터 조회 실패");
			model.addAttribute("error", "목록조회실패");
			model.addAttribute("url", "/index.jsp");
			return "/common/error";
		}
	}
	
	@GetMapping("/serviceList.do")
	public String showServiceList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage, Model model) {
		Integer serviceTotalCount = noticeService.getServiceListCount();
		PageInfo pInfo = this.getPageInfo(currentPage, serviceTotalCount);
		List<Notice> serviceList = noticeService.selectServiceList(pInfo);
		model.addAttribute("serviceTotalCount", serviceTotalCount);
		model.addAttribute("serviceList", serviceList);
		model.addAttribute("pInfo", pInfo);
		return "notice/serviceList";
	}
	
	@GetMapping("/serviceSearch.do")
	public String searchServiceList(
			@RequestParam("searchKeyword")String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1")Integer currentPage
			, Model model) {
		int serviceTotalCount = noticeService.getServiceListCount(searchKeyword);
		PageInfo pInfo = this.getPageInfo(currentPage, serviceTotalCount);
		List<Notice>searchServiceList = new ArrayList<Notice>();
		searchServiceList = noticeService.searchServiceByKeyword(pInfo, searchKeyword);
		if(!searchServiceList.isEmpty()) {
			model.addAttribute("serviceTotalCount", serviceTotalCount);
			model.addAttribute("searchKeyword",searchKeyword);
			model.addAttribute("pInfo",pInfo);
			model.addAttribute("searchServiceList", searchServiceList);
			return "notice/serviceSearch";
		} else {
			model.addAttribute("msg", "데이터 조회 실패");
			model.addAttribute("error", "목록조회실패");
			model.addAttribute("url", "/index.jsp");
			return "/common/error";
		}
	}
	
	@GetMapping("/updateList.do")
	public String showUpdateList(@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage, Model model) {
		Integer updateTotalCount = noticeService.getUpdateListCount();
		PageInfo pInfo = this.getPageInfo(currentPage, updateTotalCount);
		List<Notice> updateList = noticeService.selectUpdateList(pInfo);
		model.addAttribute("updateTotalCount", updateTotalCount);
		model.addAttribute("updateList", updateList);
		model.addAttribute("pInfo", pInfo);
		return "notice/updateList";
	}
	
	@GetMapping("/updateSearch.do")
	public String searchUpdateList(
			@RequestParam("searchKeyword")String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1")Integer currentPage
			, Model model) {
		int updateTotalCount = noticeService.getUpdateListCount(searchKeyword);
		PageInfo pInfo = this.getPageInfo(currentPage, updateTotalCount);
		List<Notice>searchUpdateList = new ArrayList<Notice>();
		searchUpdateList = noticeService.searchUpdateByKeyword(pInfo, searchKeyword);
		if(!searchUpdateList.isEmpty()) {
			model.addAttribute("updateTotalCount", updateTotalCount);
			model.addAttribute("searchKeyword",searchKeyword);
			model.addAttribute("pInfo",pInfo);
			model.addAttribute("searchUpdateList", searchUpdateList);
			return "notice/updateSearch";
		} else {
			model.addAttribute("msg", "데이터 조회 실패");
			model.addAttribute("error", "목록조회실패");
			model.addAttribute("url", "/index.jsp");
			return "/common/error";
		}
	}

}
