package com.kh.RoundTheVillage.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.board.model.vo.Attachment;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.board.model.vo.Search;


public interface BoardService {

	/** 페이징 처리 객체 생성 
	 * @param cp
	 * @param ct 
	 * @return pInfo
	 */
	public abstract PageInfo getPageInfo(int cp, String ct);

	/** 게시글 목록 조회
	 * @param pInfo
	 * @param ct 
	 * @return bList
	 */ 
	public abstract List<Board> selectList(PageInfo pInfo, String ct);

	/** 썸네일 목록 조회
	 * @param bList
	 * @return thList
	 */
	public abstract List<Attachment> selectThumbnailList(List<Board> bList);

	/** 게시글 상세 조회
	 * @param boardNo
	 * @return 
	 */
	public abstract Board selectBoard(int boardNo);
	
	/** 게시글에 포함된 이미지 목록 조회 Service
	 * @param boardNo
	 * @return attachmentList
	 */
	public abstract List<Attachment> selectAttachmentList(int boardNo);
	
	public abstract int insertBoard(Map<String, Object> map, List<MultipartFile> images, String savePath);

	/** 게시글 수정 Service
	 * @param updateBoard
	 * @param images
	 * @param savePath
	 * @return result
	 */
	public abstract int updateBoard(Board updateBoard, List<MultipartFile> images, String savePath);
	
	public abstract Attachment insertImage(MultipartFile uploadFile, String savePath);

	public abstract List<Board> selectClass(int memberNo);

	/** 좋아요 여부 확인 Service
	 * @param map
	 * @return likeFl
	 */
	public abstract int selectLikeFl(Map<String, Integer> map);

	/** 좋아요 삽입 Service
	 * @param map
	 * @return result
	 */
	public abstract int insertLike(Map<String, Integer> map);

	/** 좋아요 삭제 Service
	 * @param map
	 * @return result
	 */
	public abstract int deleteLike(Map<String, Integer> map);

	/** 좋아요 카운트 Service
	 * @param boardNo
	 * @return count
	 */
	public abstract int selectLikeCount(int boardNo);

	/** 게시글 신고 중복검사
	 * @param map
	 * @return findReport
	 */
	public abstract int findReport(Map<String, Object> map);
	
	
	/** 게시글 신고 Service
	 * @param map
	 * @return result
	 */
	public abstract int reportBoard(Map<String, Object> map);

	/** 검색어 포함 게시글 개수 조회 Service
	 * @param search
	 * @param cp
	 * @return listCount
	 */
	public abstract PageInfo selectSearchListCount(Search search, int cp);

	/** 검색어 포함 게시글 목록 조회 Service
	 * @param pInfo
	 * @param search
	 * @return bList
	 */
	public abstract List<Board> selectSearchList(PageInfo pInfo, Search search);

	public abstract int deleteBoard(int boardNo);

	public abstract PageInfo getPageInfo(int cp);


	


	




}
