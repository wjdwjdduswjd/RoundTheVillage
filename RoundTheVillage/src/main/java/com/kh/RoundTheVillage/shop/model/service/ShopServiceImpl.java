package com.kh.RoundTheVillage.shop.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.CScenter.model.exception.InsertAttachmentFailException;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.shop.model.dao.ShopDAO;
import com.kh.RoundTheVillage.shop.model.vo.Shop;
import com.kh.RoundTheVillage.shop.model.vo.ShopAttachment;

@Service
public class ShopServiceImpl implements ShopService {

	@Autowired
	private ShopDAO dao;

	
	
	
	// 공방 상세 조회 Service 구현
	@Override
	public Shop selectShop(int memberNo) {
		return dao.selectShop(memberNo);
	}

	// 수업 리스트 조회 Service 구현
	@Override
	public List<Lesson> selectlesList() {
		
		return dao.selectlesList();
	}
	
	// 수업 썸네일 목록 조회 Service 구현
	@Override
	public List<LessonFile> selectThumbnailList(List<Lesson> lesList) {
		return dao.selectThumbnailList(lesList);
	}
	
	// 공방 좋아요 개수 조회
	@Override
	public int selectCsGoodCount(int memberNo) {
		return dao.selectCsGoodCount(memberNo);
	}



	//  공방 등록 여부 확인 Service 구현
	@Override
	public int selectRegistrationFlag(int memberNo) {
		
		return dao.selectRegistrationFlag(memberNo);
	}
	
	
	// 공방 등록 Service 구현
	 @Transactional(rollbackFor = Exception.class)
	@Override
	public int registrateShop(Shop shop, MultipartFile image, String savePath) {
		
		int result = 0;
		
		int shopNo = dao.selectshopNo();
		
		result = dao.registrateShop(shop);
		
		if (result > 0) { // 삽입 성공 시
			
			// 이미지 정보를 Attachment 객체에 저장하여 List에 추가
			List<ShopAttachment> uploadImages = new ArrayList<ShopAttachment>();
			
			String filePath = null;
			
			filePath = "/resources/images/shop";
			
			if (!image.getOriginalFilename().equals("")) {
				// 파일이 업로드 된 경우 == 업로드 된 원본 파일명이 있는 경우
				
				// 원본파일명 변경
				String fileName = rename(image.getOriginalFilename());
				
				// Attachment 객체 생성
				ShopAttachment at = new ShopAttachment(filePath, fileName, shopNo);
				
				uploadImages.add(at); // 리스트에 추가
				
			}
			
			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // img 태그 src 추출 정규표현식
			
			// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
			Matcher matcher = pattern.matcher(shop.getShopInfo());
			
			String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
			String src = null; // src 속성값을 저장할 임시 참조 변수
			
			// matcher.find() : Matcher 객체에 저장된 값(검사를 통해 매칭된 src 속성 값)에 반복 접근하여 값이 있을 경우
			// true
			while (matcher.find()) {
				src = matcher.group(1); // 매칭된 src 속성값을 Matcher 객체에서 꺼내서 src에 저장
				
				System.out.println(src);
				
				filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.
				
				fileName = src.substring(src.lastIndexOf("/") + 1); // 업로드된 파일명만 잘라서 별도로 저장.
				
				// Attachment 객체를 이용하여 DB에 파일 정보를 저장
				ShopAttachment at = new ShopAttachment(filePath, fileName, shopNo);
				uploadImages.add(at);
			}
			
		}
		
		return 0;
		
	}


	
	// summernote 업로드 이미지 저장 Service
	@Override
	public ShopAttachment insertImage(MultipartFile uploadFile, String savePath) {

		String fileName = rename(uploadFile.getOriginalFilename());

		// 웹상 접근 주소
		String filePath = "/resources/infoImages/shop";

		// 돌려 보내줄 파일 정보를 Attachment 객체에 담아서 전달.
		ShopAttachment at = new ShopAttachment();
		at.setFilePath(filePath);
		at.setFileName(fileName);

		// 서버에 파일 저장(transferTo() )

		try {
			uploadFile.transferTo(new File(savePath + "/" + fileName));

		} catch (Exception e) {
			e.printStackTrace();

			throw new InsertAttachmentFailException("summernote 파일 업로드 실패");

		}

		return at;
	}

	// 파일명 변경 메소드
	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));

		int ranNum = (int) (Math.random() * 100000); // 5자리 랜덤 숫자 생성

		String str = "_" + String.format("%05d", ranNum);
		// String.format : 문자열을 지정된 패턴의 형식으로 변경하는 메소드
		// %05d : 오른쪽 정렬된 십진 정수(d) 5자리(5)형태로 변경. 빈자리는 0으로 채움(0)

		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		return date + str + ext;
	}

	




	
	
	
}
