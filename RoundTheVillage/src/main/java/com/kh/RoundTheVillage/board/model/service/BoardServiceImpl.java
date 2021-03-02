package com.kh.RoundTheVillage.board.model.service;

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

import com.kh.RoundTheVillage.board.model.dao.BoardDAO;
import com.kh.RoundTheVillage.board.model.vo.Attachment;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;


@Service // 서비스임을 알려줌 + bean 등록
public class BoardServiceImpl implements BoardService{

	// DAO 객체 의존성 주입
	@Autowired
	private BoardDAO dao;

	// 전체 게시글 수 조회
	@Override
	public PageInfo getPageInfo(int cp) {

		int listCount = dao.getListCount(cp);
		
		return new PageInfo(cp, listCount);
	}

	// 게시글 목록 조회
	@Override
	public List<Board> selectList(PageInfo pInfo) {
		return dao.selectList(pInfo);
	}

	// 썸네일 목록 조회
	@Override
	public List<Attachment> selectThumbnailList(List<Board> bList) {
		// TODO Auto-generated method stub
		return dao.selectThumbnailList(bList);
	}
	
	// 게시글 상세 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board selectBoard(int boardNo) {
		
		Board temp = new Board();
		temp.setBoardNo(boardNo);

		Board board = dao.selectBoard(temp);
		
		return null;
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(Map<String, Object> map, List<MultipartFile> images, String savePath) {
		
		int result = 0;
		
		int boardNo = dao.selectNextNo();
		
		if(boardNo > 0) {
			map.put("boardNo", boardNo); 
			
			String boardTitle = (String)map.get("boardTitle");
			String boardContent = (String)map.get("boardContent");
			
			boardTitle = replaceParameter(boardTitle);
			boardContent = replaceParameter(boardContent);
			
			map.put("boardTitle", boardTitle);
			map.put("boardContent", boardContent);
			
			
			result = dao.insertBoard(map);
		}
		
		
		if(result > 0) {
			
			List<Attachment> uploadImages = new ArrayList<Attachment>();
			
			String filePath = null;
			
			
		}
		
		
		
		return result;
	}
	
	
	// 크로스 사이트 스크립트 방지 처리 메소드
	private String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		
		return result;
	}

	

	}


	
	

