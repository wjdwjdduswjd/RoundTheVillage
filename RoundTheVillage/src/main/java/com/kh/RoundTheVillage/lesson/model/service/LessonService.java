package com.kh.RoundTheVillage.lesson.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonDetail;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.lesson.model.vo.LessonQuestion;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReview;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReviewReport;
import com.kh.RoundTheVillage.shop.model.vo.Shop;

public abstract interface LessonService {

	public abstract String rename(String originFileName);
	
	public abstract Map<String, List> selectList(Map<String, Object> searchMap);
	
	public abstract int insertInfo(Lesson lesson);
	
	public abstract int insertDate(String[] date, String[] startTime, String[] endTime, String lesLimit, int lesNo);

	public abstract int insertImageFile(String savePath, MultipartFile mainimageFile, int lesNo);
	
	public abstract LessonFile insertImage(MultipartFile uploadFile, String savePath);
	
	public abstract int updateInfo(Lesson lesson);
	
//	public abstract int updateDate(String[] date, String[] startTime, String[] endTime, String lesLimit, int lesNo);
	
	public abstract int updateImageFile(String savePath, MultipartFile mainimageFile, int lesNo);
	
	public abstract int deleteLesson(int lesNo);
	
	public abstract Lesson selectLesson(int lesNo);
	
	public abstract int selectNextNo();

	public abstract LessonFile selectFile(int lesNo);
	
	public abstract Shop selectShopInfo(int shopNo);
	
	public abstract List<LessonDetail> selectDetailList(int lesNo);

	public abstract int insertReview(LessonReview review);

	public abstract List<LessonReview> selectReview(int lesNo);

	public abstract int updateReview(LessonReview review);

	public abstract int deleteReview(int revNo);

	public abstract List<LessonQuestion> selectQuestion(int lesNo);

	public abstract int insertQuestion(LessonQuestion question);
	
	public abstract int insertAnswer(LessonQuestion question);

	public abstract int deleteQuestion(int queNo);

	public abstract int updateQuestion(LessonQuestion question);

	public abstract int report(LessonReviewReport report);
	
}
