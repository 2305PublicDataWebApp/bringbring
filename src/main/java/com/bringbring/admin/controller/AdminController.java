package com.bringbring.admin.controller;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.admin.service.AdminService;
import com.bringbring.common.PageInfo;
import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.domain.InquireDetails;
import com.bringbring.inquire.service.InquireService;
import com.bringbring.region.domain.City;
import com.bringbring.region.domain.Region;
import com.bringbring.region.service.RegionService;
import com.bringbring.report.domain.ReportDetails;
import com.bringbring.report.service.ReportService;
import com.bringbring.reservation.domain.Reservation;
import com.bringbring.reservation.domain.ReservationAdmin;
import com.bringbring.reservation.service.ReservationService;
import com.bringbring.user.domain.User;
import com.bringbring.user.service.UserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/admin")
@RequiredArgsConstructor
public class AdminController {

	private final UserService userService;
	private final RegionService regionService;
	private final AdminService adminService;
	private final ReportService reportService;
	private final InquireService inquireService;
	private final ReservationService reservationService;

// 문의 관리
	@GetMapping("/contactList.do")
	public String contactListManagement(Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, HttpSession session) {
		int checkAdmin = (int) session.getAttribute("sessionUserGrade");
		if (checkAdmin >= 2) {
			int inquireCount = inquireService.selectInqListCount();
			PageInfo pInfo = this.getPageInfo(currentPage, inquireCount);
			List<InquireDetails> inqList = inquireService.selectInquireList(pInfo);
			List<City> cList = regionService.selectCityList();
			model.addAttribute("inqList", inqList)
					.addAttribute("pInfo", pInfo)
					.addAttribute("inquireCount", inquireCount)
					.addAttribute("cList", cList);
			return "/admin/contactManagement";
		} else {
			model.addAttribute("msg", "최고 관리자만 조회 가능한 페이지 입니다.")
					.addAttribute("url", "/index.jsp");
			return "common/error";
		}
	}

	// 관할지역 예약조회
	@GetMapping("/localM.do")
	public String showLocalReservationManagement(Model model) {
		return "admin/localReservationManagement";
	}

// 회원 관리

	//회원 리스트
	@GetMapping("/memberList.do")
	public String userListManagement(Model model
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, HttpSession session) {
		int checkAdmin = (int) session.getAttribute("sessionUserGrade");
		if (checkAdmin == 3) {
			int userCount = userService.selectListCount();
			int adminCount = adminService.selectListCount();
			int deleteUserCount = adminService.selectDeletedUserCount();
			PageInfo pInfo = this.getPageInfo(currentPage, userCount);
			List<User> userList = userService.selectUserList(pInfo);
			List<City> cList = regionService.selectCityList();
			model.addAttribute("userList", userList)
					.addAttribute("pInfo", pInfo)
					.addAttribute("userCount", userCount)
					.addAttribute("adminCount", adminCount)
					.addAttribute("cList", cList)
					.addAttribute("deletedUser", deleteUserCount);

			return "/admin/memberManagement";
		} else {
			model.addAttribute("msg", "최고 관리자만 조회 가능한 페이지 입니다.")
					.addAttribute("url", "/index.jsp");
			return "common/error";
		}
	}


	//지역 리스트
	@PostMapping("/selectRegion.do")
	public ResponseEntity<List<Region>> selectRegionList(@RequestParam("cityNo") int cityNo) {
		List<Region> regionList = regionService.selectRegionList(cityNo);
		System.out.println("Received cityNo: " + cityNo);
		// 반환할 데이터가 있는 경우 ResponseEntity로 JSON 형식으로 반환
		if (!regionList.isEmpty()) {
			System.out.println("regionList = " + regionList);
			return ResponseEntity.ok(regionList);

		} else {
			// 데이터가 없는 경우 404 Not Found 상태 코드 반환
			return ResponseEntity.notFound().build();
		}
	}

