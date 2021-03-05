package com.kh.RoundTheVillage.banner.model.service;

import java.io.File;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.banner.model.dao.BannerDAO;
import com.kh.RoundTheVillage.banner.model.exception.InsertBannerFailException;
import com.kh.RoundTheVillage.banner.model.vo.Banner;

@Service
public class BannerService {

	@Autowired
	private BannerDAO dao;

	@Transactional(rollbackFor = Exception.class)
	public int insertBanner(Banner banner) {
		return dao.insertBanner(banner);
	}

	public Banner selectBannerByUid(String impUid) {
		return dao.selectBannerByUid(impUid);
	}

	public String insertImage(MultipartFile uploadFile, String savePath) {
		
		String fileName = rename(uploadFile.getOriginalFilename());
		
		try {
			uploadFile.transferTo(new File(savePath + "/" + fileName)); // 서버에 파일 저장
			System.out.println(savePath + "/" + fileName);
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
}
