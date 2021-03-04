package com.kh.RoundTheVillage.lesson.model.vo;

import java.sql.Timestamp;

public class LessonReview {
	
	private int revNo;
	private String revContent;
	private Timestamp revCreateDt;
	private int revRating;
	private int lesNo;
	private int memberNo;
	
	public LessonReview() {
		super();
	}

	public LessonReview(int revNo, String revContent, Timestamp revCreateDt, int revRating, int lesNo, int memberNo) {
		super();
		this.revNo = revNo;
		this.revContent = revContent;
		this.revCreateDt = revCreateDt;
		this.revRating = revRating;
		this.lesNo = lesNo;
		this.memberNo = memberNo;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public String getRevContent() {
		return revContent;
	}

	public void setRevContent(String revContent) {
		this.revContent = revContent;
	}

	public Timestamp getRevCreateDt() {
		return revCreateDt;
	}

	public void setRevCreateDt(Timestamp revCreateDt) {
		this.revCreateDt = revCreateDt;
	}

	public int getRevRating() {
		return revRating;
	}

	public void setRevRating(int revRating) {
		this.revRating = revRating;
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
		return "LessonRating [revNo=" + revNo + ", revContent=" + revContent + ", revCreateDt=" + revCreateDt
				+ ", revRating=" + revRating + ", lesNo=" + lesNo + ", memberNo=" + memberNo + "]";
	}
}
