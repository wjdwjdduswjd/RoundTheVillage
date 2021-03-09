package com.kh.RoundTheVillage.manager.model.vo;

import java.sql.Timestamp;

public class ManagerReport {
	
	private int boardReportNo;
	private Timestamp boardReportDate;
	private String boardReportFl;
	private String boardReportContent;
	private int boardNo;
	private int memberNo;
	private String boardReportReason;
	private int categoryCode;
	private String categoryName;
	private String boardTitle;
	private String memberNickname;
	private int reportType;
	private String boardStatus;
	
	
	
	
	
	public ManagerReport() {
	}




	public ManagerReport(int boardReportNo, Timestamp boardReportDate, String boardReportFl, String boardReportContent,
			int boardNo, int memberNo, String boardReportReason, int categoryCode, String categoryName,
			String boardTitle, String memberNickname, int reportType, String boardStatus) {
		super();
		this.boardReportNo = boardReportNo;
		this.boardReportDate = boardReportDate;
		this.boardReportFl = boardReportFl;
		this.boardReportContent = boardReportContent;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.boardReportReason = boardReportReason;
		this.categoryCode = categoryCode;
		this.categoryName = categoryName;
		this.boardTitle = boardTitle;
		this.memberNickname = memberNickname;
		this.reportType = reportType;
		this.boardStatus = boardStatus;
	}




	public int getBoardReportNo() {
		return boardReportNo;
	}




	public void setBoardReportNo(int boardReportNo) {
		this.boardReportNo = boardReportNo;
	}




	public Timestamp getBoardReportDate() {
		return boardReportDate;
	}




	public void setBoardReportDate(Timestamp boardReportDate) {
		this.boardReportDate = boardReportDate;
	}




	public String getBoardReportFl() {
		return boardReportFl;
	}




	public void setBoardReportFl(String boardReportFl) {
		this.boardReportFl = boardReportFl;
	}




	public String getBoardReportContent() {
		return boardReportContent;
	}




	public void setBoardReportContent(String boardReportContent) {
		this.boardReportContent = boardReportContent;
	}




	public int getBoardNo() {
		return boardNo;
	}




	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}




	public int getMemberNo() {
		return memberNo;
	}




	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}




	public String getBoardReportReason() {
		return boardReportReason;
	}




	public void setBoardReportReason(String boardReportReason) {
		this.boardReportReason = boardReportReason;
	}




	public int getCategoryCode() {
		return categoryCode;
	}




	public void setCategoryCode(int categoryCode) {
		this.categoryCode = categoryCode;
	}




	public String getCategoryName() {
		return categoryName;
	}




	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}




	public String getBoardTitle() {
		return boardTitle;
	}




	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}




	public String getMemberNickname() {
		return memberNickname;
	}




	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}




	public int getReportType() {
		return reportType;
	}




	public void setReportType(int reportType) {
		this.reportType = reportType;
	}




	public String getBoardStatus() {
		return boardStatus;
	}




	public void setBoardStatus(String boardStatus) {
		this.boardStatus = boardStatus;
	}




	@Override
	public String toString() {
		return "ManagerReport [boardReportNo=" + boardReportNo + ", boardReportDate=" + boardReportDate
				+ ", boardReportFl=" + boardReportFl + ", boardReportContent=" + boardReportContent + ", boardNo="
				+ boardNo + ", memberNo=" + memberNo + ", boardReportReason=" + boardReportReason + ", categoryCode="
				+ categoryCode + ", categoryName=" + categoryName + ", boardTitle=" + boardTitle + ", memberNickname="
				+ memberNickname + ", reportType=" + reportType + ", boardStatus=" + boardStatus + "]";
	}



	

}
