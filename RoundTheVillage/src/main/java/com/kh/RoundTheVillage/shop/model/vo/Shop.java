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
	private int likeCount; // 공방 좋아요 
	

	public Shop() {}


	public Shop(int shopNo, String shopOwnerName, String shopName, String shopAdress, String shopInfo,
			String shopContact, String thumbInfo, String shopCategoryName, int shopCategoryNo, double avgRating,
			int participantsCount, int likeCount) {
		super();
		this.shopNo = shopNo;
		this.shopOwnerName = shopOwnerName;
		this.shopName = shopName;
		this.shopAdress = shopAdress;
		this.shopInfo = shopInfo;
		this.shopContact = shopContact;
		this.thumbInfo = thumbInfo;
		this.shopCategoryName = shopCategoryName;
		this.shopCategoryNo = shopCategoryNo;
		this.avgRating = avgRating;
		this.participantsCount = participantsCount;
		this.likeCount = likeCount;
	}


	public int getShopNo() {
		return shopNo;
	}


	public void setShopNo(int shopNo) {
		this.shopNo = shopNo;
	}


	public String getShopOwnerName() {
		return shopOwnerName;
	}


	public void setShopOwnerName(String shopOwnerName) {
		this.shopOwnerName = shopOwnerName;
	}


	public String getShopName() {
		return shopName;
	}


	public void setShopName(String shopName) {
		this.shopName = shopName;
	}


	public String getShopAdress() {
		return shopAdress;
	}


	public void setShopAdress(String shopAdress) {
		this.shopAdress = shopAdress;
	}


	public String getShopInfo() {
		return shopInfo;
	}


	public void setShopInfo(String shopInfo) {
		this.shopInfo = shopInfo;
	}


	public String getShopContact() {
		return shopContact;
	}


	public void setShopContact(String shopContact) {
		this.shopContact = shopContact;
	}


	public String getThumbInfo() {
		return thumbInfo;
	}


	public void setThumbInfo(String thumbInfo) {
		this.thumbInfo = thumbInfo;
	}


	public String getShopCategoryName() {
		return shopCategoryName;
	}


	public void setShopCategoryName(String shopCategoryName) {
		this.shopCategoryName = shopCategoryName;
	}


	public int getShopCategoryNo() {
		return shopCategoryNo;
	}


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


	public int getLikeCount() {
		return likeCount;
	}


	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}


	@Override
	public String toString() {
		return "Shop [shopNo=" + shopNo + ", shopOwnerName=" + shopOwnerName + ", shopName=" + shopName
				+ ", shopAdress=" + shopAdress + ", shopInfo=" + shopInfo + ", shopContact=" + shopContact
				+ ", thumbInfo=" + thumbInfo + ", shopCategoryName=" + shopCategoryName + ", shopCategoryNo="
				+ shopCategoryNo + ", avgRating=" + avgRating + ", participantsCount=" + participantsCount
				+ ", likeCount=" + likeCount + "]";
	}


	

	
}
