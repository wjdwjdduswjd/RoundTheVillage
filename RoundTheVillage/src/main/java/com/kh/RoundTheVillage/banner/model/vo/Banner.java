package com.kh.RoundTheVillage.banner.model.vo;

import java.sql.Date;

public class Banner {
	private int banNo;
	private Date banStartDate;
	private Date banEndDate;
	private String URL;
	private String banImg;
	private char banStatus;
	private Date payDate;
	private int payAmt;
	private int memNo;
	
	public Banner() {}

	public int getBanNo() {
		return banNo;
	}

	public void setBanNo(int banNo) {
		this.banNo = banNo;
	}

	public Date getBanStartDate() {
		return banStartDate;
	}

	public void setBanStartDate(Date banStartDate) {
		this.banStartDate = banStartDate;
	}

	public Date getBanEndDate() {
		return banEndDate;
	}

	public void setBanEndDate(Date banEndDate) {
		this.banEndDate = banEndDate;
	}

	public String getURL() {
		return URL;
	}

	public void setURL(String uRL) {
		URL = uRL;
	}

	public String getBanImg() {
		return banImg;
	}

	public void setBanImg(String banImg) {
		this.banImg = banImg;
	}

	public char getBanStatus() {
		return banStatus;
	}

	public void setBanStatus(char banStatus) {
		this.banStatus = banStatus;
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

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	@Override
	public String toString() {
		return "Banner [banNo=" + banNo + ", banStartDate=" + banStartDate + ", banEndDate=" + banEndDate + ", URL="
				+ URL + ", banImg=" + banImg + ", banStatus=" + banStatus + ", payDate=" + payDate + ", payAmt="
				+ payAmt + ", memNo=" + memNo + "]";
	}
}
