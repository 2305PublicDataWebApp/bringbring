package com.bringbring.inquire.service;

import com.bringbring.common.PageInfo;
import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.domain.InquireDetails;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

public interface InquireService {

    /**
     * 문의굴 갯수 조회 service
     * @return int
     */
    int selectInqListCount();

    /**
     * 문의굴 리스트 조회 service
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
     * @param inquireDetails
     * @return  List<InquireDetails>
     */
    List<InquireDetails> selectInquireByCityNo(InquireDetails inquireDetails, PageInfo pageInfo);

    /**
     * 답변 여부 글 수 조회 service
     * @return int
     */
    int selectInquireCount(char answerYn);

    /**
     * 지역별 글 수 조회 service
     * @return int
     */
    int selectInquireCountByCity(int cityNo);

    /**
     * 키워드로 문의글 검색 service
     * @param pInfo
     * @param paramMap
     * @return List<InquireDetails>
     */
    List<InquireDetails> searchInquireByKeyword(PageInfo pInfo, Map<String, String> paramMap);

    /**
     * 키워드 문의글 갯수 검색 service
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
	  * @param userNo
	  * @return Inquire
	  */
	  List<Inquire> selectInquireListByUserNo(int userNo);

