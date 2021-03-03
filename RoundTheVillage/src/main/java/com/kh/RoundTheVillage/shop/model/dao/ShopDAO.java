  
package com.kh.RoundTheVillage.shop.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.shop.model.vo.Shop;

@Repository
public class ShopDAO {
	
	@Autowired
	   private SqlSessionTemplate sqlSession;

	/** 공방 번호 얻어오기
	 * @return
	 */
	public int selectNextNo() {
		
		return sqlSession.selectOne("shopMapper.selectNextNo");
		
	}

	/** 공방 등록하기
	 * @param shop
	 * @return
	 */
	public int registrateShop(Shop shop) {
		
		return sqlSession.insert("shopMapper.registrateShop",shop);
	}





}