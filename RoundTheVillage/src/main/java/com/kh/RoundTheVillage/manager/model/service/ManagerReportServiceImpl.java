package com.kh.RoundTheVillage.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
		
		return new ManagerPageInfo(listCount);
	}

	@Override
	public List<ManagerReport> selectList(ManagerPageInfo pInfo) {
		return dao.selectList(pInfo);
	}

	@Override
	public int deleteReport(int boardNo) {
		return dao.deleteReport(boardNo);
	}
	
}
