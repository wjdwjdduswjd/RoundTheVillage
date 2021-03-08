package com.kh.RoundTheVillage.manager.model.service;

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

import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;
import com.kh.RoundTheVillage.manager.model.dao.MemberInquiryDAO;
import com.kh.RoundTheVillage.member.model.vo.Member;

@Service
public class MemberInquiryServiceImpl implements MemberInquiryService {

	@Autowired
	private MemberInquiryDAO dao;

	// 페이징 처리 Service 구현
	// ----------------------------------------------------------------------------------------------------------
	@Override
	public PageInfo2 getPageInfo(int cp) {

		// 전체 회원 수 조회
		int listCount = dao.getNormalListCount(cp);

		return new PageInfo2(cp, listCount);
	}
	
	// 일반 회원 조회 Service 구현
	@Override
	public List<Member> selectNormalList(PageInfo2 pInfo) {
		return dao.selectNormalList(pInfo);
	}


	
	
	

}
