package com.kh.RoundTheVillage.lesson.model.vo;

import java.sql.Timestamp;

public class LessonReview {
	
	private int revNo;
	private String revContent;
	private Timestamp revCreateDt;
	private int revRating;
	private int lesNo;
	private int memberNo;
	private String  reviewWriter;
	private String  reviewStatus;
	
	
	public LessonReview() {
		super();
	}

	

	public LessonReview(int revNo, String revContent, Timestamp revCreateDt, int revRating, int lesNo, int memberNo,
			String reviewWriter, String reviewStatus) {
		super();
		this.revNo = revNo;
		this.revContent = revContent;
		this.revCreateDt = revCreateDt;
		this.revRating = revRating;
		this.lesNo = lesNo;
		this.memberNo = memberNo;
		this.reviewWriter = reviewWriter;
		this.reviewStatus = reviewStatus;
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

	public String getReviewWriter() {
		return reviewWriter;
	}

	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}



	public String getReviewStatus() {
		return reviewStatus;
	}



	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}



	@Override
	public String toString() {
		return "LessonReview [revNo=" + revNo + ", revContent=" + revContent + ", revCreateDt=" + revCreateDt
				+ ", revRating=" + revRating + ", lesNo=" + lesNo + ", memberNo=" + memberNo + ", reviewWriter="
				+ reviewWriter + ", reviewStatus=" + reviewStatus + "]";
	}

	
	
}
