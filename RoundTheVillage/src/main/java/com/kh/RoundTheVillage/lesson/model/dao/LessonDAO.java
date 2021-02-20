package com.kh.RoundTheVillage.lesson.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.RoundTheVillage.lesson.model.vo.Lesson;

@Repository
public class LessonDAO {

	@Autowired
	SqlSessionTemplate session;
	
	public Lesson selectLesson(int lessonNo) {
		System.out.println("123123");
		return null;
		//return session.selectOne("lessonMapper.selectLesson");
	}

}
