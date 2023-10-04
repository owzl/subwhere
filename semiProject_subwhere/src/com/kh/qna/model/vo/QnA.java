package com.kh.qna.model.vo;

import java.sql.Date;

public class QnA {

	private int qaNo;
	private String question;
	private String answer;
	private String qaDate;
	private String status;
	private int count;
	
	
	public QnA() {}


	public QnA(int qaNo, String question, String answer, String qaDate, String status, int count) {
		super();
		this.qaNo = qaNo;
		this.question = question;
		this.answer = answer;
		this.qaDate = qaDate;
		this.status = status;
		this.count = count;
	}

	

	public QnA(int qaNo, String question, String answer) {
		super();
		this.qaNo = qaNo;
		this.question = question;
		this.answer = answer;
	}


	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public int getQaNo() {
		return qaNo;
	}


	public void setQaNo(int qaNo) {
		this.qaNo = qaNo;
	}


	public String getQuestion() {
		return question;
	}


	public void setQuestion(String question) {
		this.question = question;
	}


	public String getAnswer() {
		return answer;
	}


	public void setAnswer(String answer) {
		this.answer = answer;
	}


	public String getQaDate() {
		return qaDate;
	}


	public void setQaDate(String qaDate) {
		this.qaDate = qaDate;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "QnA [qaNo=" + qaNo + ", question=" + question + ", answer=" + answer + ", qaDate=" + qaDate
				+ ", status=" + status + "]";
	}
	
	
	
	
}
