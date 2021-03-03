package com.kh.RoundTheVillage.lesson.model.service;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.lesson.model.dao.LessonDAO;
import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonDetail;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.shop.model.vo.Shop;

@Service
public class LessonService {

	@Autowired
	LessonDAO dao;

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
	
	public List<Lesson> selectList() {
		return dao.selectList();
	}
	
	public List<LessonFile> selectFileList() {
		return dao.selectFileList();
	}
	
	public List<Shop> selectShopList() {
		return dao.selectShopList();
	}
	
	public Lesson selectLesson(int lesNo) {
		return dao.selectLesson(lesNo);
	}

	public List<LessonDetail> selectDateList(int lesNo) {
		return dao.selectDateList(lesNo);
	}

	public int insert(Map<String, Object> map) {
		return 0;
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertInfo(Lesson lesson) {
		return dao.insertInfo(lesson);
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertDate(String[] date, String[] startTime, String[] endTime, String lesLimit, int lesNo) {
		for(int i=0; i<date.length; i++) {
			Map<String, String> map = new HashMap<String, String>();
			String lesTime = startTime[i] + "," + endTime[i];
			map.put("date", date[i]);
			map.put("lesTime", lesTime);
			map.put("lesLimit", lesLimit);
			map.put("lesNo", ""+lesNo);
			int result = dao.insertDate(map);
		}
		return 0;
	}

	@Transactional(rollbackFor = Exception.class)
	public LessonFile insertImage(MultipartFile uploadFile, String savePath) {
		String filePath = "/resources/images/lesson";
		String fileName = rename(uploadFile.getOriginalFilename());
		LessonFile file = new LessonFile();
		file.setFilePath(filePath);
		file.setFileName(fileName);
		try {
			uploadFile.transferTo(new File(savePath + "/" + fileName));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return file;
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertImageFile(String savePath, MultipartFile mainimageFile, int lesNo) {
		String filePath = "/resources/images/lesson";
		String fileName = rename(mainimageFile.getOriginalFilename());
		Map<String, String> map = new HashMap<String, String>();
		map.put("filePath", filePath);
		map.put("fileName", fileName);
		map.put("lesNo", ""+lesNo);
		int result = dao.insertImageFile(map);
		
		LessonFile file = new LessonFile();
		file.setFilePath(filePath);
		file.setFileName(fileName);
		try {
			mainimageFile.transferTo(new File(savePath + "/" + fileName));
		} catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public int selectNextNo() {
		return dao.selectNextNo();
	}

	public List<Lesson> selectSumParti() {
		return dao.selectSumParti();
	}

	public LessonFile selectFile(int lesNo) {
		return dao.selectFile(lesNo);
	}


}
