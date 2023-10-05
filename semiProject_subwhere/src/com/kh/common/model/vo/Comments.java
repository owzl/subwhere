package com.kh.common.model.vo;

public class Comments {
   private int commentNo;
   private int memberNo;
   private String boardNo;
   private String commentContent;
   private String enrollDate;
   private String modifyDate;
   private String status;
   private String memberName;
   
   private String title;
   private String comment;
   
   
   
   
   public String getTitle() {
	return title;
}

public void setTitle(String title) {
	this.title = title;
}

public String getComment() {
	return comment;
}

public void setComment(String comment) {
	this.comment = comment;
}

public Comments() {}
   
   public Comments(int commentNo, int memberNo, String boardNo, String commentContent, String enrollDate,
         String modifyDate, String status) {
      super();
      this.commentNo = commentNo;
      this.memberNo = memberNo;
      this.boardNo = boardNo;
      this.commentContent = commentContent;
      this.enrollDate = enrollDate;
      this.modifyDate = modifyDate;
      this.status = status;
   }
   
   
   
   
   
   

   
  

   
   
   public Comments(int commentNo, int memberNo, String commentContent, String modifyDate, String memberName) {
	super();
	this.commentNo = commentNo;
	this.memberNo = memberNo;
	this.commentContent = commentContent;
	this.modifyDate = modifyDate;
	this.memberName = memberName;
}




// 수진





 public Comments(int commentNo, int memberNo, String boardNo, String commentContent, String enrollDate,
       String modifyDate, String status, String memberName) {
    super();
    this.commentNo = commentNo;
    this.memberNo = memberNo;
    this.boardNo = boardNo;
    this.commentContent = commentContent;
    this.enrollDate = enrollDate;
    this.modifyDate = modifyDate;
    this.status = status;
    this.memberName = memberName;
 }



 public Comments(int commentNo, int memberNo, String boardNo, String commentContent, String enrollDate,
		String memberName) {
	super();
	this.commentNo = commentNo;
	this.memberNo = memberNo;
	this.boardNo = boardNo;
	this.commentContent = commentContent;
	this.enrollDate = enrollDate;
	this.memberName = memberName;
}


 

public Comments(String boardNo, String commentContent, String modifyDate, String title) {
	super();
	this.boardNo = boardNo;
	this.commentContent = commentContent;
	this.modifyDate = modifyDate;
	this.title = title;
}




public Comments(String commentContent, String modifyDate, String title) {
	super();
	this.commentContent = commentContent;
	this.modifyDate = modifyDate;
	this.title = title;
}

public Comments(int commentNo, int memberNo, String commentContent, String modifyDate) {
		super();
		this.commentNo = commentNo;
		this.memberNo = memberNo;
		this.commentContent = commentContent;
		this.modifyDate = modifyDate;
	}
 
 









public Comments(int memberNo, String boardNo, String commentContent, String modifyDate, String status) {
	super();
	this.memberNo = memberNo;
	this.boardNo = boardNo;
	this.commentContent = commentContent;
	this.modifyDate = modifyDate;
	this.status = status;
}

public int getCommentNo() {
      return commentNo;
   }
   public void setCommentNo(int commentNo) {
      this.commentNo = commentNo;
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
   public String getCommentContent() {
      return commentContent;
   }
   public void setCommentContent(String commentcontent) {
      this.commentContent = commentcontent;
   }
   public String getenrollDate() {
      return enrollDate;
   }
   public void setenrollDate(String enrollDate) {
      this.enrollDate = enrollDate;
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
   @Override
   public String toString() {
      return "Comments [commentNo=" + commentNo + ", memberNo=" + memberNo + ", boardNo=" + boardNo
            + ", commentcontent=" + commentContent + ", enrollDate=" + enrollDate + ", modifyDate=" + modifyDate
            + ", status=" + status + "]";
   }
   
   
   
   
}