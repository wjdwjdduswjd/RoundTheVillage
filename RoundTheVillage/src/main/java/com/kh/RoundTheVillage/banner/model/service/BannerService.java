package com.kh.RoundTheVillage.banner.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.banner.model.dao.BannerDAO;
import com.kh.RoundTheVillage.banner.model.exception.InsertBannerFailException;
import com.kh.RoundTheVillage.banner.model.vo.Banner;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;

import oracle.net.aso.b;

@Service
public class BannerService {

	@Autowired
	private BannerDAO dao;

	public String insertImage(MultipartFile uploadFile, String savePath) {
		
		String fileName = rename(uploadFile.getOriginalFilename());
		
		try {
			uploadFile.transferTo(new File(savePath + "/" + fileName)); // 서버에 파일 저장
		} catch (Exception e) {
			e.printStackTrace();
			throw new InsertBannerFailException("배너 사진 업로드 실패");
		}
		
		return fileName;
	}
	
	public String rename(String originFileName) {
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		
		int ranNum = (int)(Math.random() * 100000); // 5자리 랜덤 숫자 생성
		String str = "_" + String.format("%05d", ranNum); // 오른쪽 정렬된 십진 정수 5자리형태(빈자리에 0)
		String ext = originFileName.substring(originFileName.lastIndexOf("."));
		
		return date + str + ext;
	}
	
	public Set<String> selectDate(int year, int month, int date) {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyMMdd");
		
        Calendar cal = Calendar.getInstance();
        cal.set(year , month-1 , date);
        int lastDate = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
        
        Set<String> dList = new HashSet<String>();
        
		for(int i = date; i < lastDate; i++) {
			String disableDate = dao.selectDate(dateFormat.format(cal.getTime()));
			System.out.println(disableDate);
			if(disableDate != null)	{
				disableDate = disableDate.substring(8, 10);
				dList.add(disableDate); // 2021-03-06;
				
				int tmp = Integer.parseInt(disableDate);
				int cnt = 0;
				for(int j = tmp-1; j > 0; j--) {
					dList.add(("00"+j).substring(("00"+j).length()-2));
					System.out.println(("00"+j).substring(("00"+j).length()-2));
					if(cnt == 5)
						break;
					cnt++;
				}
			}
			
			cal.add(Calendar.DATE, 1);
		}
		System.out.println(dList);
		
		return dList;
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertBanner(Banner banner) {
		return dao.insertBanner(banner);
	}

	public Banner selectBannerByUid(String impUid) {
		return dao.selectBannerByUid(impUid);
	}

	public PageInfo getPageInfo(int memNo, int cp) {
		int listCount = dao.getListCount(memNo);
		return new PageInfo(cp, listCount, 10, 10, memNo);
	}

	public List<Banner> selectList(PageInfo pInfo, int memNo) {
		return dao.selectList(pInfo, memNo);
	}

	public Banner selectBanner(int banNo) {
		return dao.selectBanner(banNo);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int cancelBanner(int banNo) {
		return dao.cancelBanner(banNo);
	}

	@Transactional(rollbackFor = Exception.class)
	public int updateBanFl(int banNo) {
		return dao.updateBanFl(banNo);
	}

	public List<Banner> selectListAprvl(PageInfo pInfo) {
		return dao.selectListAprvl(pInfo);
	}
	
	public List<Banner> selectTodayBanner() {
		return dao.selectTodayBanner();
	}
}
