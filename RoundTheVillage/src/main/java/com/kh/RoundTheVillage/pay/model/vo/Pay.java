package com.kh.RoundTheVillage.pay.model.vo;

import java.sql.Date;

public class Pay {
	private int payNo;
	private Date payDate;
	private int payAmt;
	private int gradeDis;
	private int cuponDis;
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


	public int getGradeDis() {
		return gradeDis;
	}


	public void setGradeDis(int gradeDis) {
		this.gradeDis = gradeDis;
	}


	public int getCuponDis() {
		return cuponDis;
	}


	public void setCuponDis(int cuponDis) {
		this.cuponDis = cuponDis;
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
		return "Pay [payNo=" + payNo + ", payDate=" + payDate + ", payAmt=" + payAmt + ", gradeDis=" + gradeDis
				+ ", cuponDis=" + cuponDis + ", impUid=" + impUid + ", lesNo=" + lesNo + ", memNo=" + memNo
				+ ", couponNo=" + couponNo + "]";
	}
}
