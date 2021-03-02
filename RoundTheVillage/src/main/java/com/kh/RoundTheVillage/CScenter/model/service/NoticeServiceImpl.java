package com.kh.RoundTheVillage.CScenter.model.service;

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
import com.kh.RoundTheVillage.CScenter.model.vo.Attachment;
import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;

@Service 
public class NoticeServiceImpl implements NoticeService {
	
	
	@Autowired
	private NoticeDAO dao;
	
	
	// 페이징 처리  Service 구현  ----------------------------------------------------------------------------------------------------------
	@Override
	public PageInfo2 getPageInfo(int cp) {
		
		// 전체 게시글 수 조회
		int listCount = dao.getListCount(cp);
		
		return new PageInfo2(cp, listCount);
	}

	
	// 게시글 목록 조회 Service 구현 ----------------------------------------------------------------------------------------------------------
	@Override
	public List<Notice> selectList(PageInfo2 pInfo) {
		return dao.selectList(pInfo);
	}

	
	// 게시글 상세 조회 Service 구현 -----------------------------------------------------------------------------------------------------------
		@Transactional(rollbackFor = Exception.class)
		@Override
		public Notice selectNotice(int noticeNo) {
			// 1) 게시글 상세 조회
			Notice temp = new Notice();
			temp.setNoticeNo(noticeNo);
			
			Notice notice = dao.selectNotice(temp);
			
			return notice;
		}


		// 게시글에 포함된 이미지 목록 조회 Service 구현 -----------------------------------------------------------------------------------------------
		@Override
		public List<Attachment> selectAttachmentList(int noticeNo) {
			return dao.selectAttachmentList(noticeNo);
		}


}
