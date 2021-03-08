package com.kh.RoundTheVillage.manager.model.service;

import java.util.List;

import com.kh.RoundTheVillage.manager.model.vo.ManagerPageInfo;
import com.kh.RoundTheVillage.manager.model.vo.ManagerReport;

public interface ManagerReportService {


	ManagerPageInfo getManagerPageInfo(int cp);

	/** 신고 목록 조회
	 * @param pInfo
	 * @return rList
	 */
	List<ManagerReport> selectList(ManagerPageInfo pInfo);

}
