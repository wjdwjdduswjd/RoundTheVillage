
package com.kh.RoundTheVillage.shop.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.shop.model.vo.Shop;

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



}