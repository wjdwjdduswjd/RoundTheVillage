package com.kh.RoundTheVillage.lesson.model.vo;

import java.sql.Timestamp;

public class Lesson {
	
	private int lesNo;
	private String lesTitle;
	private String lesContent;
	private String lesCurri;
	private Timestamp lesDate;
	private int lesParticipant;
	private int lesCount;
	private int lesPrice;
	private int lesLength;
	private int craftshopNo;
	private String lesFl;
	
	
	public Lesson() {
		super();
	}

	public Lesson(int lesNo, String lesTitle, String lesContent, String lesCurri, Timestamp lesDate, int lesParticipant,
			int lesCount, int lesPrice, int lesLength, int craftshopNo, String lesFl) {
		super();
		this.lesNo = lesNo;
		this.lesTitle = lesTitle;
		this.lesContent = lesContent;
		this.lesCurri = lesCurri;
		this.lesDate = lesDate;
		this.lesParticipant = lesParticipant;
		this.lesCount = lesCount;
		this.lesPrice = lesPrice;
		this.lesLength = lesLength;
		this.craftshopNo = craftshopNo;
		this.lesFl = lesFl;
	}

	public int getLesNo() {
		return lesNo;
	}

	public void setLesNo(int lesNo) {
		this.lesNo = lesNo;
	}

	public String getLesTitle() {
		return lesTitle;
	}

	public void setLesTitle(String lesTitle) {
		this.lesTitle = lesTitle;
	}

	public String getLesContent() {
		return lesContent;
	}

	public void setLesContent(String lesContent) {
		this.lesContent = lesContent;
	}

	public String getLesCurri() {
		return lesCurri;
	}

	public void setLesCurri(String lesCurri) {
		this.lesCurri = lesCurri;
	}

	public Timestamp getLesDate() {
		return lesDate;
	}

	public void setLesDate(Timestamp lesDate) {
		this.lesDate = lesDate;
	}

	public int getLesParticipant() {
		return lesParticipant;
	}

	public void setLesParticipant(int lesParticipant) {
		this.lesParticipant = lesParticipant;
	}

	public int getLesCount() {
		return lesCount;
	}

	public void setLesCount(int lesCount) {
		this.lesCount = lesCount;
	}

	public int getLesPrice() {
		return lesPrice;
	}

	public void setLesPrice(int lesPrice) {
		this.lesPrice = lesPrice;
	}

	public int getLesLength() {
		return lesLength;
	}

	public void setLesLength(int lesLength) {
		this.lesLength = lesLength;
	}

	public int getCraftshopNo() {
		return craftshopNo;
	}

	public void setCraftshopNo(int craftshopNo) {
		this.craftshopNo = craftshopNo;
	}

	public String getLesFl() {
		return lesFl;
	}

	public void setLesFl(String lesFl) {
		this.lesFl = lesFl;
	}

	@Override
	public String toString() {
		return "Lesson [lesNo=" + lesNo + ", lesTitle=" + lesTitle + ", lesContent=" + lesContent + ", lesCurri="
				+ lesCurri + ", lesDate=" + lesDate + ", lesParticipant=" + lesParticipant + ", lesCount=" + lesCount
				+ ", lesPrice=" + lesPrice + ", lesLength=" + lesLength + ", craftshopNo=" + craftshopNo + ", lesFl="
				+ lesFl + "]";
	}
}
