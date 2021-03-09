package com.kh.RoundTheVillage.manager.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.RoundTheVillage.manager.model.dao.ManagerShopDAO;
import com.kh.RoundTheVillage.manager.model.vo.ManagerPageInfo;

import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

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


	// 상세 조회에 보여줄 내용
	@Override
	public Shop selectShop(int shopNo) {
		return dao.selectShop(shopNo);
	}

	// 공방 상태 변경 하기
	@Override
	public int updateShopFl(int shopNo) {
		return dao.updateShopFl(shopNo);
	}


	@Override
	public ShopAttachment selectThumb(int shopNo) {


		return dao.selectThumb(shopNo);
	}
	
}
