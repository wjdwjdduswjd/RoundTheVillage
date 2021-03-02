package com.kh.RoundTheVillage.shop.model.vo;

public class ShopAttachment {
	
	private int FileNo; // 공방 관련 파일 번호
	private String FilePath; // 공방관련 파일 경로
	private String FileName; // 공방 관련 파일 이름
	private int shopNo; // 공방 번호
	
	
	public ShopAttachment() {}


	public ShopAttachment(int fileNo, String filePath, String fileName, int shopNo) {
		super();
		FileNo = fileNo;
		FilePath = filePath;
		FileName = fileName;
		this.shopNo = shopNo;
	}


	/**
	 * @return the fileNo
	 */
	public int getFileNo() {
		return FileNo;
	}


	/**
	 * @param fileNo the fileNo to set
	 */
	public void setFileNo(int fileNo) {
		FileNo = fileNo;
	}


	/**
	 * @return the filePath
	 */
	public String getFilePath() {
		return FilePath;
	}


	/**
	 * @param filePath the filePath to set
	 */
	public void setFilePath(String filePath) {
		FilePath = filePath;
	}


	/**
	 * @return the fileName
	 */
	public String getFileName() {
		return FileName;
	}


	/**
	 * @param fileName the fileName to set
	 */
	public void setFileName(String fileName) {
		FileName = fileName;
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
		return "ShopAttachment [FileNo=" + FileNo + ", FilePath=" + FilePath + ", FileName=" + FileName + ", shopNo="
				+ shopNo + "]";
	}

	
	


}
