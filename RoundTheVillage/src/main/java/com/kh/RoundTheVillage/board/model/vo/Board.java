package com.kh.RoundTheVillage.board.model.vo;

import java.sql.Timestamp;

public class Board {
	    
	    private int boardNo;
	 	private String boardTitle;
	 	private String boardContent;
	 	private String memberNo;
	 	private int readCount;
	 	private Timestamp boardCreateDate;
	 	private Timestamp boardModifyDate;
	 	private String boardStatus;
	 	private int classNo;
	 	private int classCategoryNo;
	 	private String memberNickname;
	 	
	 	public Board() {
			// TODO Auto-generated constructor stub
		}

		public int getBoardNo() {
			return boardNo;
		}

		public void setBoardNo(int boardNo) {
			this.boardNo = boardNo;
		}

		public String getBoardTitle() {
			return boardTitle;
		}

		public void setBoardTitle(String boardTitle) {
			this.boardTitle = boardTitle;
		}

		public String getBoardContent() {
			return boardContent;
		}

		public void setBoardContent(String boardContent) {
			this.boardContent = boardContent;
		}

		public String getMemberNo() {
			return memberNo;
		}

		public void setMemberNo(String memberNo) {
			this.memberNo = memberNo;
		}

		public int getReadCount() {
			return readCount;
		}

		public void setReadCount(int readCount) {
			this.readCount = readCount;
		}

		public Timestamp getBoardCreateDate() {
			return boardCreateDate;
		}

		public void setBoardCreateDate(Timestamp boardCreateDate) {
			this.boardCreateDate = boardCreateDate;
		}

		public Timestamp getBoardModifyDate() {
			return boardModifyDate;
		}

		public void setBoardModifyDate(Timestamp boardModifyDate) {
			this.boardModifyDate = boardModifyDate;
		}

		public String getBoardStatus() {
			return boardStatus;
		}

		public void setBoardStatus(String boardStatus) {
			this.boardStatus = boardStatus;
		}

		public int getClassNo() {
			return classNo;
		}

		public void setClassNo(int classNo) {
			this.classNo = classNo;
		}

		public int getClassCategoryNo() {
			return classCategoryNo;
		}

		public void setClassCategoryNo(int classCategoryNo) {
			this.classCategoryNo = classCategoryNo;
		}

		public String getMemberNickname() {
			return memberNickname;
		}

		public void setMemberNickname(String memberNickname) {
			this.memberNickname = memberNickname;
		}

		@Override
		public String toString() {
			return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
					+ ", memberNo=" + memberNo + ", readCount=" + readCount + ", boardCreateDate=" + boardCreateDate
					+ ", boardModifyDate=" + boardModifyDate + ", boardStatus=" + boardStatus + ", classNo=" + classNo
					+ ", classCategoryNo=" + classCategoryNo + ", memberNickname=" + memberNickname + "]";
		}

		
	
	 	
}
