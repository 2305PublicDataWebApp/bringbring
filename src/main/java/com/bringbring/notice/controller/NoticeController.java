package com.bringbring.notice.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.service.AdminService;
import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.notice.domain.Notice;
import com.bringbring.notice.service.NoticeService;
import com.google.gson.JsonObject;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
public class NoticeController {

	private final NoticeService noticeService;
	private final AdminService adminService;
	

	@GetMapping("/insert.do")
	public String showNoticeInsert() {
		return "notice/insert";
	}



	/*
	 * @PostMapping("/insert.do") public String insertNotice(@ModelAttribute Notice
	 * notice, @ModelAttribute Image image,
	 * 
	 * @RequestParam(value = "uploadFile", required = false) MultipartFile
	 * uploadFile, HttpSession session, HttpServletRequest request, Model model) {
	 * Integer adminNo = (Integer) session.getAttribute("adminNo"); if (adminNo !=
	 * null && adminNo!=0) { // adminService를 사용하여 adminNo를 기반으로 관리자 정보를 데이터베이스에서 조회
	 * Admin admin = adminService.selectOneByNo(adminNo); // 관리자 정보를 Notice 객체의
	 * admin 속성에 설정 notice.setAdminNo(admin.getAdminNo()); if(uploadFile != null &&
	 * !uploadFile.getOriginalFilename().equals("")) { Map<String, Object> imgMap =
	 * this.saveFile(request, uploadFile);
	 * image.setImageName((String)imgMap.get("imageName"));
	 * image.setImageRename((String)imgMap.get("imageRename"));
	 * image.setImagePath((String)imgMap.get("imagePath")); } int result =
	 * noticeService.insertNotice(notice, uploadFile, request); if (result > 0) {
	 * return "redirect:/notice/list.do"; } return "redirect:/notice/list.do"; }
	 * else { model.addAttribute("msg", "로그인 후 이용 가능"); model.addAttribute("error",
	 * "등록 권한 없음"); model.addAttribute("url", "/notice/list.do"); return
	 * "common/error"; } }
	 */
	 
	 

	private Map<String, Object> saveFile(HttpServletRequest request, MultipartFile uploadFile) throws Exception{
		Map<String, Object> imgMap = new HashMap<String, Object>();
		// resources 경로 구하기
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 파일 저장경로
		String savePath = root + "\\assets\\img\\nUploadFiles";
		// 파일 이름
		String imageName = uploadFile.getOriginalFilename();
		// 파일 확장자
		String extension = imageName.substring(imageName.lastIndexOf(".")+1);
		// 파일리네임
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String imageRename = sdf.format(new Date(System.currentTimeMillis()))+"."+extension;
		// 폴더 만들기
		File saveFolder = new File(savePath);
		if(!saveFolder.exists()) {
			saveFolder.mkdir();
		}
		// 파일 저장
		File saveFile = new File(savePath+"\\"+imageRename);
		uploadFile.transferTo(saveFile);
		// 파일 정보 리턴
		imgMap.put("imageName", imageName);
		imgMap.put("imageRename", imageRename);
		imgMap.put("imagePath", "../resources/assets/img/nUploadFiles/"+imageRename);
		
		return imgMap;
	}



	@GetMapping("/detail.do") 
	public String showNoticeDetail(@RequestParam("noticeNo") Integer noticeNo, Model model) {
		Notice selectOne = noticeService.selectNoticeByNo(noticeNo);
		model.addAttribute("notice", selectOne);
		return "notice/detail";
	}

	@GetMapping("/delete.do")
	public String deleteNotice(Model model, @ModelAttribute Notice notice, HttpSession session) {
		Integer adminNo = (Integer) session.getAttribute("adminNo");
		adminNo = notice.getAdminNo();
		if (adminNo != null) {
			int result = noticeService.deleteNotice(notice);
			if (result > 0) {
				return "redirect:/notice/list.do";
			} else {
				model.addAttribute("msg", "게시글 삭제에 실패하였습니다.");
				model.addAttribute("error", "게시글 삭제 실패");
				model.addAttribute("url", "/notice/list.do");
			}
		}
		return "common/error";
	}

