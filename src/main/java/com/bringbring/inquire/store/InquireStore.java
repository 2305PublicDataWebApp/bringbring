package com.bringbring.inquire.store;

import com.bringbring.common.PageInfo;
import com.bringbring.image.domain.Image;
import com.bringbring.inquire.domain.Inquire;
import com.bringbring.inquire.domain.InquireDetail;
import com.bringbring.inquire.domain.InquireDetails;
import com.bringbring.inquire.domain.InquireUpdate;

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

    /**
     * 회원 번호로 리스트 불러오기 store
     * @param userNo
     * @return int
     */
    int getListCountByNo(int userNo);

    /**
     * 회원 번호로 문의내역 리스트 불러오기(페이징) store
     * @param pInfo
     * @param userNo
     * @return
     */
    List<Inquire> selectPageInquireListByNo(PageInfo pInfo, int userNo);

    /**
     * 문의글 insert store
     * @param inquire
     * @return
     */
    int insertInquire(Inquire inquire);

    /**
     * 문의글 가장 최근번호 찾기 store
     * @return
     */
    int selectMaxNo();

    /**
     * 문의글 이미지 insert store
     * @param image
     */
    int insertImage(Image image);

    /**
     * 문의글 상세보기 정보 불러오기 store
     * @param inqNo
     * @return
     */
    InquireDetail selectInquireDetailByNo(int inqNo);

    /**
     * 문의글 사진 불러오기 store
     * @param inqNo
     * @return
     */
    List<Image> selectImageList(int inqNo);

    /**
     * 문의글 상세정보 불러오기(수정용) store
     * @param inqNo
     * @return
     */
    InquireUpdate selectInquireUpdate(int inqNo);

    /**
     * 문의글 상세정보 수정 store
     * @param inquire
     * @return
     */
    int updateInquire(Inquire inquire);

    /**
     * 문의글 기존 사진 삭제 store
     * @param imageNo
     * @return
     */
    int deleteImage(int imageNo);

    /**
     * 문의글 삭제 store
     * @param inqNo
     * @return
     */
    int deleteInquire(int inqNo);
}
