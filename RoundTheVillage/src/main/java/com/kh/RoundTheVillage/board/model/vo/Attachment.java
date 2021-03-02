package com.kh.RoundTheVillage.board.model.vo;

import java.sql.Timestamp;

public class Attachment {

	private int fileNo;
	private String fileName;
	private int fileLevel;
	/* private Timestamp fileCreateDate; */
	private String filePath;
	private int boardNo;
	

	 
	public Attachment() {
		// TODO Auto-generated constructor stub
	}

	public Attachment(String filePath, String fileName, int fileLevel, int boardNo) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.boardNo = boardNo;
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getFileName() {
		return fileName;
	}


	public void setFileName(String fileName) {
		this.fileName = fileName;
	}


	public int getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}


	/*
	 * public Timestamp getFileCreateDate() { return fileCreateDate; }
	 * 
	 * 
	 * public void setFileCreateDate(Timestamp fileCreateDate) { this.fileCreateDate
	 * = fileCreateDate; }
	 */

	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", fileName=" + fileName + ", fileLevel=" + fileLevel + ", filePath="
				+ filePath + ", boardNo=" + boardNo + "]";
	}




	 















	 
	 
}
