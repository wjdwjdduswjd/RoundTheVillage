package com.kh.RoundTheVillage.board.model.service;

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

import com.kh.RoundTheVillage.board.model.dao.BoardDAO;
import com.kh.RoundTheVillage.board.model.exception.InsertAttachmentFailException;
import com.kh.RoundTheVillage.board.model.vo.Attachment;
import com.kh.RoundTheVillage.board.model.vo.Board;
import com.kh.RoundTheVillage.board.model.vo.PageInfo;
import com.kh.RoundTheVillage.board.model.vo.Search;

@Service // 서비스임을 알려줌 + bean 등록
public class BoardServiceImpl implements BoardService {

	// DAO 객체 의존성 주입
	@Autowired
	private BoardDAO dao;

	// 전체 게시글 수 조회
	@Override
	public PageInfo getPageInfo(int cp, String ct) {

		int listCount = dao.getListCount(ct);

		return new PageInfo(cp, listCount);
	}

	// 게시글 목록 조회
	@Override
	public List<Board> selectList(PageInfo pInfo, String ct) {
		return dao.selectList(pInfo, ct);
	}

	// 썸네일 목록 조회
	@Override
	public List<Attachment> selectThumbnailList(List<Board> bList) {
		// TODO Auto-generated method stub
		return dao.selectThumbnailList(bList);
	}

	// 게시글 상세 조회
	@Transactional(rollbackFor = Exception.class)
	@Override
	public Board selectBoard(int boardNo) {

		Board board = dao.selectBoard(boardNo);

		// 2) 상세 조회 성공 시 조회수 증가
		if (board != null) {
			int result = dao.increaseReadCount(boardNo);

			if (result > 0) { // DB 조회 수 증가 성공 시
				// 먼저 조회된 board의 조회 수도 1 증가
				board.setReadCount(board.getReadCount() + 1);

			}
		}

		return board;
	}

	@Override
	public List<Attachment> selectAttachmentList(int boardNo) {
		return dao.selectAttachmentList(boardNo);
	}

	// 게시글 삽입 Service
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertBoard(Map<String, Object> map, List<MultipartFile> images, String savePath) {

		int result = 0;

		int boardNo = dao.selectNextNo();

		if (boardNo > 0) {
			map.put("boardNo", boardNo);

			String boardTitle = (String) map.get("boardTitle");
			// String boardContent = (String)map.get("boardContent");

			boardTitle = replaceParameter(boardTitle);
			// boardContent = replaceParameter(boardContent);

			map.put("boardTitle", boardTitle);
			// map.put("boardContent", boardContent);

			result = dao.insertBoard(map);

		}

		if (result > 0) {

			List<Attachment> uploadImages = new ArrayList<Attachment>();

			String filePath = "/resources/boardImages";

			for (int i = 0; i < images.size(); i++) {
				// i == 인덱스 == fileLevel과 같은 값

				// 현재 접근한 images의 요소(MultipartFile)에 업로드 된 파일이 있는지 확인
				if (!images.get(i).getOriginalFilename().equals("")) {
					// 파일이 업로드 된 경우 == 업로드 된 원본 파일명이 있는 경우

					// 원본파일명 변경
					String fileName = rename(images.get(i).getOriginalFilename());

					Attachment at = new Attachment(filePath, fileName, i, boardNo);

					uploadImages.add(at);

				}
			}

			Pattern pattern = Pattern.compile("<img[^>]*src=[\"']?([^>\"']+)[\"']?[^>]*>"); // img 태그 src 추출 정규표현식

			// SummerNote에 작성된 내용 중 img태그의 src속성의 값을 검사하여 매칭되는 값을 Matcher객체에 저장함.
			Matcher matcher = pattern.matcher((String) map.get("boardContent"));

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
				Attachment at = new Attachment(filePath, fileName, 1, boardNo);
				uploadImages.add(at);
			}

			if (!uploadImages.isEmpty()) { // 업로드 된 이미지가 있을 경우
				// 파일 정보 삽입 DAO 호출
				result = dao.insertAttachmentList(uploadImages);
				// result == 삽입된 행의 개수

				// 모든 데이터가 정상 삽입 되었을 경우 --> 서버에 파일 저장
				if (result == uploadImages.size()) {

					result = boardNo; // result에 boardNo 저장

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
				result = boardNo;
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
	
	// 게시글 수정 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int updateBoard(Board updateBoard, List<MultipartFile> images, String savePath, boolean[] deleteImages) {

		updateBoard.setBoardTitle(replaceParameter(updateBoard.getBoardTitle()));
		updateBoard.setBoardContent(replaceParameter(updateBoard.getBoardContent()));
		
		int result = dao.updateBoard(updateBoard);
		
		
		
		
		return 0;
	}
	
	
	
	
	
	
	

	@Override
	public Attachment insertImage(MultipartFile uploadFile, String savePath) {
		String fileName = rename(uploadFile.getOriginalFilename());

		// 웹상 접근 주소
		String filePath = "/resources/boardImages";

		// 돌려 보내줄 파일 정보를 Attachment 객체에 담아서 전달.
		Attachment at = new Attachment();
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

	@Override
	public List<Board> selectClass(int memberNo) {
		return dao.selectClass(memberNo);
	}

	// 좋아요 여부 확인 Service 구현
	@Override
	public int selectLikeFl(Map<String, Integer> map) {
		return dao.selectLikeFl(map);
	}

	// 좋아요 삽입 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int insertLike(Map<String, Integer> map) {
		return dao.insertLike(map);
	}
	
	
	// 좋아요 삭제 Service 구현
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int deleteLike(Map<String, Integer> map) {
		return dao.deleteLike(map);
	}

	// 좋아요 카운트 Service 구현
	@Override
	public int selectLikeCount(int boardNo) {
		return dao.selectLikeCount(boardNo);
	}
	// 게시글 신고 중복검사 Service 구현
	@Override
	public int findReport(Map<String, Object> map) {
		return dao.findReport(map);
	}

	// 게시글 신고 Service 구현
	@Override
	public int reportBoard(Map<String, Object> map) {
		return dao.reportBoard(map);
	}

	// 검색어 포함 게시글 개수 조회 Service 구현
	@Override
	public PageInfo selectSearchListCount(Search search, int cp) {
		int listCount =  dao.selectSearchListCount(search);
		return new PageInfo(cp, listCount);
	}

	// 검색어 포함 게시글 목록 조회 Service
	@Override
	public List<Board> selectSearchList(PageInfo pInfo, Search search) {
		return dao.selectSearchList(pInfo, search);
	}


	
	
	
	
	
	
	
	
	
}
