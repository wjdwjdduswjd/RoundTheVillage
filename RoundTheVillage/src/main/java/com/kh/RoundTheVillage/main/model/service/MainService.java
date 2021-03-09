package com.kh.RoundTheVillage.main.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.CScenter.model.vo.NoticeAttachment;
import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.board.model.vo.Search;
import com.kh.RoundTheVillage.main.model.vo.mainPageInfo;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;


public interface MainService {
	
	
	/** 좋아요순 인기 공방 12개 Service
	 * @return bList
	 */
	public abstract List<Shop> likeCraftList();


	/** 썸네일 조회
	 * @param likeList
	 * @return
	 */
	public abstract List<ShopAttachment> selectThumbnailList(List<Shop> likeList);


	/** 동네 주변 공방 12개 Service
	 * @param addrArr 
	 * @return
	 */
	public abstract List<Shop> aroundList(String addr);


	public abstract List<Shop> searchShopList(String interest);


	public abstract List<Shop> newList();


	
	
}
