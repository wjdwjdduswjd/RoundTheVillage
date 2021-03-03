package com.kh.RoundTheVillage.pay.model.vo;

import java.sql.Timestamp;

public class Pay {
	
	private int payNo;
	private Timestamp payDate;
	private Timestamp resDate;
	private int payAmt;
	private int gradeDis;
	private int couponDis;
	private String impUid;
	private int lesNo;
	private int memNo;
	private int couponNo;
	
	public Pay() {}

	public int getPayNo() {
		return payNo;
	}

	public void setPayNo(int payNo) {
		this.payNo = payNo;
	}

	public Timestamp getPayDate() {
		return payDate;
	}

	public void setPayDate(Timestamp payDate) {
		this.payDate = payDate;
	}

	public Timestamp getResDate() {
		return resDate;
	}

	public void setResDate(Timestamp resDate) {
		this.resDate = resDate;
	}

	public int getPayAmt() {
		return payAmt;
	}

	public void setPayAmt(int payAmt) {
		this.payAmt = payAmt;
	}

	public int getGradeDis() {
		return gradeDis;
	}

	public void setGradeDis(int gradeDis) {
		this.gradeDis = gradeDis;
	}

	public int getCouponDis() {
		return couponDis;
	}

	public void setCouponDis(int couponDis) {
		this.couponDis = couponDis;
	}

	public String getImpUid() {
		return impUid;
	}

	public void setImpUid(String impUid) {
		this.impUid = impUid;
	}

	public int getLesNo() {
		return lesNo;
	}

	public void setLesNo(int lesNo) {
		this.lesNo = lesNo;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getCouponNo() {
		return couponNo;
	}

	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}

	@Override
	public String toString() {
		return "Pay [payNo=" + payNo + ", payDate=" + payDate + ", resDate=" + resDate + ", payAmt=" + payAmt
				+ ", gradeDis=" + gradeDis + ", couponDis=" + couponDis + ", impUid=" + impUid + ", lesNo=" + lesNo
				+ ", memNo=" + memNo + ", couponNo=" + couponNo + "]";
	}
}
