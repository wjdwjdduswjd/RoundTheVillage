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
	
	
	public ManagerReport() {
		// TODO Auto-generated constructor stub
	}


	public ManagerReport(int boardReportNo, Timestamp boardReportDate, String boardReportFl, String boardReportContent,
			int boardNo, int memberNo, String boardReportReason) {
		super();
		this.boardReportNo = boardReportNo;
		this.boardReportDate = boardReportDate;
		this.boardReportFl = boardReportFl;
		this.boardReportContent = boardReportContent;
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.boardReportReason = boardReportReason;
	}


	@Override
	public String toString() {
		return "ManagerReport [boardReportNo=" + boardReportNo + ", boardReportDate=" + boardReportDate
				+ ", boardReportFl=" + boardReportFl + ", boardReportContent=" + boardReportContent + ", boardNo="
				+ boardNo + ", memberNo=" + memberNo + ", boardReportReason=" + boardReportReason + "]";
	}
	
	

}
