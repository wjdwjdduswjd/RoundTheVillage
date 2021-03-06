
package com.kh.RoundTheVillage.shop.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

@Repository
public class ShopDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;


	/** 공방 상세 조회 DAO
	 * @param memberNo
	 * @return shop
	 */
	public Shop selectShop(int memberNo) {
		return sqlSession.selectOne("shopMapper.selectShop",memberNo);
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
	public List<Lesson> selectlesList() {
		return sqlSession.selectList("lessonMapper.selectlesList");
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



}