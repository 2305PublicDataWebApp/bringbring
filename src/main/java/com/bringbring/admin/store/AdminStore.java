package com.bringbring.admin.store;

import com.bringbring.admin.domain.Admin;
import com.bringbring.admin.domain.AdminDetails;
import com.bringbring.admin.domain.Role;
import com.bringbring.common.PageInfo;
import com.bringbring.report.domain.ReportDetails;
import com.bringbring.reservation.domain.Reservation;
import com.bringbring.reservation.domain.ReservationAdmin;
import com.bringbring.user.domain.User;

import java.util.List;
import java.util.Map;

public interface AdminStore {

    /**
     * 관리자 추가 store
     * @param admin
     * @return int
     */
    int insertAdmin(Admin admin);

    /**
     * 관리자 수 조회 store
     * @return int
     */
    int selectListCount();

    /**
     * 관리자 리스트 조회 store
     * @param pInfo
     * @return List<Admin>
     */
    List<AdminDetails> selectAdminDetailsList(PageInfo pInfo);

    /**
     * 권한 추가 store
     * @param
     * @return int
     */
    int insertRole();

    /**
     * 권한 수정 store
     * @param userNo
     * @return
     */
    int updateRole(int userNo);

    /**
     * 유저 넘버로 권한 조회 store
     * @param userNo
     * @return Role
     */
    Role selectRoleByNo(int userNo);

    /**
     * 탈퇴한 유저 수 조회 store
     * @return int
     */
    int selectDeletedUserCount();

    /**
     * 관리자 중복 체크 store
     * @param userNo
     * @return int
     */
    int countAlreadyAdmin(int userNo);

    /**
     * 조건에 따라 키워드 수 검색 store (유저)
     * @param paramMap
     * @return int
     */
    int getListCount(Map<String, String> paramMap);

    /**
     * 조건에 따라 키워드로 유저 검색 Store
     * @param pageInfo
     * @param paramMap
     * @return List<User>
     */
    List<User> searchUserByKeyword(PageInfo pageInfo, Map<String, String> paramMap);

    /**
     * 조건에 따라 키워드 수 검색 store (관리자)
     * @param paramMap
     * @return
     */
    int getListAdminCount(Map<String, String> paramMap);

    /**
     * 조건에 따라 키워드로 관리자 검색 Store
     * @param pInfo
     * @param paramMap
     * @return
     */
    List<AdminDetails> searchAdminByKeyword(PageInfo pInfo, Map<String, String> paramMap);

    /**
     * 관리자 해임 store
     * @param adminDetails
     * @return int
     */
    int deleteAdmin(AdminDetails adminDetails);

    /**
     * 롤 관리자 권한 박탈 store
     * @param userNo
     * @return int
     */
    int updateRoleDownGrade(int userNo);

    /**
     * 유저 회원 탈퇴 store
     * @param user
     * @return int
     */
    int deleteUser(User user);

    /**
     * 유저 권한 삭제 store
     * @param userNo
     * @return int
     */
    int deleteRole(int userNo);

    /**
     * 예약 건 수 조회 store
     * @return
     */
    int selectListResCount();

    /**
     *  예약 완료된 갯수 조회 store
     * @return
     */
    int selectListCountByCompletionY();

    /**
     * 예약 접수된 갯수 조회 store
     * @return
     */
    int selectListCountByCompletionN();

    /**
     * 예약 리스트 조회 store
     * @param pInfo
     * @return
     */
    List<ReservationAdmin> selectReservationList(PageInfo pInfo);

    /**
     * 예약 상세조회 store
     * @param rvNo
     * @return
     */
    List<ReservationAdmin> selectReservationDetail(Integer rvNo);

    /**
     * 예약 처리 store
     * @param rvNo
     * @return int
     */
    int updateReservation(Integer rvNo);

    /**
     * 유저 번호로 관리자 조회 store
     * @param userNo
     * @return
     */
    Admin selectAdminByNo(int userNo);

    /**
     * 관핧 지역 예약 조회 store
     * @param pInfo
     * @return
     */
    List<ReservationAdmin> selectReservationListByNo(Integer regionNo, PageInfo pInfo);

    /**
     * 관할 지역 예약 수 조회 store
     * @param regionNo
     * @return
     */
    int selectListResCountByNo(Integer regionNo);

    /**
     * 관할 지역 예약 완료 수 조회 store
     * @param regionNo
     * @return
     */
    int selectListCountByCompletionYByNo(Integer regionNo);

    /**
     * 관할 지역 신청 접수 수 조회 store
     * @param regionNo
     * @return
     */
    int selectListCountByCompletionNByNo(Integer regionNo);

    /**
     * 검색된 예약 갯수 조회 Store
     * @param paramMap
     * @return
     */
    int searchResListCount(Map<String, String> paramMap);

    /**
     * 검색된 예약 리스트 조회 Store
     * @param pInfo
     * @param paramMap
     * @return
     */
    List<ReservationAdmin> searchResByKeyword(PageInfo pInfo, Map<String, String> paramMap);

    /**
     * 지역별 검색된 예약 갯수 조회 store
     * @param paramMap
     * @return
     */
    int searchResLocalListCount(Map<String, String> paramMap);

    /**
     * 지역별 검색된 예약 리스트 조회 store
     * @param pInfo
     * @param paramMap
     * @return
     */
    List<ReservationAdmin> searchResLocalByKeyword(PageInfo pInfo, Map<String, String> paramMap);
}
