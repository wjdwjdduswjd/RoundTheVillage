package com.kh.RoundTheVillage.CScenter.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.CScenter.model.vo.Attachment;
import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;


public interface NoticeService {
	
	/** 페이징 처리 객체 생성 Service
	 * @param type
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo2 getPageInfo(int cp);
	
	
	/** 게시글 목록 조회 Service
	 * @param pInfo
	 * @return bList
	 */
	public abstract List<Notice> selectList(PageInfo2 pInfo);


	/** 게시글 상세 조회 Service
	 * @param boardNo
	 * @param type 
	 * @return board
	 */
	public abstract Notice selectNotice(int noticeNo);
	
	
	/** 게시글에 포함된 이미지 목록 조회 Service
	 * @param boardNo
	 * @return attachmentList
	 */
	public abstract List<Attachment> selectAttachmentList(int noticeNo);
	
	
	/** 게시글 삽입 (+파일 업로드) Service
	 * @param map
	 * @param savePath 
	 * @return result
	 */
	public abstract int insertNotice(Map<String, Object> map, String savePath);
	
	
	/** summernote 업로드 이미지 저장 Service
	 * @param uploadFile
	 * @param savePath
	 * @return at
	 */
	public abstract Attachment insertImage(MultipartFile uploadFile, String savePath);


	/** 게시글 수정 Service
	 * @param updateNotice
	 * @return result
	 */
	//public abstract int updateNotice(Notice updateNotice);
}