	//관리자 임명
	@PostMapping("/insertAdmin.do")
	public String insertAdmin(Model model
			, @ModelAttribute Admin admin){
		int checkAdmin = adminService.countAlreadyAdmin(admin.getUserNo());
		System.out.println("관리자번호" + checkAdmin);
		if (checkAdmin > 0) {
			model.addAttribute("msg", "이미 관리자입니다.")
					.addAttribute("url", "/admin/memberList.do");
			return "common/error";
		} else {
			int result = adminService.insertAdmin(admin);
			if (result > 0) {
				model.addAttribute("msg", "관리자 임명 완료")
						.addAttribute("url", "/admin/memberList.do");
				return "common/error";
			} else {
				model.addAttribute("msg", "관리자 임명 실패")
						.addAttribute("url", "/admin/memberList.do");
				return "common/error";
			}
		}
	}

	//회원 검색
	@GetMapping("/searchUser.do")
	public String showUserSearch(Model model
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @ModelAttribute User user
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, HttpSession session){

		int checkAdmin = (int)session.getAttribute("sessionUserGrade");
		if(checkAdmin == 3) {
			int userCount = userService.selectListCount();
			int adminCount = adminService.selectListCount();
			int deleteUserCount = adminService.selectDeletedUserCount();
			List<City> cList = regionService.selectCityList();
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("searchCondition", searchCondition);
			paramMap.put("searchKeyword", searchKeyword);
			int totalCount = adminService.getListCount(paramMap);
			PageInfo pageInfo = this.getPageInfo(currentPage, totalCount);
			List<User> searchList = adminService.searchUserByKeyword(pageInfo, paramMap);

			if (!searchList.isEmpty()) {
				model.addAttribute("searchCondition", searchCondition)
						.addAttribute("searchKeyword", searchKeyword)
						.addAttribute("pageInfo", pageInfo)
						.addAttribute("searchList", searchList)
						.addAttribute("userCount", userCount).addAttribute("adminCount", adminCount)
						.addAttribute("cList", cList).addAttribute("deletedUser", deleteUserCount);
				return "admin/memberManagementSearch";
			} else {
				model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.")
						.addAttribute("url", "/admin/memberList.do");
				return "common/error";
			}
		} else {
			model.addAttribute("msg", "최고 관리자만 조회 가능한 페이지 입니다.")
					.addAttribute("url", "/index.jsp");
			return "common/error";
		}
	}

	//회원 탈퇴
	@PostMapping("/userDelete.do")
	@ResponseBody
	public String userDelete(Model model
			, @ModelAttribute User user) {
		int result = adminService.deleteUser(user);
		if(result>0) {
			return "success";
		} else {
			return "fail";
		}
	}

	//관리자 리스트
	@GetMapping("/adminList.do")
	public String adminListManagement(Model model
			,@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			,HttpSession session) {
		int checkAdmin = (int)session.getAttribute("sessionUserGrade");
		if(checkAdmin == 3) {
			int adminCount = adminService.selectListCount();
			int userCount = userService.selectListCount();
			int deleteUserCount = adminService.selectDeletedUserCount();
			PageInfo pInfo = this.getPageInfo(currentPage, adminCount);
			List<AdminDetails> adminList = adminService.selectAdminDetailsList(pInfo);
			model.addAttribute("adminList", adminList).addAttribute("pInfo", pInfo);
			model.addAttribute("adminCount", adminCount).addAttribute("userCount", userCount).addAttribute("deletedUser", deleteUserCount);
			return "admin/adminManagement";
		} else {
			model.addAttribute("msg", "최고 관리자만 조회 가능한 페이지 입니다.")
					.addAttribute("url", "/index.jsp");
			return "common/error";
		}
	}

