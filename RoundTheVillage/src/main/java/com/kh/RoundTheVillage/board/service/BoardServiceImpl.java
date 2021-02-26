package com.kh.RoundTheVillage.board.service;

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

import com.kh.RoundTheVillage.board.dao.BoardDAO;


@Service // 서비스임을 알려줌 + bean 등록
public class BoardServiceImpl implements BoardService{

	// DAO 객체 의존성 주입
	@Autowired
	private BoardDAO dao;


	
	
}
