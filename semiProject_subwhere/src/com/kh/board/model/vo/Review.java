package com.kh.board.model.vo;

import java.util.List;

public class Review {
	
	// 이미 VARCHAR2로 하기로 해서 String형. 까묵지마
	private String boardNo;
	
	// 사용자한테 보여줘야하니까 String형
	private String stationNo;	//(역번호)
	private String boardWriter; //(회원번호)
	
	private String title;
	private String address;
	private String content;
	private String tip;
	private int count;
	private String createDate;
	private String modifyDate;
	private String status;
	
	private String titleImg; // 대표이미지
	
	private String stationName;	// 역명
	private int line;			// 호선

	public Review() {}

	
	// 호선별 리스트 조회
	public Review(String boardNo, String stationNo, String boardWriter, String title, String address, int count,
			String titleImg, int line) {
		super();
		this.boardNo = boardNo;
		this.stationNo = stationNo;
		this.boardWriter = boardWriter;
		this.title = title;
		this.address = address;
		this.count = count;
		this.titleImg = titleImg;
		this.line = line;
	}



	// 매개변수생성자(전체)
	public Review(String boardNo, String stationNo, String boardWriter, String title, String address, String content,
			String tip, int count, String createDate, String modifyDate, String status, String titleImg,
			String stationName, int line) {
		super();
		this.boardNo = boardNo;
		this.stationNo = stationNo;
		this.boardWriter = boardWriter;
		this.title = title;
		this.address = address;
		this.content = content;
		this.tip = tip;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
		this.titleImg = titleImg;
		this.stationName = stationName;
		this.line = line;
	}

	// 매개변수생성자(9개_여행후기 리스트 각 게시물마다 담길 값 조회시 필요) 
	public Review(String boardNo, String stationNo, String boardWriter, String title, String address, String content,
			String tip, int count, String titleImg) {
		super();
		this.boardNo = boardNo;
		this.stationNo = stationNo;
		this.boardWriter = boardWriter;
		this.title = title;
		this.address = address;
		this.content = content;
		this.tip = tip;
		this.count = count;
		this.titleImg = titleImg;
	}
	
	// (11개_여행후기 상세페이지 조회용)
	public Review(String boardNo, String stationNo, String boardWriter, String title, String address, String content,
			String tip, int count, String createDate, String modifyDate, String stationName, int line) {
		super();
		this.boardNo = boardNo;
		this.stationNo = stationNo;
		this.boardWriter = boardWriter;
		this.title = title;
		this.address = address;
		this.content = content;
		this.tip = tip;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.stationName = stationName;
		this.line = line;
	}
	
	
	

	public Review(String boardNo, String title, String content, int count, String createDate, String titleImg) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.count = count;
		this.createDate = createDate;
		this.titleImg = titleImg;
	}


	public String getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getStationNo() {
		return stationNo;
	}

	public void setStationNo(String stationNo) {
		this.stationNo = stationNo;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTip() {
		return tip;
	}

	public void setTip(String tip) {
		this.tip = tip;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getTitleImg() {
		return titleImg;
	}

	public void setTitleImg(String titleImg) {
		this.titleImg = titleImg;
	}

	public String getStationName() {
		return stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}

	public int getLine() {
		return line;
	}

	public void setLine(int line) {
		this.line = line;
	}


	@Override
	public String toString() {
		return "Review [boardNo=" + boardNo + ", stationNo=" + stationNo + ", boardWriter=" + boardWriter + ", title="
				+ title + ", address=" + address + ", content=" + content + ", tip=" + tip + ", count=" + count
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + ", titleImg="
				+ titleImg + ", stationName=" + stationName + ", line=" + line + "]";
	}
	


	

	
	
}
