package com.kh.RoundTheVillage.pay.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.pay.model.dao.PayDAO;
import com.kh.RoundTheVillage.pay.model.vo.Coupon;
import com.kh.RoundTheVillage.pay.model.vo.Pay;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;

@Service
public class PayService {

	@Autowired
	private PayDAO dao;

	// 페이징 처리 객체 생성 Service 구현
	public PageInfo getPageInfo(int memNo, int cp) {
		int listCount = dao.getListCount(memNo); // 전체 게시글 수 조회
		return new PageInfo(cp, listCount, memNo);
	}

	// 게시글 목록 조회 Service 구현
	public List<Pay> selectList(PageInfo pInfo) {
		return dao.selectList(pInfo);
	}

//	public List<Attachment> selectThumbnailList(List<Pay> bList) {
//		return dao.selectThumbnailList(bList);
//	}
	
	// 게시글 상세 조회 Service 구현
	@Transactional(rollbackFor = Exception.class)
	 
	public Pay selectPay(int payNo) {
		return dao.selectPay(payNo);
	}
	
	// 게시글 삽입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	public int insertPay(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		return  dao.insertPay(map);
	}

	public List<Coupon> selectCupon(int memNo) {
		return dao.selectCupon(memNo);
	}

	public int insertPay(Pay pay) {
		return dao.insertPay(pay);
	}
}