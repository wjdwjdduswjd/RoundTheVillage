package com.kh.RoundTheVillage.lesson.model.vo;

import java.sql.Timestamp;

public class LessonQuestion {
	
	private int queNo;
	private Timestamp queDt;
	private String queContent;
	private int lesNo;
	private int memberNo;
	
	public LessonQuestion() {
		super();
	}
	
	public LessonQuestion(int queNo, Timestamp queDt, String queContent, int lesNo, int memberNo) {
		super();
		this.queNo = queNo;
		this.queDt = queDt;
		this.queContent = queContent;
		this.lesNo = lesNo;
		this.memberNo = memberNo;
	}
	
	public int getQueNo() {
		return queNo;
	}
	public void setQueNo(int queNo) {
		this.queNo = queNo;
	}
	public Timestamp getQueDt() {
		return queDt;
	}
	public void setQueDt(Timestamp queDt) {
		this.queDt = queDt;
	}
	public String getQueContent() {
		return queContent;
	}
	public void setQueContent(String queContent) {
		this.queContent = queContent;
	}
	public int getLesNo() {
		return lesNo;
	}
	public void setLesNo(int lesNo) {
		this.lesNo = lesNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	
	@Override
	public String toString() {
		return "LessonQuestion [queNo=" + queNo + ", queDt=" + queDt + ", queContent=" + queContent + ", lesNo=" + lesNo
				+ ", memberNo=" + memberNo + "]";
	}
}
