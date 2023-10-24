package com.bringbring.inquire.service;

import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.domain.InquireDetail;
import com.bringbring.inquire.domain.InquireDetails;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface InquireService {

    /**
     * 문의굴 갯수 조회 service
     *
     * @return int
     */
    int selectInqListCount();

    /**
     * 문의굴 리스트 조회 service
     *
     * @param pInfo
     * @return List<Inquire>
     */
    List<InquireDetails> selectInquireList(PageInfo pInfo);

    /**
     * 답변이 여부 글 조회 service
     *
     * @param inquireDetails
     * @param pInfo
     * @return List<InquireDetails>
     */
    List<InquireDetails> selectInquiriesByAnswer(InquireDetails inquireDetails, PageInfo pInfo);

    /**
     * 지역별 문의 리스트 조회 service
     *
     * @param inquireDetails
     * @return List<InquireDetails>
     */
    List<InquireDetails> selectInquireByCityNo(InquireDetails inquireDetails, PageInfo pageInfo);

    /**
     * 답변 여부 글 수 조회 service
     *
     * @return int
     */
    int selectInquireCount(char answerYn);

    /**
     * 지역별 글 수 조회 service
     *
     * @return int
     */
    int selectInquireCountByCity(int cityNo);

    /**
     * 키워드로 문의글 검색 service
     *
     * @param pInfo
     * @param paramMap
     * @return List<InquireDetails>
     */
    List<InquireDetails> searchInquireByKeyword(PageInfo pInfo, Map<String, String> paramMap);

    /**
     * 키워드 문의글 갯수 검색 service
     *
     * @param paramMap
     * @return
     */
    int searchInqListCount(Map<String, String> paramMap);

    /**
     * 문의 등록 service
     * @param inquire
     * @param uploadFiles
     * @param request
     * @return
     */
//    int insertInquire(Inquire inquire, MultipartFile[] uploadFiles, HttpServletRequest request);

    /**
     * 회원별 문의내역 리스트 service
     *
     * @param userNo
     * @return Inquire
     */
    List<Inquire> selectInquireListByUserNo(int userNo);

    PageInfo getPageInfo(Integer currentPage, int totalCount);

    /**
     * 회원 별 문의 리스트 개수 service
     * @param userNo
     * @return
     */
    int getListCountByNo(int userNo);

    /**
     * 회원 별 문의 내역 리스트
     * @param pInfo
     * @param userNo
     * @return
     */
    List<Inquire> selectPageInquireListByNo(PageInfo pInfo, int userNo);

    /**
     * 문의 게시판 insert service
     * @param inquire
     * @param uploadFiles
     * @param request
     * @return
     */
    int insertInquire(Inquire inquire, MultipartFile[] uploadFiles, HttpServletRequest request);

    /**
     * 문의 게시판 상세보기 정보 불러오기 service
     * @param inqNo
     * @return
     */
    InquireDetail selectInquireDetailByNo(int inqNo);

    /**
     * 한 문의글 당 사진 리스트 불러오기
     * @param inqNo
     * @return
     */
    List<Image> selectImageList(int inqNo);
}

