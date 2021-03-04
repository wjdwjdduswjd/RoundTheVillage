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

	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertNotice(Map<String, Object> map, List<MultipartFile> images, String savePath) {

		int result = 0;

		int noticeNo = dao.selectNextNo();

		result = dao.insertNotice(map);

		if (noticeNo > 0) {
			map.put("noticeNo", noticeNo);
			System.out.println("noticeNo : " + noticeNo);

			String noticeTitle = (String) map.get("noticeTitle");
			String noticeContent = (String) map.get("noticeContent");

			noticeTitle = replaceParameter(noticeTitle);
			noticeContent = replaceParameter(noticeContent);

			map.put("noticeTitle", noticeTitle);
			map.put("noticeContent", noticeContent);

			result = dao.insertNotice(map);

		}

		if (result > 0) {

			List<Attachment> uploadImages = new ArrayList<Attachment>();

			String filePath = null;
			result = noticeNo;
		}
		return result;
	}

	// 크로스 사이트 스크립트 방지 처리 메소드
	private String replaceParameter(String param) {
		String result = param;
		if (param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
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
	      String filePath = "/resources/infoImages";
	      
	      // 돌려 보내줄 파일 정보를 Attachment 객체에 담아서 전달.
	      Attachment at = new Attachment();
	      at.setFilePath(filePath);
	      at.setFileName(fileName);
	      
	      // 서버에 파일 저장 ( transferTo() )
	      
	      try {
	         uploadFile.transferTo( new File( savePath + "/" + fileName ) );
	                              // ~~/infoImages   /   202102~~~
	      } catch (Exception e) {
	         e.printStackTrace();
	         
	         throw new InsertAttachmentFailException("summernote 파일 업로드 실패");
	      }
	      
	      return at;
	   }
}
