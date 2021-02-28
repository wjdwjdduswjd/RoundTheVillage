package com.kh.RoundTheVillage.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository // 저장소(DB) 연결 객체임을 알려줌 + bean 등록
public class BoardDAO {
	
	// 마이바티스를 이용한 DB 연결 객체를 의존성 주입
		@Autowired
		private SqlSessionTemplate sqlSession;
		// sqlSessionTemplates는 root-context.xml을 통해 bean으로 등록되어 있는 상태
	

	public int getListCount(int cp) {

		return sqlSession.selectOne("boardMapper.getListCount", cp);
	}




}