	// 관리자 검색
	@GetMapping("/searchAdmin.do")
	public String showAdminSearch(Model model
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, HttpSession session){

		int checkAdmin = (int)session.getAttribute("sessionUserGrade");
		if(checkAdmin == 3) {
			int adminCount = adminService.selectListCount();
			int userCount = userService.selectListCount();
			int deleteUserCount = adminService.selectDeletedUserCount();
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("searchCondition", searchCondition);
			paramMap.put("searchKeyword", searchKeyword);
			int totalCount = adminService.getListAdminCount(paramMap);
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<AdminDetails> searchList = adminService.searchAdminByKeyword(pInfo, paramMap);

			if (!searchList.isEmpty()) {
				model.addAttribute("searchCondition", searchCondition)
						.addAttribute("searchKeyword", searchKeyword)
						.addAttribute("pInfo", pInfo)
						.addAttribute("searchList", searchList)
						.addAttribute("userCount", userCount).addAttribute("adminCount", adminCount)
						.addAttribute("deletedUser", deleteUserCount);
						return "admin/adminManagementSearch";
			} else {
				model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.")
						.addAttribute("url", "/admin/adminList.do");
				return "common/error";
			}
		} else {
			model.addAttribute("msg", "최고 관리자만 조회 가능한 페이지 입니다.")
					.addAttribute("url", "/index.jsp");
			return "common/error";
		}
	}

	//관리자 해임
	@PostMapping("/adminDelete.do")
	@ResponseBody
	public String adminDelete(Model model
			, @ModelAttribute AdminDetails adminDetails) {
		int result = adminService.deleteAdmin(adminDetails);
		System.out.println(adminDetails.getUserNo());
		if(result>0) {
			return "success";
		} else {
			return "fail";
		}
	}

//	신고 관리
	@GetMapping("/reportList.do")
	public String showReportManagement(Model model
			,@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			,HttpSession session) {
		int checkAdmin = (int)session.getAttribute("sessionUserGrade");
		if(checkAdmin >= 2) {
			int reportCount = reportService.selectReportCount();
			int deleteCount = reportService.slectDeleteRepCount();
			PageInfo pInfo = this.getPageInfo(currentPage, reportCount);
			List<ReportDetails> reportDetailsList = reportService.selectReportList(pInfo);

			Map<String, String> categoryMap = new HashMap<>();
			categoryMap.put("fraud", "사기 글이에요");
			categoryMap.put("unpleasant", "회원들에게 불쾌감을 주는 글이에요");
			categoryMap.put("inappropriate", "부적절한 회원이에요");
			categoryMap.put("other", "기타 다른 사유가 있어요");

			for (ReportDetails report : reportDetailsList) {
				String category = report.getRepCategory();
				String categoryDescription = categoryMap.get(category);
				report.setRepCategory(categoryDescription);
			}

			model.addAttribute("reportCount", reportCount).addAttribute("pInfo", pInfo).addAttribute("reportList", reportDetailsList)
					.addAttribute("deleteCount", deleteCount);
			return "admin/reportManagement";
		} else {
			model.addAttribute("msg", "관리자만 조회 가능한 페이지 입니다.")
					.addAttribute("url", "/index.jsp");
			return "common/error";
		}
	}

