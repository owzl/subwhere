package com.kh.board.model.vo;

public class Report {

	private int memberNo;
	private String boardNo;
	public Report(int memberNo, String boardNo) {
		super();
		this.memberNo = memberNo;
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "Report [memberNo=" + memberNo + ", boardNo=" + boardNo + "]";
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}
	
	public Report () {}
	
	
}
