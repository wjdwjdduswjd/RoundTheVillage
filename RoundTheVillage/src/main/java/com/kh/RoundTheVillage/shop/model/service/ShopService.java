package com.kh.RoundTheVillage.shop.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.RoundTheVillage.shop.model.dao.ShopDAO;

@Service
public class ShopService {
	
	@Autowired
	private ShopDAO dao;

}