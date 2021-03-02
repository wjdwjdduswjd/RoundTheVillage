package com.kh.RoundTheVillage.CScenter.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.CScenter.model.vo.Attachment;
import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;

@Repository
public class NoticeDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/** 전체 게시글 수 조회 DAO
	 * @param cp
	 * @return listCount
	 */
	public int getListCount(int cp) {
		return sqlSession.selectOne("noticeMapper.getListCount", cp);
	}


	/** 게시글 목록 조회 DAO
	 * @param pInfo
	 * @return bList
	 */
	public List<Notice> selectList(PageInfo2 pInfo) {
		
		// RowBounds 객체 : offset과 limit을 이용하여 조회 내용 중 일부 행만 조회하는 마이바티스 객체
		int offset = (pInfo.getCurrentPage()-1) * pInfo.getLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		
		return sqlSession.selectList("noticeMapper.selectList", pInfo.getBoardType(), rowBounds);
	}
	
	
	/** 게시글 상세 조회 DAO
	 * @param temp
	 * @return board
	 */
	public Notice selectNotice(Notice temp) {
		return sqlSession.selectOne("noticeMapper.selectNotice", temp);
	}

	
	/** 게시글에 포함된 이미지 목록 조회 DAO
	 * @param boardNo
	 * @return attachmentList
	 */
	public List<Attachment> selectAttachmentList(int noticeNo) {
		return sqlSession.selectList("noticeMapper.selectAttachmentList", noticeNo);
	}
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

