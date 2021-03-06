package com.kh.RoundTheVillage.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.board.model.vo.Attachment;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.board.model.vo.Search;

@Repository // 저장소(DB) 연결 객체임을 알려줌 + bean 등록
public class BoardDAO {

	// 마이바티스를 이용한 DB 연결 객체를 의존성 주입
	@Autowired
	private SqlSessionTemplate sqlSession;
	// sqlSessionTemplates는 root-context.xml을 통해 bean으로 등록되어 있는 상태

	public int getListCount(String ct) {

		return sqlSession.selectOne("boardMapper.getListCount", ct);
	}

	public List<Board> selectList(PageInfo pInfo, String ct) {

		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("boardMapper.selectList", ct, rowBounds);
	}

	public List<Attachment> selectThumbnailList(List<Board> bList) {
		return sqlSession.selectList("boardMapper.selectThumbnailList", bList);
	}

	public Board selectBoard(int boardNo) {

		return sqlSession.selectOne("boardMapper.selectBoard", boardNo);
	}
	
	public int increaseReadCount(int boardNo) {

		return sqlSession.update("boardMapper.increaseReadCount", boardNo);
	}
	
	public List<Attachment> selectAttachmentList(int boardNo) {
		
		return sqlSession.selectList("boardMapper.selectAttachmentList", boardNo);
	}


	
	 public int selectNextNo() { // TODO Auto-generated method stub return
	  return sqlSession.selectOne("boardMapper.selectNextNo");
	 
	 }
	
	public int insertBoard(Map<String, Object> map) {
		return sqlSession.insert("boardMapper.insertBoard", map);
	}

	public int insertAttachmentList(List<Attachment> uploadImages) {
		return sqlSession.insert("boardMapper.insertAttachmentList", uploadImages);
	}

	public List<Board> selectClass(int memberNo) {
		return sqlSession.selectList("boardMapper.selectClass", memberNo);
	}

	/** 좋아요 여부 확인 DAO
	 * @param map
	 * @return likeFl
	 */
	public int selectLikeFl(Map<String, Integer> map) {
		return sqlSession.selectOne("boardMapper.selectLikeFl", map);
	}

	
	/** 좋아요 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertLike(Map<String, Integer> map) {
		return sqlSession.insert("boardMapper.insertLike", map);
	}
 
	/** 좋아용 삭제 DAO
	 * @param map
	 * @return result
	 */
	public int deleteLike(Map<String, Integer> map) {
		return sqlSession.delete("boardMapper.deleteLike", map);
	}

	/** 좋아요 카운트 DAO
	 * @param boardNo
	 * @return  result
	 */
	public int selectLikeCount(int boardNo) {
		return sqlSession.selectOne("boardMapper.selectLikeCount", boardNo);
	}

	public int findReport(Map<String, Object> map) {
		return sqlSession.selectOne("boardMapper.findReport", map);
	}

	public int reportBoard(Map<String, Object> map) {
		return sqlSession.insert("boardMapper.reportBoard", map);
	}

	// 검색어 포함 게시글 개수 조회 Service DAO
	public int selectSearchListCount(Search search) {
		return sqlSession.selectOne("boardMapper.selectSearchListCount", search);
	}

	/** 검색어 포함 게시글 목록 조회 DAO
	 * @param pInfo
	 * @param search
	 * @return bList
	 */
	public List<Board> selectSearchList(PageInfo pInfo, Search search) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("boardMapper.selectSearchList", search, rowBounds);
	}
	
	
	
	public int updateBoard(Board updateBoard) {
		return sqlSession.update("boardMapper.updateBoard", updateBoard);
	}




	

}
