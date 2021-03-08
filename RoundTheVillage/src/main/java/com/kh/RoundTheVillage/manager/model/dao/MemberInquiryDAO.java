package com.kh.RoundTheVillage.manager.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.NoticeAttachment;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;
import com.kh.RoundTheVillage.board.model.vo.Search;
import com.kh.RoundTheVillage.member.model.vo.Member;
import com.kh.RoundTheVillage.shop.model.vo.Shop;

@Repository
public class MemberInquiryDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 전체 회원 수 조회 DAO
	 * @param cp
	 * @return listCount
	 */
	public int getNormalListCount(int cp) {
		return sqlSession.selectOne("inquiryMapper.getNormalListCount", cp);
	}


	/** 일반 회원 목록 조회 DAO
	 * @param pInfo
	 * @return bList
	 */
	public List<Member> selectNormalList(PageInfo2 pInfo) {
		
		int offset = (pInfo.getCurrentPage()-1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("inquiryMapper.selectNormalList", pInfo.getNoticeNo(), rowBounds);
	}

	
	
	/** 공방 회원 목록 조회 DAO
	 * @param pInfo
	 * @return
	 */
	public List<Shop> selectCraftList(PageInfo2 pInfo) {
		int offset = (pInfo.getCurrentPage()-1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("inquiryMapper.selectCraftList", pInfo.getNoticeNo(), rowBounds);
	}
	
	
	/** 검색어 포함 일반 회원수 조회 Service DAO
	 * @param search
	 * @return
	 */
	public int selectSearchListCount(Search search) {
		return sqlSession.selectOne("inquiryMapper.selectSearchListCount", search);
	}

	
	/** 검색어 포함 일반 회원 목록 조회 DAO
	 * @param pInfo
	 * @param search
	 * @return bList
	 */
	public List<Member> selectSearchList(PageInfo2 pInfo, Search search) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("inquiryMapper.selectSearchList", search, rowBounds);
	}
	
	
	
	
	
	
	/** 검색어 포함 공방 회원수 조회 Service DAO
	 * @param search
	 * @return
	 */
	public int selectSearchCraftCount(Search search) {
		return sqlSession.selectOne("inquiryMapper.selectSearchCraftCount", search);
	}

	
	/** 검색어 포함 공방 회원 목록 조회 DAO
	 * @param pInfo
	 * @param search
	 * @return bList
	 */
	public List<Shop> selectSearchCraft(PageInfo2 pInfo, Search search) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("inquiryMapper.selectSearchCraft", search, rowBounds);
	}
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

