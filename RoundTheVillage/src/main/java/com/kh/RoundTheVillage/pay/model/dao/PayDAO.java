package com.kh.RoundTheVillage.pay.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PayDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;
}
