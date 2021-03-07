package com.kh.RoundTheVillage.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.CScenter.model.vo.NoticeAttachment;
import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;
import com.kh.RoundTheVillage.member.model.vo.Member;


public interface MemberInquiryService {
	
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
	public abstract List<Member> selectNormalList(PageInfo2 pInfo);


}
