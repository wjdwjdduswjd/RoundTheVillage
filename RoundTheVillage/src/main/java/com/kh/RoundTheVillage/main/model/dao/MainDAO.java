package com.kh.RoundTheVillage.main.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.NoticeAttachment;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.board.model.vo.Search;
import com.kh.RoundTheVillage.main.model.vo.mainPageInfo;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	/** 전체 게시글 수 조회 DAO
	 * @param cp
	 * @return listCount
	 */
	public int getListCount(int cp) {
		return sqlSession.selectOne("mainMapper.getListCount", cp);
	}


	/** 게시글 목록 조회 DAO
	 * @return bList
	 */
	public List<Shop> likeCraftList() {
		
		//int offset = (pInfo.getCurrentPage()-1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(0, 12);
		return sqlSession.selectList("mainMapper.likeCraftList", null, rowBounds);
	}


	/**
	 * @param likeList
	 * @return
	 */
	public List<ShopAttachment> selectThumbnailList(List<Shop> likeList) {
		return sqlSession.selectList("mainMapper.selectThumbnailList", likeList);
	}
	
	
}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

