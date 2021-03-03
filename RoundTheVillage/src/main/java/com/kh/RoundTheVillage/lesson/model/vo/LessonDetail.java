package com.kh.RoundTheVillage.lesson.model.vo;

public class LessonDetail {
	private int lesNo;
	private int lesLimit;
	private int lesParticipant;
	private int lesDate;
	private String lesTime;
	
	public LessonDetail() {
		super();
	}

	public LessonDetail(int lesNo, int lesLimit, int lesParticipant, int lesDate, String lesTime) {
		super();
		this.lesNo = lesNo;
		this.lesLimit = lesLimit;
		this.lesParticipant = lesParticipant;
		this.lesDate = lesDate;
		this.lesTime = lesTime;
	}

	public int getLesNo() {
		return lesNo;
	}

	public void setLesNo(int lesNo) {
		this.lesNo = lesNo;
	}

	public int getLesLimit() {
		return lesLimit;
	}

	public void setLesLimit(int lesLimit) {
		this.lesLimit = lesLimit;
	}

	public int getLesParticipant() {
		return lesParticipant;
	}

	public void setLesParticipant(int lesParticipant) {
		this.lesParticipant = lesParticipant;
	}

	public int getLesDate() {
		return lesDate;
	}

	public void setLesDate(int lesDate) {
		this.lesDate = lesDate;
	}

	public String getLesTime() {
		return lesTime;
	}

	public void setLesTime(String lesTime) {
		this.lesTime = lesTime;
	}

	@Override
	public String toString() {
		return "LessonDetail [lesNo=" + lesNo + ", lesLimit=" + lesLimit + ", lesParticipant=" + lesParticipant
				+ ", lesDate=" + lesDate + ", lesTime=" + lesTime + "]";
	}
}
