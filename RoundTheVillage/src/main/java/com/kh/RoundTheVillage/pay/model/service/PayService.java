package com.kh.RoundTheVillage.pay.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.RoundTheVillage.pay.model.dao.PayDAO;
import com.kh.RoundTheVillage.pay.model.vo.Coupon;
import com.kh.RoundTheVillage.pay.model.vo.Pay;
import com.kh.RoundTheVillage.pay.model.vo.PayLes;

import com.kh.RoundTheVillage.board.model.vo.PageInfo;

@Service
public class PayService {

	@Autowired
	private PayDAO dao;
	
	public List<Coupon> selectCupon(int memNo) {
		return dao.selectCupon(memNo);
	}
	
	public PayLes selectLesson(int lesNo) {
		return dao.selectLesson(lesNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertPay(Pay pay) {
		return dao.insertPay(pay);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int updateCoupon(int couponNo) {
		return dao.updateCoupon(couponNo);
	}
	
	public Pay selectPayByUid(String impUid) {
		return dao.selectPayByUid(impUid);
	}

	public PageInfo getPageInfo(int memNo, int cp) {
		int listCount = dao.getListCount(memNo);
		return new PageInfo(cp, listCount, 10, 10, memNo);
	}

	public List<Pay> selectList(PageInfo pInfo, int memNo) {
		return dao.selectList(pInfo, memNo);
	}
	
	public Pay selectPay(int payNo) {
		return dao.selectPay(payNo);
	}

	public int cancelPay(int payNo) {
		return dao.cancelPay(payNo);
	}
	
	public int insertWelcomeCoupon(int memNo) {
		return dao.insertWelcomeCoupon(memNo);
	}
}