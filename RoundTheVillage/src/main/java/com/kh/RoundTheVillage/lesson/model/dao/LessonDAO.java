package com.kh.RoundTheVillage.lesson.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.lesson.model.vo.Lesson;
import com.kh.RoundTheVillage.lesson.model.vo.LessonDetail;

@Repository
public class LessonDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public List<Lesson> selectList() {
		return session.selectList("lessonMapper.selectList");
	}
	
	public Lesson selectLesson(int lesNo) {
		return session.selectOne("lessonMapper.selectLesson", lesNo);
	}

	public List<LessonDetail> selectDateList(int lesNo) {
		return session.selectList("lessonMapper.selectDateList", lesNo);
	}

	public int insertInfo(Lesson lesson) {
		return session.insert("lessonMapper.insertInfo", lesson);
	}
	
	public int insertDate(Map<String, String> map) {
		return session.insert("lessonMapper.insertDate", map);
	}
}
