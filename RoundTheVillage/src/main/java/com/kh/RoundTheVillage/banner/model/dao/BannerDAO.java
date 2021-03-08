package com.kh.RoundTheVillage.banner.model.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.banner.model.vo.Banner;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;

@Repository
public class BannerDAO {

	@Autowired
	SqlSession sqlSession;
	
	public String selectDate(String string) {
		return sqlSession.selectOne("bannerMapper.selectDate", string);
	}
	
	public int insertBanner(Banner banner) {
		return sqlSession.insert("bannerMapper.insertBanner", banner);
	}

	public Banner selectBannerByUid(String impUid) {
		return sqlSession.selectOne("bannerMapper.selectBannerByUid", impUid);
	}
	
	public int getListCount(int memNo) {
		return sqlSession.selectOne("bannerMapper.getListCount", memNo);
	}

	public List<Banner> selectList(PageInfo pInfo, int memNo) {
		int offset = (pInfo.getCurrentPage() -1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("bannerMapper.selectList", memNo, rowBounds);
	}

	public Banner selectBanner(int banNo) {
		return sqlSession.selectOne("bannerMapper.selectBanner", banNo);
	}

	public List<Banner> selectTodayBanner() {
		return sqlSession.selectList("bannerMapper.selectTodayBanner");
	}

	public int updateBanFl(int banNo) {
		return sqlSession.update("bannerMapper.updateBanFl", banNo);
	}

	public List<Banner> selectListAprvl(PageInfo pInfo) {
		int offset = (pInfo.getCurrentPage() -1) * pInfo.getLimit();
		RowBounds rowBounds = new RowBounds(offset, pInfo.getLimit());
		return sqlSession.selectList("bannerMapper.selectListAprvl", rowBounds);
	}

	public int cancelBanner(int banNo) {
		return sqlSession.update("bannerMapper.cancelBanner", banNo);
	}
}
