package com.kh.RoundTheVillage.board.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;


public interface BoardService {

	PageInfo getPageInfo(int cp);

	List<Board> selectList(PageInfo pInfo);




}
