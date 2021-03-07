package com.kh.RoundTheVillage.lesson.model.vo;

import java.sql.Timestamp;

public class LessonQuestion {
	
	private int queNo;
	private Timestamp queDt;
	private String queContent;
	private int lesNo;
	private int memberNo;
	private String queType;
	private int queParentNo;
	private String queWriter;
	
	public LessonQuestion() {
		super();
	}

	public LessonQuestion(int queNo, Timestamp queDt, String queContent, int lesNo, int memberNo, String queType,
			int queParentNo, String queWriter) {
		super();
		this.queNo = queNo;
		this.queDt = queDt;
		this.queContent = queContent;
		this.lesNo = lesNo;
		this.memberNo = memberNo;
		this.queType = queType;
		this.queParentNo = queParentNo;
		this.queWriter = queWriter;
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

	public String getQueType() {
		return queType;
	}

	public void setQueType(String queType) {
		this.queType = queType;
	}

	public int getQueParentNo() {
		return queParentNo;
	}

	public void setQueParentNo(int queParentNo) {
		this.queParentNo = queParentNo;
	}

	public String getQueWriter() {
		return queWriter;
	}

	public void setQueWriter(String queWriter) {
		this.queWriter = queWriter;
	}

	@Override
	public String toString() {
		return "LessonQuestion [queNo=" + queNo + ", queDt=" + queDt + ", queContent=" + queContent + ", lesNo=" + lesNo
				+ ", memberNo=" + memberNo + ", queType=" + queType + ", queParentNo=" + queParentNo + ", queWriter="
				+ queWriter + "]";
	}
}
