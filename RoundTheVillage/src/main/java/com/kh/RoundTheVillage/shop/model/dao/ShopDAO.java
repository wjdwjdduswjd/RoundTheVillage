  
package com.kh.RoundTheVillage.shop.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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





}