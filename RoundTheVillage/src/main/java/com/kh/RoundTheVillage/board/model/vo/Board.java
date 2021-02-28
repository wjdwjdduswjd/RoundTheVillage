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
	 	
	 	public Board() {
			// TODO Auto-generated constructor stub
		}

		public Board(int boardNo, String boardTitle, String boardContent, String memberNo, int readCount,
				Timestamp boardCreateDate, Timestamp boardModifyDate, String boardStatus, int classNo,
				int classCategoryNo) {
			super();
			this.boardNo = boardNo;
			this.boardTitle = boardTitle;
			this.boardContent = boardContent;
			this.memberNo = memberNo;
			this.readCount = readCount;
			this.boardCreateDate = boardCreateDate;
			this.boardModifyDate = boardModifyDate;
			this.boardStatus = boardStatus;
			this.classNo = classNo;
			this.classCategoryNo = classCategoryNo;
		}

		@Override
		public String toString() {
			return "Board [boardNo=" + boardNo + ", boardTitle=" + boardTitle + ", boardContent=" + boardContent
					+ ", memberNo=" + memberNo + ", readCount=" + readCount + ", boardCreateDate=" + boardCreateDate
					+ ", boardModifyDate=" + boardModifyDate + ", boardStatus=" + boardStatus + ", classNo=" + classNo
					+ ", classCategoryNo=" + classCategoryNo + "]";
		}

	
	 	
}
