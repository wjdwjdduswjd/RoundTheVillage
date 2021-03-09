package com.kh.RoundTheVillage.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.RoundTheVillage.manager.model.dao.ManagerShopDAO;
import com.kh.RoundTheVillage.manager.model.vo.ManagerPageInfo;

import com.kh.RoundTheVillage.shop.model.vo.Shop;

@Service
public class ManagerShopServiceImpl implements ManagerShopService {

	
	@Autowired
	private ManagerShopDAO dao;

	
	// 페이징 처리 Service 구현
	@Override
	public ManagerPageInfo getManagerPageInfo(int cp) {
		
		
		// 신청한 공방 N 상태인 거 조회
		int listCount =dao.getListCount();
		
		return new ManagerPageInfo(cp,listCount);
	}


	// 신청된 공방 목록 가져오기
	@Override
	public List<Shop> selectList(ManagerPageInfo pInfo) {
		
	
		
		return dao.selectList(pInfo);
	}


	@Override
	public Shop selectShop(int shopNo) {
		return dao.selectShop(shopNo);
	}
	
}
