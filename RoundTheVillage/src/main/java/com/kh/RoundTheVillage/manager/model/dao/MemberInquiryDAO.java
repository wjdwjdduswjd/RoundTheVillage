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
import com.kh.RoundTheVillage.member.model.vo.Member;

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
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

