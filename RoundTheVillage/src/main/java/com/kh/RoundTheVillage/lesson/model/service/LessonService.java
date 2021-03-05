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
import com.kh.RoundTheVillage.lesson.model.vo.LessonQuestion;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReview;
import com.kh.RoundTheVillage.shop.model.vo.Shop;

@Service
public class LessonService {

	@Autowired
	LessonDAO dao;
	
	private String replaceParameter(String param) {
		String result = param;
		if(param != null) {
			result = result.replaceAll("&", "&amp;");
			result = result.replaceAll("<", "&lt;");
			result = result.replaceAll(">", "&gt;");
			result = result.replaceAll("\"", "&quot;");
		}
		return result;
	}

	public String rename(String originFileName) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyMMddHHmmss");
		String date = sdf.format(new java.util.Date(System.currentTimeMillis()));
		int ranNum = (int)(Math.random()*100000);
		String str = "_" + String.format("%05d", ranNum);
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

	public List<LessonDetail> selectDetailList(int lesNo) {
		return dao.selectDetailList(lesNo);
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertInfo(Lesson lesson) {
		lesson.setLesCurri(replaceParameter(lesson.getLesCurri()));
		lesson.setLesCurri(lesson.getLesCurri().replaceAll("\n", "<br>"));
		return dao.insertInfo(lesson);
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertDate(String[] date, String[] startTime, String[] endTime, String lesLimit, int lesNo) {
		int result = 0;
		for(int i=0; i<date.length; i++) {
			Map<String, String> map = new HashMap<String, String>();
			String lesTime = startTime[i] + "," + endTime[i];
			map.put("date", date[i]);
			map.put("lesTime", lesTime);
			map.put("lesLimit", lesLimit);
			map.put("lesNo", ""+lesNo);
			result = dao.insertDate(map);
		}
		return result;
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

	public Shop selectShopInfo(int shopNo) {
		return dao.selectShopInfo(shopNo);
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertReview(LessonReview review) {
		review.setRevContent(replaceParameter(review.getRevContent()));
		review.setRevContent(review.getRevContent().replaceAll("\n", "<br>"));
		return dao.insertReview(review);
	}

	public List<LessonReview> selectReview(int lesNo) {
		return dao.selectReview(lesNo);
	}

	@Transactional(rollbackFor = Exception.class)
	public int updateReview(LessonReview review) {
		review.setRevContent(replaceParameter(review.getRevContent()));
		review.setRevContent(review.getRevContent().replaceAll("\n", "<br>"));
		return dao.updateReview(review);
	}

	@Transactional(rollbackFor = Exception.class)
	public int deleteReview(int revNo) {
		return dao.deleteReview(revNo);
	}

	public List<LessonQuestion> selectQuestion(int lesNo) {
		return dao.selectQuestion(lesNo);
	}

	@Transactional(rollbackFor = Exception.class)
	public int insertQuestion(LessonQuestion question) {
		question.setQueContent(replaceParameter(question.getQueContent()));
		question.setQueContent(question.getQueContent().replaceAll("\n", "<br>"));
		return dao.insertQuetion(question);
	}
	
	@Transactional(rollbackFor = Exception.class)
	public int insertAnswer(LessonQuestion question) {
		question.setQueContent(replaceParameter(question.getQueContent()));
		question.setQueContent(question.getQueContent().replaceAll("\n", "<br>"));	
		return dao.insertAnswer(question);
	}

	@Transactional(rollbackFor = Exception.class)
	public int deleteQuestion(int queNo) {
		return dao.deleteQuestion(queNo);
	}

	@Transactional(rollbackFor = Exception.class)
	public int updateQuestion(LessonQuestion question) {
		question.setQueContent(replaceParameter(question.getQueContent()));
		question.setQueContent(question.getQueContent().replaceAll("\n", "<br>"));	
		return dao.updateQuestion(question);
	}

}
