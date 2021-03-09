package com.kh.RoundTheVillage.manager.model.service;

import java.util.List;

import com.kh.RoundTheVillage.manager.model.vo.ManagerPageInfo;

import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

public interface ManagerShopService {

	/**  페이징 처리 Service
	 * @param cp
	 * @return
	 */
	ManagerPageInfo getManagerPageInfo(int cp);

	/** 신청된 공방 목록 가져오기
	 * @param pInfo
	 * @param shopNo 
	 * @return
	 */
	List<Shop> selectList(ManagerPageInfo pInfo);

	/** 공방 내용 가져오기
	 * @param shopNo
	 * @return
	 */
	Shop selectShop(int shopNo);

	/** 공방 등록 상태 변경 
	 * @param shopNo
	 * @return
	 */
	int updateShopFl(int shopNo);

	/** 썸네일 가져오기
	 * @param shopNo
	 * @return
	 */
	ShopAttachment selectThumb(int shopNo);

}
