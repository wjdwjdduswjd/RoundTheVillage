package com.kh.RoundTheVillage.banner.model.vo;

import java.sql.Date;

public class Banner {
	private int banNo;
	private Date startDate;
	private Date endDate;
	private String URL;
	private String img;
	private Date payDate;
	private int payAmt;
	private String impUid;
	private char bannerFl;
	private char aprvlFl;
	private int memNo;
	private String memName;
	private String memEmail;
	private String craftshopName;
	private String craftshopContact;
	
	public Banner() {}

	public int getBanNo() {
		return banNo;
	}

	public void setBanNo(int banNo) {
		this.banNo = banNo;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getURL() {
		return URL;
	}

	public void setURL(String uRL) {
		URL = uRL;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Date getPayDate() {
		return payDate;
	}

	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}

	public int getPayAmt() {
		return payAmt;
	}

	public void setPayAmt(int payAmt) {
		this.payAmt = payAmt;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public char getBannerFl() {
		return bannerFl;
	}

	public void setBannerFl(char bannerFl) {
		this.bannerFl = bannerFl;
	}

	public char getAprvlFl() {
		return aprvlFl;
	}

	public void setAprvlFl(char aprvlFl) {
		this.aprvlFl = aprvlFl;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public String getMemEmail() {
		return memEmail;
	}

	public void setMemEmail(String memEmail) {
		this.memEmail = memEmail;
	}

	public String getCraftshopName() {
		return craftshopName;
	}

	public void setCraftshopName(String craftshopName) {
		this.craftshopName = craftshopName;
	}

	public String getCraftshopContact() {
		return craftshopContact;
	}

	public void setCraftshopContact(String craftshopContact) {
		this.craftshopContact = craftshopContact;
	}

	@Override
	public String toString() {
		return "Banner [banNo=" + banNo + ", startDate=" + startDate + ", endDate=" + endDate + ", URL=" + URL
				+ ", img=" + img + ", payDate=" + payDate + ", payAmt=" + payAmt + ", impUid=" + impUid + ", bannerFl="
				+ bannerFl + ", aprvlFl=" + aprvlFl + ", memNo=" + memNo + ", memName=" + memName + ", memEmail=" + memEmail
				+ ", craftshopName=" + craftshopName + ", craftshopContact=" + craftshopContact + "]";
	}
}
