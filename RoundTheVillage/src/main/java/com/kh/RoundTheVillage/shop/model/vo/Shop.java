package com.kh.RoundTheVillage.shop.model.vo;

/**
 * @author Baek Dong Hyeon
 *
 */
public class Shop {
	
	private int shopNo; // 공방 번호
	private String shopOwnerName; // 공방 대표 이름
	private String shopName; // 공방명
	private String shopAdress; // 공방 주소
	private String shopInfo; // 공방 소개
	private String shopContact; // 공방 연락처
	private String thumbInfo; // 썸네일 소개글
	private String shopCategoryName; // 공방 카테고리 이름
	private int shopCategoryNo; // 공방 카테고리 번호
	private double avgRating;
	private int participantsCount;
	

	public Shop() {}


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


	/**
	 * @return the shopOwnerName
	 */
	public String getShopOwnerName() {
		return shopOwnerName;
	}


	/**
	 * @param shopOwnerName the shopOwnerName to set
	 */
	public void setShopOwnerName(String shopOwnerName) {
		this.shopOwnerName = shopOwnerName;
	}


	/**
	 * @return the shopName
	 */
	public String getShopName() {
		return shopName;
	}


	/**
	 * @param shopName the shopName to set
	 */
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}


	/**
	 * @return the shopAdress
	 */
	public String getShopAdress() {
		return shopAdress;
	}


	/**
	 * @param shopAdress the shopAdress to set
	 */
	public void setShopAdress(String shopAdress) {
		this.shopAdress = shopAdress;
	}


	/**
	 * @return the shopInfo
	 */
	public String getShopInfo() {
		return shopInfo;
	}


	/**
	 * @param shopInfo the shopInfo to set
	 */
	public void setShopInfo(String shopInfo) {
		this.shopInfo = shopInfo;
	}


	/**
	 * @return the shopContact
	 */
	public String getShopContact() {
		return shopContact;
	}


	/**
	 * @param shopContact the shopContact to set
	 */
	public void setShopContact(String shopContact) {
		this.shopContact = shopContact;
	}


	/**
	 * @return the thumbInfo
	 */
	public String getThumbInfo() {
		return thumbInfo;
	}


	/**
	 * @param thumbInfo the thumbInfo to set
	 */
	public void setThumbInfo(String thumbInfo) {
		this.thumbInfo = thumbInfo;
	}


	/**
	 * @return the shopCategoryName
	 */
	public String getShopCategoryName() {
		return shopCategoryName;
	}


	/**
	 * @param shopCategoryName the shopCategoryName to set
	 */
	public void setShopCategoryName(String shopCategoryName) {
		this.shopCategoryName = shopCategoryName;
	}


	/**
	 * @return the shopCategoryNo
	 */
	public int getShopCategoryNo() {
		return shopCategoryNo;
	}


	/**
	 * @param shopCategoryNo the shopCategoryNo to set
	 */
	public void setShopCategoryNo(int shopCategoryNo) {
		this.shopCategoryNo = shopCategoryNo;
	}


	public double getAvgRating() {
		return avgRating;
	}


	public void setAvgRating(double avgRating) {
		this.avgRating = avgRating;
	}


	public int getParticipantsCount() {
		return participantsCount;
	}


	public void setParticipantsCount(int participantsCount) {
		this.participantsCount = participantsCount;
	}


	@Override
	public String toString() {
		return "Shop [shopNo=" + shopNo + ", shopOwnerName=" + shopOwnerName + ", shopName=" + shopName
				+ ", shopAdress=" + shopAdress + ", shopInfo=" + shopInfo + ", shopContact=" + shopContact
				+ ", thumbInfo=" + thumbInfo + ", shopCategoryName=" + shopCategoryName + ", shopCategoryNo="
				+ shopCategoryNo + ", avgRating=" + avgRating + ", participantsCount=" + participantsCount + "]";
	}



	
}
