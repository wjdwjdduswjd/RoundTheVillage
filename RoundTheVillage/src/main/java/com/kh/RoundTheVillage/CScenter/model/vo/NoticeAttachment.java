package com.kh.RoundTheVillage.CScenter.model.vo;

public class NoticeAttachment {
	
	private int fileNo;
	private String filePath;
	private String fileName;
	private int fileLevel;
	private int noticeNo;
	
	public NoticeAttachment() {
	}
	
	

	public NoticeAttachment(String filePath, String fileName, int fileLevel, int noticeNo) {
		super();
		this.filePath = filePath;
		this.fileName = fileName;
		this.fileLevel = fileLevel;
		this.noticeNo = noticeNo;
	}


	public int getFileNo() {
		return fileNo;
	}

	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
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


	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	@Override
	public String toString() {
		return "Attachment [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName + ", fileLevel="
				+ fileLevel + ", noticeNo=" + noticeNo + "]";
	}

	

	
	
	
}
