package com.kh.RoundTheVillage.shop.model.service;

import java.io.File;
import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.CScenter.model.exception.InsertAttachmentFailException;
import com.kh.RoundTheVillage.shop.model.dao.ShopDAO;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;




@Service
public class ShopServiceImpl implements ShopService{
	
	@Autowired
	private ShopDAO dao;

	
	
	 // summernote 업로드 이미지 저장 Service
    @Override
    public ShopAttachment insertImage(MultipartFile uploadFile, String savePath) {

       String fileName = rename(uploadFile.getOriginalFilename()); 
       
       // 웹상 접근 주소
       String filePath = "/resources/infoImages";
       
       // 돌려 보내줄 파일 정보를 Attachment 객체에 담아서 전달.
       ShopAttachment at = new ShopAttachment();
       at.setShopFilePath(filePath);
       at.setShopFileName(fileName);
    
       // 서버에 파일 저장(transferTo() )
       
       try {
          uploadFile.transferTo(new File(savePath + "/" + fileName));
          
       } catch (Exception e) {
          e.printStackTrace();
          
          throw new InsertAttachmentFailException("summernote 파일 업로드 실패");
       
       }
       
       return at;
    }
    
    // 공방 등록 Service
    @Override
    public int registrateShop(Shop shop, MultipartFile image){
    	
    	 int shopNo = dao.selectNextNo();
    	
    	
    	
    	
    	return 0;
    }
    
    
    
    
    
    
    
    
    
    // 파일명 변경 메소드
    public String rename(String originFileName) {
       SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
       String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
       
       int ranNum = (int)(Math.random()*100000); // 5자리 랜덤 숫자 생성
       
       String str = "_" + String.format("%05d", ranNum);
       //String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
       // %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)
       
       String ext = originFileName.substring(originFileName.lastIndexOf("."));
       
       return date + str + ext;
    }

    

	
	
	

}
