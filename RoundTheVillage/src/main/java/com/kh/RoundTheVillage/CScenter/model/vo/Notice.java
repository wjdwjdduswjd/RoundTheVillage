package com.kh.RoundTheVillage.CScenter.model.vo;

import java.sql.Timestamp;

public class Notice {
	
	private int noticeNo;
	private String noticeTitle;
	private String noticeContent;
	private String memberType;
	private Timestamp noticeCreateDate;
	private Timestamp noticeModifyDate;
	private String noticeStatus;
	
	public Notice() {}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public Timestamp getNoticeCreateDate() {
		return noticeCreateDate;
	}

	public void setNoticeCreateDate(Timestamp noticeCreateDate) {
		this.noticeCreateDate = noticeCreateDate;
	}

	public Timestamp getNoticeModifyDate() {
		return noticeModifyDate;
	}

	public void setNoticeModifyDate(Timestamp noticeModifyDate) {
		this.noticeModifyDate = noticeModifyDate;
	}

	public String getNoticeStatus() {
		return noticeStatus;
	}

	public void setNoticeStatus(String noticeStatus) {
		this.noticeStatus = noticeStatus;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeContent=" + noticeContent
				+ ", memberType=" + memberType + ", noticeCreateDate=" + noticeCreateDate + ", noticeModifyDate="
				+ noticeModifyDate + ", noticeStatus=" + noticeStatus + "]";
	}



	
	
	
	
}
