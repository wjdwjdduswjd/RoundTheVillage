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
	
	/** 페이징 처리 객체 생성 Service
	 * @param type
	 * @param cp
	 * @return pInfo
	 */
	public abstract mainPageInfo getPageInfo(int cp);
	
	
	/** 게시글 목록 조회 Service
	 * @return bList
	 */
	public abstract List<Shop> likeCraftList();


	/** 썸네일 조회
	 * @param likeList
	 * @return
	 */
	public abstract List<ShopAttachment> selectThumbnailList(List<Shop> likeList);


	
	
}
