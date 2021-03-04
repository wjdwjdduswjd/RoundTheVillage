package com.kh.RoundTheVillage.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.board.model.vo.Attachment;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;


public interface BoardService {

	/** 페이징 처리 객체 생성 
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo getPageInfo(int cp);

	/** 게시글 목록 조회
	 * @param pInfo
	 * @return bList
	 */ 
	public abstract List<Board> selectList(PageInfo pInfo);

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

	public abstract Attachment insertImage(MultipartFile uploadFile, String savePath);

	public abstract List<Board> selectClass(int memberNo);






}
