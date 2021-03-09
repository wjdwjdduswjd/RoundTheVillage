package com.kh.RoundTheVillage.manager.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.RoundTheVillage.manager.model.dao.ManagerReportDAO;
import com.kh.RoundTheVillage.manager.model.vo.ManagerPageInfo;
import com.kh.RoundTheVillage.manager.model.vo.ManagerReport;

@Service
public class ManagerReportServiceImpl implements ManagerReportService{

	@Autowired
	private ManagerReportDAO dao;

	@Override
	public ManagerPageInfo getManagerPageInfo(int cp) {
		
		int listCount = dao.getListCount();
		
		return new ManagerPageInfo(cp, listCount);
	}

	@Override
	public List<ManagerReport> selectList(ManagerPageInfo pInfo) {
		return dao.selectList(pInfo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteReport(int boardNo) {
		return dao.deleteReport(boardNo);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteMember(int memberNo) {
		return dao.deleteMember(memberNo);
	}

	// 후기 게시글 또는 리뷰 상태 변경 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateStatus(Map<String, Object> map) {
		return dao.updateStatus(map);
	}

	
	
}
