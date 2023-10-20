package com.bringbring.inquire.store;

import com.bringbring.common.PageInfo;
import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.domain.InquireDetails;

import java.util.List;
import java.util.Map;

public interface InquireStore {

    /**
     * 문의글 갯수 조회 store
     * @return int
     */
    int selectInqListCount();
    int searchInqListCount(Map<String, String> paramMap);

    /**
     * 문의글 리스트 조회 store
     * @param pInfo
     * @return  List<InquireDetails>
     */
    List<InquireDetails> selectInquireList(PageInfo pInfo);

    /**
     * 답변여부 게시글 조회 store
     * @param inquireDetails
     * @return List<InquireDetails>
     */
    List<InquireDetails> selectInquiriesByAnswer(InquireDetails inquireDetails, PageInfo pInfo);

    /**
     * 지역별 답변 리스트 조회 store
     * @param inquireDetails
     * @return List<InquireDetails>
     */
    List<InquireDetails> selectInquireByCityNo(InquireDetails inquireDetails, PageInfo pInfo);

    /**
     * 답변여부 게시글 수 조회 store
     * @return int
     */
    int selectInquireCount(char answerYn);

    /**
     * 지역별 게시글 수 조회 store
     * @param cityNo
     * @return int
     */
    int selectInquireCountByCity(int cityNo);

    /**
     * 문의글 키워드로 검색 store
     * @param pInfo
     * @param paramMap
     * @return
     */
    List<InquireDetails> searchInquireByKeyword(PageInfo pInfo, Map<String, String> paramMap);

    /**
	  * 회원별 문의내역 리스트 store
	  * @param userNo
	  * @return Inquire
	  */
	  List<Inquire> selectInquireListByUserNo(int userNo);
}