	@GetMapping("/update.do")
	public String showNoticeUpdate(@RequestParam("noticeNo") Integer noticeNo, @ModelAttribute Notice notice,
			Model model) {
		notice = noticeService.selectNoticeByNo(noticeNo);
		model.addAttribute("notice", notice);
		return "notice/update";
	}

	@PostMapping("/update.do")
	public String updateNotice(@ModelAttribute Notice notice, @ModelAttribute Image image,
			@RequestParam(value = "uploadFile", required = false) MultipartFile uploadFile, Model model,
			HttpSession session, HttpServletRequest request) throws Exception {
		Integer adminNo = (Integer) session.getAttribute("adminNo");
		if (adminNo != null && !adminNo.equals("")) {
			if(uploadFile != null && !uploadFile.getOriginalFilename().equals("")) {
				String imageRename = image.getImageRename();
				if(imageRename != null) {
					this.deleteFile(imageRename, request); // 삭제
				}
				Map<String, Object>imgMap = this.saveFile(request, uploadFile);
            	image.setImageName((String)imgMap.get("imageName"));
            	image.setImageRename((String)imgMap.get("imageRename"));
            	image.setImagePath((String)imgMap.get("imagePath"));
			}
			int result = noticeService.updateNotice(notice, uploadFile, request);
			if (result > 0) {
				return "redirect:/notice/detail.do?noticeNo=" + notice.getNoticeNo();
			} else {
				model.addAttribute("msg", "게시글 수정에 실패하였습니다.");
				model.addAttribute("error", "게시글 수정 실패");
				model.addAttribute("url", "/notice/detail.do?noticeNo=" + notice.getNoticeNo());
				return "common/error";
			}
		} else {
			model.addAttribute("msg", "권한이 없습니다.");
			model.addAttribute("error", "게시글 수정 불가");
			model.addAttribute("url", "/notice/detail.do?noticeNo=" + notice.getNoticeNo());
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



	@GetMapping("/list.do")
	public String showNoticeList(
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer currentPage, Model model) {
		Integer totalCount = noticeService.getListCount();
		PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
		List<Notice> noticeList = noticeService.selectNoticeList(pInfo);

		model.addAttribute("noticeList", noticeList);
		model.addAttribute("pInfo", pInfo);
		return "notice/list";
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

	/*
	 * @PostMapping("/uploadSummernoteImageFile.do") public JsonObject
	 * uploadSummernoteImageFile(
	 * 
	 * @RequestParam("file") MultipartFile multipartFile, HttpServletRequest
	 * request) throws IllegalStateException, IOException { JsonObject jsonObject =
	 * new JsonObject(); // 1. 파일이름과 경로 설정 String originalFileName =
	 * multipartFile.getOriginalFilename(); String root =
	 * request.getSession().getServletContext().getRealPath("resources"); String
	 * savePath = root + "/assets/img/nUploadFiles";
	 * 
	 * //2. 파일이름이 중복되지 않도록 재정의 해준다. SimpleDateFormat sdf = new
	 * SimpleDateFormat("yyyyMMddHHmmss"); String extension =
	 * originalFileName.substring(originalFileName.lastIndexOf(".") + 1); String
	 * boardFileRename = sdf.format(new Date(System.currentTimeMillis())) + "." +
	 * extension;
	 * 
	 * //3. 저장할 경로의 폴더가 없다면 새로 만든다. File targetFile = new File(savePath);
	 * if(!targetFile.exists()) { targetFile.mkdir(); }
	 * 
	 * //4. 설정한 경로에 재정의한 이름으로 파일을 저장한다. multipartFile.transferTo(new File(savePath +
	 * "//" + boardFileRename));
	 * 
	 * //5. ajax의 success로 리턴해줄 json오브젝트에 프로퍼티를 해준다 jsonObject.addProperty("url",
	 * "../resources/assets/img/nUploadFiles/" + boardFileRename);
	 * jsonObject.addProperty("originName", originalFileName);
	 * jsonObject.addProperty("responseCode", "success"); return jsonObject;
	 * 
	 * }
	 */
}
