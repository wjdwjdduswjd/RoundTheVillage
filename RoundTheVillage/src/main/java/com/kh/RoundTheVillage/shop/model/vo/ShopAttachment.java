package com.kh.RoundTheVillage.shop.model.vo;

public class ShopAttachment {
	
	private int fileLevel; // 파일 레빌
	private int fileNo; // 공방 관련 파일 번호
	private String filePath; // 공방관련 파일 경로
	private String fileName; // 공방 관련 파일 이름
	private int shopNo; // 공방 번호
	
	public ShopAttachment() {
		// TODO Auto-generated constructor stub
	}
	
	

	public ShopAttachment(int fileLevel, String filePath, String fileName, int shopNo) {
		super();
		this.fileLevel = fileLevel;
		this.filePath = filePath;
		this.fileName = fileName;
		this.shopNo = shopNo;
	}



	/**
	 * @return the fileLevel
	 */
	public int getFileLevel() {
		return fileLevel;
	}

	/**
	 * @param fileLevel the fileLevel to set
	 */
	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}

	/**
	 * @return the fileNo
	 */
	public int getFileNo() {
		return fileNo;
	}

	/**
	 * @param fileNo the fileNo to set
	 */
	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}

	/**
	 * @return the filePath
	 */
	public String getFilePath() {
		return filePath;
	}

	/**
	 * @param filePath the filePath to set
	 */
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return fileName;
	}

	/**
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/**
	 * @return the shopNo
	 */
	public int getShopNo() {
		return shopNo;
	}

	/**
	 * @param shopNo the shopNo to set
	 */
	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}

	@Override
	public String toString() {
		return "ShopAttachment [fileLevel=" + fileLevel + ", fileNo=" + fileNo + ", "
				+ (filePath != null ? "filePath=" + filePath + ", " : "")
				+ (fileName != null ? "fileName=" + fileName + ", " : "") + "shopNo=" + shopNo + "]";
	}
	
	
	


}
