package com.kh.RoundTheVillage.lesson.model.vo;

public class LessonFile {
	
	private String fileNo;
	private String filePath;
	private String fileName;
	private String lesNo;
	
	public LessonFile() {
		super();
	}
	
	public LessonFile(String fileNo, String filePath, String fileName, String lesNo) {
		super();
		this.fileNo = fileNo;
		this.filePath = filePath;
		this.fileName = fileName;
		this.lesNo = lesNo;
	}
	
	public String getFileNo() {
		return fileNo;
	}
	public void setFileNo(String fileNo) {
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
	public String getLesNo() {
		return lesNo;
	}
	public void setLesNo(String lesNo) {
		this.lesNo = lesNo;
	}
	
	@Override
	public String toString() {
		return "LessonFile [fileNo=" + fileNo + ", filePath=" + filePath + ", fileName=" + fileName + ", lesNo=" + lesNo
				+ "]";
	}
}