	//신고 게시글 검색
	@GetMapping("/searchReport.do")
	public String showReportSearch(Model model
			, @RequestParam("searchCondition") String searchCondition
			, @RequestParam("searchKeyword") String searchKeyword
			, @RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			, HttpSession session){

		int checkAdmin = (int)session.getAttribute("sessionUserGrade");
		if(checkAdmin >= 2) {
			int reportCount = reportService.selectReportCount();
			int deleteCount = reportService.slectDeleteRepCount();
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("searchCondition", searchCondition);
			paramMap.put("searchKeyword", searchKeyword);
			int totalCount = reportService.getListReportCount(paramMap);
			PageInfo pInfo = this.getPageInfo(currentPage, totalCount);
			List<ReportDetails> reportDetailsList = reportService.searchReportByKeyword(pInfo, paramMap);

			Map<String, String> categoryMap = new HashMap<>();
			categoryMap.put("fraud", "사기 글이에요");
			categoryMap.put("unpleasant", "회원들에게 불쾌감을 주는 글이에요");
			categoryMap.put("inappropriate", "부적절한 회원이에요");
			categoryMap.put("other", "기타 다른 사유가 있어요");

			for (ReportDetails report : reportDetailsList) {
				String category = report.getRepCategory();
				String categoryDescription = categoryMap.get(category);
				report.setRepCategory(categoryDescription);
			}

			if (!reportDetailsList.isEmpty()) {
				model.addAttribute("searchCondition", searchCondition)
						.addAttribute("searchKeyword", searchKeyword)
						.addAttribute("pInfo", pInfo)
						.addAttribute("reportList", reportDetailsList)
						.addAttribute("reportCount", reportCount)
						.addAttribute("deleteCount", deleteCount);
				return "admin/reportManagementSearch";
			} else {
				model.addAttribute("msg", "데이터 조회가 완료되지 않았습니다.")
						.addAttribute("url", "/admin/reportList.do");
				return "common/error";
			}
		} else {
			model.addAttribute("msg", "최고 관리자만 조회 가능한 페이지 입니다.")
					.addAttribute("url", "/index.jsp");
			return "common/error";
		}
	}

	//신고 게시글 삭제
	@PostMapping("/divideDelete.do")
	@ResponseBody
	public String divideDelete(Model model
			, @ModelAttribute ReportDetails reportDetails) {
		int result = reportService.deleteDivide(reportDetails);
		System.out.println(reportDetails.getDivNo());
		if(result>0) {
			return "success";
		} else {
			return "fail";
		}
	}

	
//	예약 상세 조회
	@GetMapping("/rDetail.do")
	public ModelAndView showReservationDetail(ModelAndView mv) {
		mv.setViewName("admin/reservationDetail");
		return mv;
	}

//	예약 조회
	@GetMapping("/reservationList.do")
	public String showReservationManagement(Model model
			,@RequestParam(value="page", required=false, defaultValue="1") Integer currentPage
			,HttpSession session) {
		int checkAdmin = (int)session.getAttribute("sessionUserGrade");
		if(checkAdmin >= 2) {
			// 배출 예약 건수
			// 접수된 건수(신청)
			// 완료된 건(완료)
			int resCount = adminService.selectListResCount();
			int resCountByCompletionY = adminService.selectListCountByCompletionY();
			int resCountByCompletionN = adminService.selectListCountByCompletionN();
			PageInfo pInfo = this.getPageInfo(currentPage, resCount);
			List<ReservationAdmin> reservationList = adminService.selectReservationList(pInfo);
			model.addAttribute("resList", reservationList).addAttribute("pInfo", pInfo);
			model.addAttribute("resCount", resCount).addAttribute("resCountY", resCountByCompletionY).addAttribute("resCountX", resCountByCompletionN);
			return "admin/reservationManagement";
		} else {
			model.addAttribute("msg", "최고 관리자만 조회 가능한 페이지 입니다.")
					.addAttribute("url", "/index.jsp");
			return "common/error";
		}
	}

	@GetMapping("/test.do")
	public String test(Model model) {
		return "admin/test";
	}

	public PageInfo getPageInfo(Integer currentPage, Integer totalCount) {
		int recordCountPerPage = 10;
		int naviCountPerPage =10;
		int naviTotalCount;

		naviTotalCount = (int)Math.ceil((double)totalCount/recordCountPerPage);
		int startNavi = ((int)((double)currentPage/naviCountPerPage+0.9)-1) * naviCountPerPage+1;
		int endNavi = startNavi + naviCountPerPage -1;
		if(endNavi>naviTotalCount) {
			endNavi=naviTotalCount;
		}
        return new PageInfo(currentPage, totalCount, naviTotalCount, recordCountPerPage, naviCountPerPage, startNavi, endNavi);
	}

}

