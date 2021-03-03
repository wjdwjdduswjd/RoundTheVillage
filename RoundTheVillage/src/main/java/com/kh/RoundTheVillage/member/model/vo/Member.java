package com.kh.RoundTheVillage.member.model.vo;

import java.sql.Date;

public class Member {

	private int memberNo;
	private String memberName;
	private String memberId;
	private String memberPwd;
	private String memberNickname;
	private String memberEmail;
	private Date memberSignDt;
	private String memberIntrs;
	private String memberAddr;
	private String memberGrade;
	private String memberType;
	private String memberSecessionFl;

	public Member() {
	}

	public Member(int memberNo, String memberName, String memberId, String memberPwd, String memberNickname,
			String memberEmail, Date memberSignDt, String memberIntrs, String memberAddr, String memberGrade,
			String memberType, String memberSecessionFl) {
		super();
		this.memberNo = memberNo;
		this.memberName = memberName;
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberNickname = memberNickname;
		this.memberEmail = memberEmail;
		this.memberSignDt = memberSignDt;
		this.memberIntrs = memberIntrs;
		this.memberAddr = memberAddr;
		this.memberGrade = memberGrade;
		this.memberType = memberType;
		this.memberSecessionFl = memberSecessionFl;
	}

	public int getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberNickname() {
		return memberNickname;
	}

	public void setMemberNickname(String memberNickname) {
		this.memberNickname = memberNickname;
	}

	public String getMemberEmail() {
		return memberEmail;
	}

	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}

	public Date getMemberSignDt() {
		return memberSignDt;
	}

	public void setMemberSignDt(Date memberSignDt) {
		this.memberSignDt = memberSignDt;
	}

	public String getMemberIntrs() {
		return memberIntrs;
	}

	public void setMemberIntrs(String memberIntrs) {
		this.memberIntrs = memberIntrs;
	}

	public String getMemberAddr() {
		return memberAddr;
	}

	public void setMemberAddr(String memberAddr) {
		this.memberAddr = memberAddr;
	}

	public String getMemberGrade() {
		return memberGrade;
	}

	public void setMemberGrade(String memberGrade) {
		this.memberGrade = memberGrade;
	}

	public String getMemberType() {
		return memberType;
	}

	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}

	public String getMemberSecessionFl() {
		return memberSecessionFl;
	}

	public void setMemberSecessionFl(String memberSecessionFl) {
		this.memberSecessionFl = memberSecessionFl;
	}

	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberName=" + memberName + ", memberId=" + memberId + ", memberPwd="
				+ memberPwd + ", memberNickname=" + memberNickname + ", memberEmail=" + memberEmail + ", memberSignDt="
				+ memberSignDt + ", memberIntrs=" + memberIntrs + ", memberAddr=" + memberAddr + ", memberGrade="
				+ memberGrade + ", memberType=" + memberType + ", memberSecessionFl=" + memberSecessionFl + "]";
	}

}
