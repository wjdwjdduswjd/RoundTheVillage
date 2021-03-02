package com.kh.RoundTheVillage.shop.model.vo;

public class ShopAttachment {
	
	private int shopFileNo; // 공방 관련 파일 번호
	private String shopFilePath; // 공방관련 파일 경로
	private String shopFileName; // 공방 관련 파일 이름
	private int shopNo; // 공방 번호
	
	
	public ShopAttachment() {}


	public ShopAttachment(int shopFileNo, String shopFilePath, String shopFileName, int shopNo) {
		super();
		this.shopFileNo = shopFileNo;
		this.shopFilePath = shopFilePath;
		this.shopFileName = shopFileName;
		this.shopNo = shopNo;
	}


	/**
	 * @return the shopFileNo
	 */
	public int getShopFileNo() {
		return shopFileNo;
	}


	/**
	 * @param shopFileNo the shopFileNo to set
	 */
	public void setShopFileNo(int shopFileNo) {
		this.shopFileNo = shopFileNo;
	}


	/**
	 * @return the shopFilePath
	 */
	public String getShopFilePath() {
		return shopFilePath;
	}


	/**
	 * @param shopFilePath the shopFilePath to set
	 */
	public void setShopFilePath(String shopFilePath) {
		this.shopFilePath = shopFilePath;
	}


	/**
	 * @return the shopFileName
	 */
	public String getShopFileName() {
		return shopFileName;
	}


	/**
	 * @param shopFileName the shopFileName to set
	 */
	public void setShopFileName(String shopFileName) {
		this.shopFileName = shopFileName;
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
		return "ShopAttachment [shopFileNo=" + shopFileNo + ", shopFilePath=" + shopFilePath + ", shopFileName="
				+ shopFileName + ", shopNo=" + shopNo + "]";
	}
	
	

}
