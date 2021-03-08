package com.kh.RoundTheVillage.manager.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.manager.model.vo.ManagerPageInfo;
import com.kh.RoundTheVillage.manager.model.vo.ManagerReport;

@Repository
public class ManagerReportDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public int getListCount() {
		return sqlSession.selectOne("Reportmapper.getListCount");
	}

	public List<ManagerReport> selectList(ManagerPageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() - 1) * pInfo.getLimit();

		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());

		return sqlSession.selectList("Reportmapper.selectList", rowBounds);
	}
}
