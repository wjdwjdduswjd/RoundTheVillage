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

	// 공방 등록 여부 확인 Service 구현
	@Override
	public int selectRegistrationFlag(int memberNo) {

		return dao.selectRegistrationFlag(memberNo);
	}

	// 공방 등록 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int registrateShop(Shop shop, List<MultipartFile> images, String savePath) {

		int result = 0; // 최종 결과 저장 변수 선언

		// 1) 게시글 번호 얻어오기 -> SEQ_BNO.NEXTVAL를 통해 얻어옴
		int shopNo = shop.getShopNo(); // 추후 메소드 내에서 boardNo를 다시 사용하기 위함

		// 2) 게시글 삽입
		if (shopNo > 0) { // 다음 게시글 번호를 얻어온 경우

			shop.setShopNo(shopNo);

			// 게시글 삽입 DAO 메소드 호출
			result = dao.registrateShop(shop);
			System.out.println("result1 : " + result);
		}

		// 3) 게시글 삽입 성공 시 이미지 정보 삽입
		if (result > 0) {

			// 이미지 정보를 Attachment 객체에 저장하여 List에 추가
			List<ShopAttachment> uploadImages = new ArrayList<ShopAttachment>();

			// images(i).getOriginalName() -> 업로드 된 파일의 원본 파일명
			// --> 증복 상황을 대비하여 파일명 변경하는 코드 필요 (rename() 메소드)

			// DB에 저장할 웹상 접근 주소(filePath)
			String filePath = null;

			filePath = "/resources/images/shop";

			// for문을 이용하여 파일정보가 담긴 images를 반복 접근
			// -> 업로드 된 파일이 있을 경우에만 uploadImages 리스트에 추가
			for (int i = 0; i < images.size(); i++) {
				// i == 인덱스 == fileLevel과 같은 값

				// 현재 접근한 images의 요소(MultipartFile)에 업로드 된 파일이 있는지 확인
				if (!images.get(i).getOriginalFilename().equals("")) {
					// 파일이 업로드 된 경우 == 업로드 된 원본 파일명이 있는 경우

					// 원본파일명 변경
					String fileName = rename(images.get(i).getOriginalFilename());

					// Attachment 객체 생성
					ShopAttachment at = new ShopAttachment(i, filePath, fileName, shopNo);

					uploadImages.add(at); // 리스트에 추가

				}
			}

			// uploadImages 확인
			/*
			 * for(Attachment at : uploadImages) { System.out.println(at); }
			 */

			// ---------------------------summernote---------------------------------

			// 게시판 타입이 2번(summernote를 이용한 게시글 작성)일 경우
			// boardContent 내부에 업로드 된 이미지 정보(filePath, fileName)이 들어있음
			// -> boardContent에서 <img>태그만을 골라내어
			// img 태그의 src 속성 값을 추출 후 filePath, fileName을 얻어냄.

			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // img 태그 src 추출 정규표현식

			// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
			Matcher matcher = pattern.matcher(shop.getShopContact());

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
				ShopAttachment at = new ShopAttachment(1, filePath, fileName, shopNo);

				uploadImages.add(at);
			}

			// ---------------------------summernote---------------------------------

			if (!uploadImages.isEmpty()) { // 업로드 된 이미지가 있을 경우
				// 파일 정보 삽입 DAO 호출
				result = dao.insertAttachmentList(uploadImages);
				// result == 삽입된 행의 개수
				System.out.println("result2 : " + result);
				// 모든 데이터가 정상 삽입 되었을 경우 --> 서버에 파일 저장
				if (result == uploadImages.size()) {

					result = shopNo; // result에 boardNo 저장

					// MultipartFile.transferTo()
					// -> MultipartFile 객체에 저장된 파일을
					// 저장된 경로에 실제 파일의 형태로 변환하여 저장하는 메소드

					int size = 0;

					if (!images.get(0).getOriginalFilename().equals("")) {
						size = images.size();
					}

					for (int i = 0; i < size; i++) {

						// uploadImages : 업로드 된 이미지 정보를 담고있는 Attachment가 모여있는 List
						// images : input type = "file" 태그의 정보를 담은 MultipartFile이 모여있는 List

						// uploadImages를 만들 때 각 요소의 파일 레벨은 images의 index를 이용하여 부여함.

						try {
							images.get(uploadImages.get(i).getFileLevel())
									.transferTo(new File(savePath + "/" + uploadImages.get(i).getFileName()));

						} catch (Exception e) {
							e.printStackTrace();

							// transferTo()는 IOException을 발생시킴. (CheckedException)
							// -> 어쩔 수 없이 try-catch 작성
							// --> 예외가 처리 되어 버려서 @Transactional이 정상 동작하지 못함.
							// --> 꼭 예외 처리를 하지 않아도 되는 UncheckedException을 강제 발생하여
							// @Transactional이 예외가 발생했음을 감지하게 함.
							// --> 상황에 맞는 사용자 정의 예외를 작성
							throw new InsertAttachmentFailException("파일 서버 저장 실패");
						}
					}

				} else { // 파일 정보를 DB에 삽입하는데 실패했을 때
					throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
				}
			} else { // 업로드 된 이미지가 없을 경우
				result = shopNo;
			}

		}
		return result;
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

	// summernote 업로드 이미지 저장 Service
	@Override
	public ShopAttachment insertImage(MultipartFile uploadFile, String savePath) {

		String fileName = rename(uploadFile.getOriginalFilename());

		// 웹상 접근 주소
		String filePath = "/resources/images/shop";

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

}
