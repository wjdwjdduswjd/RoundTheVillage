package com.kh.RoundTheVillage.main.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.CScenter.model.dao.NoticeDAO;
import com.kh.RoundTheVillage.CScenter.model.exception.InsertAttachmentFailException;
import com.kh.RoundTheVillage.CScenter.model.vo.NoticeAttachment;
import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.board.model.vo.Search;
import com.kh.RoundTheVillage.main.model.dao.MainDAO;
import com.kh.RoundTheVillage.main.model.vo.mainPageInfo;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

@Service
public class MainServiceImpl implements MainService {

	@Autowired
	private MainDAO dao;

	// 페이징 처리 Service 구현
	@Override
	public mainPageInfo getPageInfo(int cp) {

		// 전체 게시글 수 조회
		int listCount = dao.getListCount(cp);

		return new mainPageInfo(cp, listCount);
	}

	// 게시글 목록 조회 Service 구현
	@Override
	public List<Shop> likeCraftList() {
		return dao.likeCraftList();
	}
	
	
	/**
	 * @param bList
	 * @return
	 */
	@Override
	public List<ShopAttachment> selectThumbnailList(List<Shop> likeList) {
		return dao.selectThumbnailList(likeList);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	

}
