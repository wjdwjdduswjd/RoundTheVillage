package com.kh.RoundTheVillage.banner.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.RoundTheVillage.banner.model.dao.BannerDAO;

@Service
public class BannerService {

	@Autowired
	private BannerDAO dao;
}
