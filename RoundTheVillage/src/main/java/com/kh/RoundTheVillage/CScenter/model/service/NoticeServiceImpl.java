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
import com.kh.RoundTheVillage.CScenter.model.vo.Attachment;
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
	public List<Attachment> selectAttachmentList(int noticeNo) {
		return dao.selectAttachmentList(noticeNo);
	}

	
	
	// 게시글 삽입 Service --------------------------------------------------------------------------------
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertNotice(Map<String, Object> map, String savePath) {

		int result = 0; // 최종 결과 저장 변수 선언
		int noticeNo = dao.selectNextNo();
		
		//System.out.println("noticeNo"+noticeNo);

		if (noticeNo > 0) { // 다음 게시글 번호를 얻어온 경우
			map.put("noticeNo", noticeNo); // map에 noticeNo 추가
			result = dao.insertNotice(map);
			
			//System.out.println(map);
			
			if (result > 0) {
				List<Attachment> uploadImages = new ArrayList<Attachment>();

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

						Attachment at = new Attachment(filePath, fileName, 1, noticeNo);
						uploadImages.add(at);
					}
				

				// ------------------------------------------ summernote ------------------------------------------------------

				if (!uploadImages.isEmpty()) { // 업로드된 이미지가 있을 경우
					
					System.out.println(uploadImages);
					
					result = dao.insertAttachmentList(uploadImages);

					if (result == uploadImages.size()) {
						result = noticeNo; // result에 noticeNo 저장

					}else { // 파일 정보를 DB에 삽입하는데 실패했을 때
					throw new InsertAttachmentFailException("파일 정보 DB 삽입 실패");
				}
			} 
				
			else { // 업로드된 이미지가 없을 경우
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

	// summernote 업로드 이미지 저장 Service
	@Override
	public Attachment insertImage(MultipartFile uploadFile, String savePath) {

		// 파일명 변경
		String fileName = rename(uploadFile.getOriginalFilename());

		// 웹상 접근 주소
		String filePath = "/resources/infoImages/notice";

		// 돌려 보내줄 파일 정보를 Attachment 객체에 담아서 전달.
		Attachment at = new Attachment();
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
}
