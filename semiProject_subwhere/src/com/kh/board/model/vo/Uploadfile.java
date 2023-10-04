package com.kh.board.model.vo;

import java.sql.Date;

public class Uploadfile {

	private int fileNo;
	private String refdBoardNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String status;
	private String dtn1;
	private String dtn2;
	private String dtn3;
	private String dtn4;
	
	
	
	
	public Uploadfile(int fileNo, String refdBoardNo, String originName, String changeName, String filePath,
			Date uploadDate, int fileLevel) {
		super();
		this.fileNo = fileNo;
		this.refdBoardNo = refdBoardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
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


	public Uploadfile(int fileNo, String refdBoardNo, String originName, String changeName, String filePath,
			Date uploadDate, int fileLevel, String status, String dtn1, String dtn2, String dtn3, String dtn4) {
		super();
		this.fileNo = fileNo;
		this.refdBoardNo = refdBoardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
		this.dtn1 = dtn1;
		this.dtn2 = dtn2;
		this.dtn3 = dtn3;
		this.dtn4 = dtn4;
	}
	
	   public Uploadfile(int fileNo, String refdBoardNo, String originName, String changeName, String filePath, Date uploadDate,
		         int fileLevel, String dtn1, String dtn2, String dtn3, String dtn4) {
		      super();
		      this.fileNo = fileNo;
		      this.refdBoardNo = refdBoardNo;
		      this.originName = originName;
		      this.changeName = changeName;
		      this.filePath = filePath;
		      this.uploadDate = uploadDate;
		      this.fileLevel = fileLevel;
		      this.dtn1 = dtn1;
		      this.dtn2 = dtn2;
		      this.dtn3 = dtn3;
		      this.dtn4 = dtn4;
		   }
	


	public Uploadfile(int fileNo, String refdBoardNo, String originName, String changeName, String filePath,
			Date uploadDate, int fileLevel, String status) {
		super();
		this.fileNo = fileNo;
		this.refdBoardNo = refdBoardNo;
		this.originName = originName;
		this.changeName = changeName;
		this.filePath = filePath;
		this.uploadDate = uploadDate;
		this.fileLevel = fileLevel;
		this.status = status;
	}


	public Uploadfile() {
	}


	@Override
	public String toString() {
		return "Uploadfile [fileNo=" + fileNo + ", refdBoardNo=" + refdBoardNo + ", originName=" + originName
				+ ", changeName=" + changeName + ", filePath=" + filePath + ", uploadDate=" + uploadDate
				+ ", fileLevel=" + fileLevel + ", status=" + status + "]";
	}


	public int getFileNo() {
		return fileNo;
	}


	public void setFileNo(int fileNo) {
		this.fileNo = fileNo;
	}


	public String getRefdBoardNo() {
		return refdBoardNo;
	}


	public void setRefdBoardNo(String refdBoardNo) {
		this.refdBoardNo = refdBoardNo;
	}


	public String getOriginName() {
		return originName;
	}


	public void setOriginName(String originName) {
		this.originName = originName;
	}


	public String getChangeName() {
		return changeName;
	}


	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}


	public String getFilePath() {
		return filePath;
	}


	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}


	public Date getUploadDate() {
		return uploadDate;
	}


	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
	}


	public int getFileLevel() {
		return fileLevel;
	}


	public void setFileLevel(int fileLevel) {
		this.fileLevel = fileLevel;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}
	
	
	
	
	
}
