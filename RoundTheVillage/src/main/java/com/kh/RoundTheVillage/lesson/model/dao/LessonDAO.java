package com.kh.RoundTheVillage.lesson.model.dao;

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
import com.kh.RoundTheVillage.shop.model.vo.Shop;

@Repository
public class LessonDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public int selectNextNo() {
		return session.selectOne("lessonMapper.selectNextNo");
	}
	
	public List<Lesson> selectList() {
		return session.selectList("lessonMapper.selectList");
	}

	public List<LessonFile> selectFileList() {
		return session.selectList("lessonMapper.selectFileList");
	}
	
	public List<Shop> selectShopList() {
		return session.selectList("shopMapper.selectShopList");
	}
	
	public List<Lesson> selectSumParti() {
		return session.selectList("lessonMapper.selectSumParti");
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

	public LessonFile selectFile(int lesNo) {
		return session.selectOne("lessonMapper.selectFile", lesNo);
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
	
}
