package com.kh.RoundTheVillage.lesson.model.vo;

import java.sql.Timestamp;

public class LessonReviewReport {
	
	private int repNo;
	private String repContent;
	private Timestamp repDt;
	private String repYn;
	private int revNo;
	private int catCode;
	private int memberNo;
	
	public LessonReviewReport() {
		super();
	}

	public LessonReviewReport(int repNo, String repContent, Timestamp repDt, String repYn, int revNo, int catCode,
			int memberNo) {
		super();
		this.repNo = repNo;
		this.repContent = repContent;
		this.repDt = repDt;
		this.repYn = repYn;
		this.revNo = revNo;
		this.catCode = catCode;
		this.memberNo = memberNo;
	}

	public int getRepNo() {
		return repNo;
	}

	public void setRepNo(int repNo) {
		this.repNo = repNo;
	}

	public String getRepContent() {
		return repContent;
	}

	public void setRepContent(String repContent) {
		this.repContent = repContent;
	}

	public Timestamp getRepDt() {
		return repDt;
	}

	public void setRepDt(Timestamp repDt) {
		this.repDt = repDt;
	}

	public String getRepYn() {
		return repYn;
	}

	public void setRepYn(String repYn) {
		this.repYn = repYn;
	}

	public int getRevNo() {
		return revNo;
	}

	public void setRevNo(int revNo) {
		this.revNo = revNo;
	}

	public int getCatCode() {
		return catCode;
	}

	public void setCatCode(int catCode) {
		this.catCode = catCode;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	@Override
	public String toString() {
		return "LessonReport [repNo=" + repNo + ", repContent=" + repContent + ", repDt=" + repDt + ", repYn=" + repYn
				+ ", revNo=" + revNo + ", catCode=" + catCode + ", memberNo=" + memberNo + "]";
	}
}
