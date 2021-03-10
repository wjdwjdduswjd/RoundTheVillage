package com.kh.RoundTheVillage.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.CScenter.model.vo.NoticeAttachment;
import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;
import com.kh.RoundTheVillage.board.model.vo.Search;
import com.kh.RoundTheVillage.member.model.vo.Member;
import com.kh.RoundTheVillage.shop.model.vo.Shop;


public interface MemberInquiryService {
	
	/** 페이징 처리 객체 생성 Service
	 * @param type
	 * @param cp
	 * @return pInfo
	 */
	public abstract PageInfo2 getPageInfo(int cp);
	
	
	/** 일반 목록 조회 Service
	 * @param pInfo
	 * @return bList
	 */
	public abstract List<Member> selectNormalList(PageInfo2 pInfo);


	/** 공방 목록 조회 Service
	 * @param pInfo
	 * @return 
	 */
	public abstract List<Shop> selectCraftList(PageInfo2 pInfo);
	
	
	/** 검색어 포함 일반 회원수 조회 Service
	 * @param search
	 * @param cp
	 * @return listCount
	 */
	public abstract PageInfo2 selectSearchListCount(Search search, int cp);

	
	/** 검색어 포함 일반 회원 목록 조회 Service
	 * @param pInfo
	 * @param search
	 * @return bList
	 */
	public abstract List<Member> selectSearchList(PageInfo2 pInfo, Search search);
	
	
	
	
	/** 검색어 포함 공방 회원수 조회 Service
	 * @param search
	 * @param cp
	 * @return listCount
	 */
	public abstract PageInfo2 selectSearchCraftCount(Search search, int cp);

	
	/** 검색어 포함 공방 회원 목록 조회 Service
	 * @param pInfo
	 * @param search
	 * @return bList
	 */
	public abstract List<Shop> selectSearchCraft(PageInfo2 pInfo, Search search);


	public abstract int updateMemberStatus(Map<String, Object> map);


	public abstract int updateCraftStatus(Map<String, Object> map);
	

}
