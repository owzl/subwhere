package com.kh.board.model.vo;

import java.sql.Date;



public class Course {
	private String boardNo;
	
	// 사용자에게 보여줄 때는 사용자 닉네임을 보여줘야 하니 string으로 선언하기 
	private String memberNo;

	private String courseTitle;
	private String courseContent;
	private String courseTip;
	
	// db에 넘길때는 int로 가져올 때는 String형으로...
	private String stationNo;

	private String dtn1;
	private String dtn2;
	private String dtn3;
	private String dtn4;
	private int count;
	private String createDate;
	private Date modifyDate;
	private String status;
	private String TITLEIMG;
	private String stationName;
	private int line;

	
	
	
	//마이페이지
	public Course(String boardNo, String courseTitle, String courseContent, int count, String createDate,
			String tITLEIMG) {
		super();
		this.boardNo = boardNo;
		this.courseTitle = courseTitle;
		this.courseContent = courseContent;
		this.count = count;
		this.createDate = createDate;
		TITLEIMG = tITLEIMG;
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

	public Course() {}

	public Course(String boardNo, String memberNo, String courseTitle, String courseContent,String courseTip, String stationNo, String dtnName,
			String dtn1, String dtn2, String dtn3, String dtn4, int count, String createDate, Date modifyDate,
			String status) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.courseTitle = courseTitle;
		this.courseContent = courseContent;
		this.courseTip = courseTip;
		this.stationNo = stationNo;
	
		this.dtn1 = dtn1;
		this.dtn2 = dtn2;
		this.dtn3 = dtn3;
		this.dtn4 = dtn4;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.status = status;
	
		
		
	}

	public Course(String boardNo, String memberNo, String courseTitle, String courseContent, String courseTip,
			String stationNo, String dtn1, String dtn2, String dtn3, String dtn4, int count, String createDate,
			String stationName, int line, String TITLEIMG) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.courseTitle = courseTitle;
		this.courseContent = courseContent;
		this.courseTip = courseTip;
		this.stationNo = stationNo;
		this.dtn1 = dtn1;
		this.dtn2 = dtn2;
		this.dtn3 = dtn3;
		this.dtn4 = dtn4;
		this.count = count;
		this.createDate = createDate;
		this.stationName = stationName;
		this.line = line;
		this.TITLEIMG = TITLEIMG;
	}

	public Course(String boardNo, String memberNo, String courseTitle, String courseContent, String courseTip,
			String stationNo, String dtn1, String dtn2, String dtn3, String dtn4, int count, String createDate,
			Date modifyDate,String TITLEIMG) {
		super();
		this.boardNo = boardNo;
		this.memberNo = memberNo;
		this.courseTitle = courseTitle;
		this.courseContent = courseContent;
		this.courseTip = courseTip;
		this.stationNo = stationNo;
		this.dtn1 = dtn1;
		this.dtn2 = dtn2;
		this.dtn3 = dtn3;
		this.dtn4 = dtn4;
		this.count = count;
		this.createDate = createDate;
		this.modifyDate = modifyDate;
		this.TITLEIMG = TITLEIMG;
	}
	
	

	public Course(String boardNo, String courseTitle, String courseContent, String courseTip,
			String stationNo, String dtn1, String dtn2, String dtn3, String dtn4, int count, String createDate,
			String tITLEIMG, String stationName, int line) {
		super();
		this.boardNo = boardNo;
		
		this.courseTitle = courseTitle;
		this.courseContent = courseContent;
		this.courseTip = courseTip;
		this.stationNo = stationNo;
		this.dtn1 = dtn1;
		this.dtn2 = dtn2;
		this.dtn3 = dtn3;
		this.dtn4 = dtn4;
		this.count = count;
		this.createDate = createDate;
		TITLEIMG = tITLEIMG;
		this.stationName = stationName;
		this.line = line;
	}

	public String getCourseTip() {
		return courseTip;
	}

	public void setCourseTip(String courseTip) {
		this.courseTip = courseTip;
	}



	public String getTITLEIMG() {
		return TITLEIMG;
	}

	public void setTITLEIMG(String tITLEIMG) {
		TITLEIMG = tITLEIMG;
	}

	public String getBoardNo() {
		return boardNo;
	}

	

	public Course(String boardNo, String courseTitle, String courseContent, int count) {
		super();
		this.boardNo = boardNo;
		this.courseTitle = courseTitle;
		this.courseContent = courseContent;
		this.count = count;
	}

	

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getMemberNo() {
		return memberNo;
	}

	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}

	public String getCourseTitle() {
		return courseTitle;
	}

	public void setCourseTitle(String courseTitle) {
		this.courseTitle = courseTitle;
	}

	public String getCourseContent() {
		return courseContent;
	}

	public void setCourseContent(String courseContent) {
		this.courseContent = courseContent;
	}

	public String getStationNo() {
		return stationNo;
	}

	public void setStationNo(String stationNo) {
		this.stationNo = stationNo;
	}

	
	public String getDtn1() {
		return dtn1;
	}

	public void setDtn1(String dtn1) {
		this.dtn1 = dtn1;
	}

	public String getDtn2() {
		return dtn2;
	}

	public void setDtn2(String dtn2) {
		this.dtn2 = dtn2;
	}

	public String getDtn3() {
		return dtn3;
	}

	public void setDtn3(String dtn3) {
		this.dtn3 = dtn3;
	}

	public String getDtn4() {
		return dtn4;
	}

	public void setDtn4(String dtn4) {
		this.dtn4 = dtn4;
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

	public Date getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Course [boardNo=" + boardNo + ", memberNo=" + memberNo + ", courseTitle=" + courseTitle
				+ ", courseContent=" + courseContent + ", courseTip=" + courseTip + ", stationNo=" + stationNo
				+ ", dtn1=" + dtn1 + ", dtn2=" + dtn2 + ", dtn3=" + dtn3 + ", dtn4=" + dtn4 + ", count=" + count
				+ ", createDate=" + createDate + ", modifyDate=" + modifyDate + ", status=" + status + ", TITLEIMG="
				+ TITLEIMG + ", stationName=" + stationName + ", line=" + line + "]";
	}

	
	

	
	
}
