package com.kh.RoundTheVillage.manager.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.RoundTheVillage.manager.model.dao.ManagerReportDAO;

@Service
public class ManagerReportServiceImpl implements ManagerReportService{

	@Autowired
	private ManagerReportDAO dao;
	
}
