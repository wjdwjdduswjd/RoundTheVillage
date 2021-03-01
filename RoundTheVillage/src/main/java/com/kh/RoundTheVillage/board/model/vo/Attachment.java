package com.kh.RoundTheVillage.board.model.vo;

public class Attachment {

	private int fileNo;
	private String fileName;
	private String fileLevel;
	private int fileCreateDate;
	private int filePath;
	private int boardNo;
	
	
	 public Attachment() {
		// TODO Auto-generated constructor stub
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


	public String getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(String fileLevel) {
		this.fileLevel = fileLevel;
	}


	public int getFileCreateDate() {
		return fileCreateDate;
	}


	public void setFileCreateDate(int fileCreateDate) {
		this.fileCreateDate = fileCreateDate;
	}


	public int getFilePath() {
		return filePath;
	}


	public void setFilePath(int filePath) {
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
		return "Attachment [fileNo=" + fileNo + ", fileName=" + fileName + ", fileLevel=" + fileLevel
				+ ", fileCreateDate=" + fileCreateDate + ", filePath=" + filePath + ", boardNo=" + boardNo + "]";
	}

	 
	 
}
