package com.kh.RoundTheVillage.banner.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.banner.model.vo.Banner;

@Repository
public class BannerDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insertBanner(Banner banner) {
		return sqlSession.insert("bannerMapper.insertBanner", banner);
	}

	public Banner selectBannerByUid(String impUid) {
		return sqlSession.selectOne("bannerMapper.selectBannerByUid", impUid);
	}
	
	public int getListCount(int memNo) {
		return sqlSession.selectOne("bannerMapper.getListCount", memNo);
	}

	public List<Banner> selectList(int memNo) {
		return sqlSession.selectList("bannerMapper.selectList", memNo);
	}
}
