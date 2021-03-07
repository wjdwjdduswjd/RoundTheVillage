package com.kh.RoundTheVillage.CScenter.model.service;

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

import com.kh.RoundTheVillage.CScenter.model.dao.NoticeDAO;
import com.kh.RoundTheVillage.CScenter.model.exception.InsertAttachmentFailException;
import com.kh.RoundTheVillage.CScenter.model.vo.NoticeAttachment;
import com.kh.RoundTheVillage.CScenter.model.vo.Notice;
import com.kh.RoundTheVillage.CScenter.model.vo.PageInfo2;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private NoticeDAO dao;

	// 페이징 처리 Service 구현
	// ----------------------------------------------------------------------------------------------------------
	@Override
	public PageInfo2 getPageInfo(int cp) {

		// 전체 게시글 수 조회
		int listCount = dao.getListCount(cp);

		return new PageInfo2(cp, listCount);
	}

	// 게시글 목록 조회 Service 구현
	// ----------------------------------------------------------------------------------------------------------
	@Override
	public List<Notice> selectList(PageInfo2 pInfo) {
		return dao.selectList(pInfo);
	}

	// 게시글 상세 조회 Service 구현
	// -----------------------------------------------------------------------------------------------------------
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Notice selectNotice(int noticeNo) {
		// 1) 게시글 상세 조회
		Notice temp = new Notice();
		temp.setNoticeNo(noticeNo);

		Notice notice = dao.selectNotice(temp);

		return notice;
	}

	// 게시글에 포함된 이미지 목록 조회 Service 구현
	// -----------------------------------------------------------------------------------------------
	@Override
	public List<NoticeAttachment> selectAttachmentList(int noticeNo) {
		return dao.selectAttachmentList(noticeNo);
	}

	// 게시글 삽입 Service 구현
	// --------------------------------------------------------------------------------
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertNotice(Map<String, Object> map, String savePath) {

		int result = 0; // 최종 결과 저장 변수 선언
		int noticeNo = dao.selectNextNo();

		// System.out.println("noticeNo"+noticeNo);

		if (noticeNo > 0) { // 다음 게시글 번호를 얻어온 경우
			map.put("noticeNo", noticeNo); // map에 noticeNo 추가
			result = dao.insertNotice(map);

			System.out.println("noticeNo:" + noticeNo);

			if (result > 0) {
				List<NoticeAttachment> uploadImages = new ArrayList<NoticeAttachment>();

				// summernote 추가시 수정 부분 ---------------------------------------------
				String filePath = "/resources/infoImages/notice";

				Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // img 태그 src 추출

				// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
				Matcher matcher = pattern.matcher((String) map.get("noticeContent"));

				String fileName = null; // 파일명 변환 후 저장할 임시 참조 변수
				String src = null; // src 속성값을 저장할 임시 참조 변수

				while (matcher.find()) {
					src = matcher.group(1); // 매칭된 src 속성값을 Matcher 객체에서 꺼내서 src에 저장

					filePath = src.substring(src.indexOf("/", 2), src.lastIndexOf("/")); // 파일명을 제외한 경로만 별도로 저장.

					fileName = src.substring(src.lastIndexOf("/") + 1); // 업로드된 파일명만 잘라서 별도로 저장.

					NoticeAttachment at = new NoticeAttachment(filePath, "test", 1, noticeNo);
					uploadImages.add(at);
				}

				// ------------------------------------------ summernote
				// ------------------------------------------------------

				if (!uploadImages.isEmpty()) { // 업로드된 이미지가 있을 경우

					// System.out.println(uploadImages);

					result = dao.insertAttachmentList(uploadImages);

					if (result == uploadImages.size()) {
						result = noticeNo; // result에 noticeNo 저장

					} else { // 파일 정보를 DB에 삽입하는데 실패했을 때
						throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
					}
				}else if(uploadImages.isEmpty()) { // 업로드된 이미지가 없을 경우
					System.out.println("called");
					result = noticeNo;
				}
			}
		}
		return result;
	}

	// 파일명 변경 메소드
	// ---------------------------------------------------------------------------------------------------------------------
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

	// summernote 업로드 이미지 저장 Service 구현
	// ---------------------------------------------------------------
	@Override
	public NoticeAttachment insertImage(MultipartFile uploadFile, String savePath) {

		// 파일명 변경
		String fileName = rename(uploadFile.getOriginalFilename());

		// 웹상 접근 주소
		String filePath = "/resources/infoImages/notice";

		// 돌려 보내줄 파일 정보를 Attachment 객체에 담아서 전달.
		NoticeAttachment at = new NoticeAttachment();
		at.setFilePath(filePath);
		at.setFileName(fileName);

		// 서버에 파일 저장 ( transferTo() )

		try {
			uploadFile.transferTo(new File(savePath + "/" + fileName));
			// ~~/infoImages / 202102~~~
		} catch (Exception e) {
			e.printStackTrace();

			throw new InsertAttachmentFailException("summernote 파일 업로드 실패");
		}

		return at;
	}

	
	// 게시글 수정 Service
	   @Override
	   public int updateNotice(Notice updateNotice) {
	      
	      // 게시글 수정
	      int result = dao.updateNotice(updateNotice);
	      
	      // 이미지 수정
	      if(result > 0) {
	         
	         List<NoticeAttachment> oldFiles = dao.selectAttachmentList(updateNotice.getNoticeNo());
	         List<NoticeAttachment> uploadImages = new ArrayList<NoticeAttachment>();
	         List<NoticeAttachment> removeFileList = new ArrayList<NoticeAttachment>();
	      
	         // DB에 저장할 웹상 이미지 접근 경로
	         String filePath = "/resources/infoImages/notice";
	      
	         // summernote로 작성된 게시글에 있는 이미지 정보 수정
	         //   -> 게시글 내부 <img> 태그의 src 속성을 얻어와 파일명을 얻어옴.
	         //   -> 수정 전 게시글 이미지와 수정 후 게시글 이미지 파일명을 비교
	         //   --> 새롭게 추가된 이미지, 기존 이미지에서 삭제된 것도 존재
	         //   --> Attachment 테이블에 반영
	         
	         Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // img태그 src추출 정규표현식
	         
	         Matcher matcher = pattern.matcher(updateNotice.getNoticeContent());
	         
	         List<String> fileNameList = new ArrayList<String>();
	         
	         String src = null; // matcher에 저장된 src를 꺼내서 임시 저장할 변수
	         String fileName = null; // src에서 파일명을 추출해서 임시 저장할 변수
	         
	         while(matcher.find()) {
	            src = matcher.group(1); // spring/findFriend/resources/findFriendImages/*.jpg
	            fileName = src.substring(src.lastIndexOf("/") + 1); // *.jpg
	            fileNameList.add(fileName);
	         }
	      
	         // DB에 새로 추가할 이미지파일 정보를 모아둘 List 생성
	         List<NoticeAttachment> newAttachmentList = new ArrayList<NoticeAttachment>();
	      
	         // DB에 삭제할 이미지 파일 번호를 모아둘 List 생성
	         List<Integer> deleteFileNoList = new ArrayList<Integer>();
	         
	         // 수정 된 게시글 파일명 목록(fileNameList)과
	         // 수정 전 파일 정보 목록(oldFiles)를 비교해서
	         // 수정 된 게시글 파일명 하나를 기준으로 하여 수정 전 파일명과 순차적으로 비교를 진행
	         // --> 수정 된 게시글 파일명과 일치하는 수정 전 파일명이 없다면
	         //   == 새로 삽입된 이미지임을 의미
	         for(String fName : fileNameList) {
	            
	            boolean flag = true;
	            
	            for(NoticeAttachment oldAt : oldFiles) {
	               
	               if(fName.equals(oldAt.getFileName())) { // 이미지가 수정되지 않은 경우
	                  flag = false;
	                  break;
	               }
	            }
	            
	            // 새로 삽입된  이미지가 존재할 경우 -> newAttachmentList에 추가
	            if(flag) {
	               NoticeAttachment at = new NoticeAttachment(filePath, fName, 1, updateNotice.getNoticeNo());
	               newAttachmentList.add(at);
	            }
	            
	         }
	         
	         // 수정 전 게시글 파일명 목록(oldFiles)과
	         // 수정 된  파일명 목록(fileNameList)를 비교해서
	         // 수정 전 게시글 파일명 하나를 기준으로 하여 수정 전 파일명과 순차적으로 비교를 진행
	         // --> 수정 전 게시글 파일명과 일치하는 수정 후 파일명이 없다면
	         //   == 기존 수정 전 이미지가 삭제됨을 의미
	         for(NoticeAttachment oldAt : oldFiles) {
	            
	            boolean flag = true;
	            
	            for(String fName : fileNameList) {
	               
	               if(oldAt.getFileName().equals(fName)) {
	                  flag = false;
	                  break;
	               }
	               
	            }
	            
	            // 삭제된  이미지가 존재할 경우 -> deleteFileNoList에 추가
	            if(flag) {
	               deleteFileNoList.add(oldAt.getFileNo());
	            }
	         }
	         
	         // newAttachmentList / deleteFileNoList 완성됨
	         if(!newAttachmentList.isEmpty()) { // 새로 삽입된 이미지가 있다면
	            result = dao.insertAttachmentList(newAttachmentList);
	            
	            if(result != newAttachmentList.size()) { // 삽입된 결과 행의 수와 삽입을 수행한 리스트 수가 맞지 않을 경우 == 실패
	               throw new InsertAttachmentFailException("파일 수정 실패(파일 정보 삽입 중 오류 발생)");
	            }
	         }
	         
	         if(!deleteFileNoList.isEmpty()) { // 삭제할 이미지가 있다면
	            result = dao.deleteAttachmentList(deleteFileNoList);
	            
	            if(result != deleteFileNoList.size()) {
	               throw new InsertAttachmentFailException("파일 수정 실패(파일 정보 삭제 중 오류 발생)");
	            }
	            
	         }
	         
	      }
	      
	      return result;
	   }

	   
	   
	   
	   
	// 게시글 삭제 Service 구현   
	@Override
	public int deleteNotice(int noticeNo) {
		
		int result = dao.deleteNotice(noticeNo);
		
		return result;
	}

	 
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
