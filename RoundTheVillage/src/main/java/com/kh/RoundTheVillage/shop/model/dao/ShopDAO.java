
package com.kh.RoundTheVillage.shop.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReview;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

@Repository
public class ShopDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	/** 공방 상세 조회 DAO
	 * @param shopNo
	 * @return shop
	 */
	public Shop selectShop(int shopNo) {
		return sqlSession.selectOne("shopMapper.selectShop",shopNo);
	}
	
	/** 공방 좋아요 개수 조회 DAO
	 * @param memberNo
	 * @return csGoodCount
	 */
	public int selectCsGoodCount(int memberNo) {
		return sqlSession.selectOne("shopMapper.selectCsGoodCount", memberNo);
	}
	
	/** 공방 등록 여부 확인 DAO
	 * @param memberNo
	 * @return
	 */
	public int selectRegistrationFlag(int memberNo) {
		return sqlSession.selectOne("shopMapper.selectRegistrationFlag", memberNo);
	}

	/**
	 * 공방 등록 DAO
	 * 
	 * @param shop
	 * @return
	 */
	public int registrateShop(Shop shop) {
		return sqlSession.insert("shopMapper.registrateShop", shop);
	}

	/** 수업 목록 조회 DAO
	 * @param shopNo
	 * @return
	 */
	public List<Lesson> selectlesList(int shopNo) {
		return sqlSession.selectList("lessonMapper.selectlesList", shopNo);
	}

	/** 수업 썸네일 목록조회
	 * @param lesList
	 * @return
	 */
	public List<LessonFile> selectThumbnailList(List<Lesson> lesList) {
		return sqlSession.selectList("lessonMapper.selectThumbnailList",lesList);
	}



	   /** 파일 정보 삽입 DAO
	    * @param uploadImages
	    * @return result (성공한 행의 개수)
	    */
	public int insertAttachmentList(List<ShopAttachment> uploadImages) {
		return sqlSession.insert("shopMapper.insertAttachmentList", uploadImages);
	}

	/** 썸네일 가져오기 
	 * @param shopNo
	 * @return
	 */
	public ShopAttachment selectThumb(int shopNo) {
		return sqlSession.selectOne("shopMapper.selectThumb",shopNo);
	}

	
	
	/** 리뷰 목록 가져오기
	 * @param shopNo
	 * @return
	 */
	public List<LessonReview> selectReviewList(int shopNo) {
		
		return sqlSession.selectList("lessonMapper2.selectReviewList",shopNo);
		
	}

	/** 좋아요 여부 조회
	 * @param map
	 * @return
	 */
	public int selectLikeFl(Map<String, Integer> map) {
		return sqlSession.selectOne("shopMapper.selectLikeFl", map);
	};
	

	
	/** 좋아요 삽입 DAO
	 * @param map
	 * @return result
	 */
	public int insertLike(Map<String, Integer> map) {
		return sqlSession.insert("shopMapper.insertLike", map);
	}
 
	/** 좋아용 삭제 DAO
	 * @param map
	 * @return result
	 */
	public int deleteLike(Map<String, Integer> map) {
		return sqlSession.delete("shopMapper.deleteLike", map);
	}

	/** 좋아요 카운트 DAO
	 * @param shopNo
	 * @return  result
	 */
	public int selectLikeCount(int shopNo) {
		return sqlSession.selectOne("shopMapper.selectLikeCount", shopNo);
	}

	/** 공방 정보 수정 DAO
	 * @param shop
	 * @return result
	 */
	public int updateShop(Shop shop) {
		return sqlSession.update("shopMapper.updateShop", shop);
	}

	
	/** 이미지 목록 조회 DAO
	 * @param shopNo
	 * @return attachementList
	 */
	public List<ShopAttachment> selectShopAttachmentList(int shopNo) {
		return sqlSession.selectList("shopMapper.selectShopAttachmentList", shopNo);
	}

	/** 이미지 정보 수정 DAO
	 * @param at
	 * @return result
	 */
	public int updateShopAttachment(ShopAttachment at) {
		return sqlSession.update("shopMapper.updateShopAttachment", at);
	}

	/** 이미지 정보 삽입 DAO
	 * @param at
	 * @return result
	 */
	public int insertShopAttachment(ShopAttachment at) {
		return sqlSession.insert("shopMapper.insertShopAttachment", at);
	}
 
	/** 이미지 정보 일괄 삭제 DAO
	 * @param deleteFileNoList
	 * @return reulst
	 */
	public int deleteAttachmentList(List<Integer> deleteFileNoList) {
		return sqlSession.delete("shopMapper.deleteAttachmentList", deleteFileNoList);
	}
	



}