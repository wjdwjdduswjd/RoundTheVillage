package com.kh.RoundTheVillage.lesson.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonDetail;
import com.kh.RoundTheVillage.lesson.model.vo.LessonFile;
import com.kh.RoundTheVillage.lesson.model.vo.LessonQuestion;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReview;
import com.kh.RoundTheVillage.lesson.model.vo.LessonReviewReport;
import com.kh.RoundTheVillage.shop.model.vo.Shop;

@Repository
public class LessonDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public int selectNextNo() {
		return session.selectOne("lessonMapper.selectNextNo");
	}
	
	public Map<String, List> selectList(Map<String, Object> searchMap) {
		Map<String, List> map = new HashMap<String, List>();
		List<Lesson> list = new ArrayList<Lesson>();
		List<LessonFile> fileList = new ArrayList<LessonFile>();
		List<Shop> shopList = new ArrayList<>();
		List<Lesson> sumParti = new ArrayList<>();
		list = session.selectList("lessonMapper.selectList", searchMap);
		fileList = session.selectList("lessonMapper.selectFileList");
		shopList = session.selectList("shopMapper.selectShopList");
		sumParti = session.selectList("lessonMapper.selectSumParti");
		map.put("list", list);
		map.put("fileList", fileList);
		map.put("shopList", shopList);
		map.put("sumParti", sumParti);
		return map;
	}

	public Lesson selectLesson(int lesNo) {
		return session.selectOne("lessonMapper.selectLesson", lesNo);
	}

	public List<LessonDetail> selectDetailList(int lesNo) {
		return session.selectList("lessonMapper.selectDetailList", lesNo);
	}

	public int insertInfo(Lesson lesson) {
		return session.insert("lessonMapper.insertInfo", lesson);
	}
	
	public int insertDate(Map<String, String> map) {
		return session.insert("lessonMapper.insertDate", map);
	}

	public int insertImageFile(Map<String, String> map) {
		return session.insert("lessonMapper.insertImageFile", map);
	}
	
	public int updateInfo(Lesson lesson) {
		return session.update("lessonMapper.updateInfo", lesson);
	}
	
	public int updateDate(Map<String, String> map) {
		return session.update("lessonMapper.updateDate", map);
	}
	
	public int updateImageFile(Map<String, String> map) {
		return session.update("lessonMapper.updateImageFile", map);
	}

	public LessonFile selectFile(int lesNo) {
		return session.selectOne("lessonMapper.selectFile", lesNo);
	}
	
	public int deleteLesson(int lesNo) {
		return session.update("lessonMapper.deleteLesson", lesNo);
	}

	public Shop selectShopInfo(int shopNo) {
		return session.selectOne("shopMapper.selectShopInfo", shopNo);
	}

	public int insertReview(LessonReview review) {
		return session.insert("lessonMapper2.insertReview", review);
	}

	public List<LessonReview> selectReview(int lesNo) {
		return session.selectList("lessonMapper2.selectReview", lesNo);
	}

	public int updateReview(LessonReview review) {
		return session.update("lessonMapper2.updateReview", review);
	}

	public int deleteReview(int revNo) {
		return session.delete("lessonMapper2.deleteReview", revNo);
	}

	public List<LessonQuestion> selectQuestion(int lesNo) {
		return session.selectList("lessonMapper2.selectQuestion", lesNo);
	}

	public int insertQuetion(LessonQuestion question) {
		return session.insert("lessonMapper2.insertQuestion", question);
	}

	public int insertAnswer(LessonQuestion question) {
		return session.insert("lessonMapper2.insertAnswer", question);
	}

	public int deleteQuestion(int queNo) {
		return session.delete("lessonMapper2.deleteQuestion", queNo);
	}

	public int updateQuestion(LessonQuestion question) {
		return session.update("lessonMapper2.updateQuestion", question);
	}

	public int report(LessonReviewReport report) {
		return session.insert("lessonMapper2.insertReport", report);
	}
}
