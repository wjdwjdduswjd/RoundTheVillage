package com.kh.RoundTheVillage.manager.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
}
