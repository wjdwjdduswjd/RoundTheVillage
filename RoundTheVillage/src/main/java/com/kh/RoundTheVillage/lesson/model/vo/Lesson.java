package com.kh.RoundTheVillage.lesson.model.vo;

public class Lesson {
	
	private int lesNo;
	private String lesTitle;
	private String lesContent;
	private String lesCurri;
	private int lesPrice;
	private String lesCategory;
	private String lesFl;
	private int craftshopNo;
	
	public Lesson() {
		super();
	}
	
	public Lesson(int lesNo, String lesTitle, String lesContent, String lesCurri, int lesPrice, String lesCategory,
			String lesFl, int craftshopNo) {
		super();
		this.lesNo = lesNo;
		this.lesTitle = lesTitle;
		this.lesContent = lesContent;
		this.lesCurri = lesCurri;
		this.lesPrice = lesPrice;
		this.lesCategory = lesCategory;
		this.lesFl = lesFl;
		this.craftshopNo = craftshopNo;
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
	public int getLesPrice() {
		return lesPrice;
	}
	public void setLesPrice(int lesPrice) {
		this.lesPrice = lesPrice;
	}
	public String getLesCategory() {
		return lesCategory;
	}
	public void setLesCategory(String lesCategory) {
		this.lesCategory = lesCategory;
	}
	public String getLesFl() {
		return lesFl;
	}
	public void setLesFl(String lesFl) {
		this.lesFl = lesFl;
	}
	public int getCraftshopNo() {
		return craftshopNo;
	}
	public void setCraftshopNo(int craftshopNo) {
		this.craftshopNo = craftshopNo;
	}
	
	@Override
	public String toString() {
		return "Lesson [lesNo=" + lesNo + ", lesTitle=" + lesTitle + ", lesContent=" + lesContent + ", lesCurri="
				+ lesCurri + ", lesPrice=" + lesPrice + ", lesCategory=" + lesCategory + ", lesFl=" + lesFl
				+ ", craftshopNo=" + craftshopNo + "]";
	}
}
