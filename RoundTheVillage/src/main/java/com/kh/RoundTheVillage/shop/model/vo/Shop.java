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
	private char shopRegiFL;
	private String memberSecessionFl;

	

	public Shop() {}


	
	

	public Shop(int shopNo, String shopOwnerName, String shopName, String shopAdress, String shopInfo,
			String shopContact, String thumbInfo, String shopCategoryName, int shopCategoryNo, double avgRating,
			int participantsCount, int likeCount, char shopRegiFL, String memberSecessionFl) {
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
		this.shopRegiFL = shopRegiFL;
		this.memberSecessionFl = memberSecessionFl;
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


	/**
	 * @return the avgRating
	 */
	public double getAvgRating() {
		return avgRating;
	}


	/**
	 * @param avgRating the avgRating to set
	 */
	public void setAvgRating(double avgRating) {
		this.avgRating = avgRating;
	}


	/**
	 * @return the participantsCount
	 */
	public int getParticipantsCount() {
		return participantsCount;
	}


	/**
	 * @param participantsCount the participantsCount to set
	 */
	public void setParticipantsCount(int participantsCount) {
		this.participantsCount = participantsCount;
	}


	/**
	 * @return the likeCount
	 */
	public int getLikeCount() {
		return likeCount;
	}


	/**
	 * @param likeCount the likeCount to set
	 */
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}


	/**
	 * @return the shopRegiFL
	 */
	public char getShopRegiFL() {
		return shopRegiFL;
	}


	/**
	 * @param shopRegiFL the shopRegiFL to set
	 */
	public void setShopRegiFL(char shopRegiFL) {
		this.shopRegiFL = shopRegiFL;
	}
	
	
	


	public String getMemberSecessionFl() {
		return memberSecessionFl;
	}





	public void setMemberSecessionFl(String memberSecessionFl) {
		this.memberSecessionFl = memberSecessionFl;
	}





	@Override
	public String toString() {
		return "Shop [shopNo=" + shopNo + ", " + (shopOwnerName != null ? "shopOwnerName=" + shopOwnerName + ", " : "")
				+ (shopName != null ? "shopName=" + shopName + ", " : "")
				+ (shopAdress != null ? "shopAdress=" + shopAdress + ", " : "")
				+ (shopInfo != null ? "shopInfo=" + shopInfo + ", " : "")
				+ (shopContact != null ? "shopContact=" + shopContact + ", " : "")
				+ (thumbInfo != null ? "thumbInfo=" + thumbInfo + ", " : "")
				+ (shopCategoryName != null ? "shopCategoryName=" + shopCategoryName + ", " : "") + "shopCategoryNo="
				+ shopCategoryNo + ", avgRating=" + avgRating + ", participantsCount=" + participantsCount
				+ ", likeCount=" + likeCount + ", shopRegiFL=" + shopRegiFL + "]";
	}


	

	

	
}
