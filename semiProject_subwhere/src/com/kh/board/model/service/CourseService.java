package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import javax.xml.stream.events.Comment;
import javax.xml.transform.Templates;

import static com.kh.common.JDBCTemplate.*;


import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.PageInfo;



import com.kh.board.model.dao.CourseDao;

import com.kh.board.model.vo.Course;
import com.kh.board.model.vo.Station;
import com.kh.board.model.vo.Uploadfile;

public class CourseService {


	public ArrayList<Course> selectCourseList(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Course> list = new CourseDao().selectCourseList(conn,pi);
		
	
		
		close(conn);
		
		return list;
		
	}
	
	
	
	
	
	/**
	 * 여행 코스 입력할 때 역의 호선만을 조회하는 메소드 
	 * @return
	 */
	public ArrayList<Station> selectStation(int num){
		
		Connection conn = getConnection();
		
		ArrayList<Station> line = new CourseDao().selectStaion(conn,num);
	
		close(conn);
		
		return line;
		
		
	}
	
	
	
	/**
	 * course에 insert하는 메소드 (첨부파일 포함 )
	 * @return
	 */
public int insertCourse(Course c, ArrayList<Uploadfile> list) {
		
		Connection conn = getConnection();
		
		// 먼저 course에 insert하기 
		int result1 = new CourseDao().insertCourse(conn,c);
		
		// 첨부파일도 insert하기 
		int result2 = new CourseDao().insertUploadFileCourse(conn,list);
		
		
		if(result1 >0 && result2>0) {
			commit(conn);
			
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		
		return result1 * result2;
		
		
		
	}
	
	
	/**
	 * 총 게시글 개수를 알아오는 메소드 
	 * @return
	 */
	public int courseAllCount() {
		
		Connection conn = getConnection();
		
		int count = new CourseDao().courseAllCount(conn);
		
		close(conn);
		
		return count;
		
	}
	
	
	/**
	 * 여행 코스 리스트에서 특정 호선 버튼을 누르면 해당 호선의 여행 코스만 보여주는 메소드
	 * @param line
	 * @return
	 */
	public ArrayList<Course> selectLineList(int line, PageInfo pi){
	      
	      Connection conn = getConnection();
	      
	      ArrayList<Course> list = new CourseDao().selectLineList(conn, line, pi);
	      
	      close(conn);
	      
	      return list;
	      
	}
	
	
	/**
	 * 여행 코스의 조회수를 증가시키는 메소드 
	 * 
	 * @param cno
	 * @return
	 */
	public Course increaseCourseCount(int cno) {
		
		Connection conn = getConnection();
		
		int result = new CourseDao().increaseCourseCount(conn, cno);
		
		Course c = null;
		
		if(result > 0) {
			commit(conn);
			// 만약 조회수 증가를 성공시켰다면 해당 게시글에 대한 내용을 조회해오기 
			
			c = new CourseDao().selectCourseDetail(conn,cno);
			
			
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return c;
		
	}

	
	/**
	 * 여행 코스 상세조회할 때 첨부파일도 조회해오는 메소드
	 * @param cno
	 * @return
	 */
	public ArrayList<Uploadfile> selectCourseFile(int cno){
		
		Connection conn = getConnection();
		
		ArrayList<Uploadfile> list = new CourseDao().selectCourseFile(conn, cno);
		
		close(conn);
		
		return list;
		
		
	}
	
	
	
	/**
	 * 여행 코스 삭제하는 메소드
	 * @param cno
	 * @return
	 */
	public int deleteCourse(int cno) {
		
		Connection conn = getConnection();
		
		int result = new CourseDao().deleteCourse(cno, conn);
		
		int result2 = 1; 
		
		
		
		if(result>0) {
			
			result2 = new CourseDao().deleteCourseFile(cno,conn);
			
			commit(conn);
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result * result2;
				
		
	}
	
	
	
	/**
	 * 여행 코스 게시글 수정하기 위해 작성자가 작성한 글의 내용을 조회하는 메소드 
	 * station과 course에 대한 내용이 모두 담겨있음 
	 * @param cno
	 * @return
	 */
	public Course selectCourseDetail(int cno) {
		
		Connection conn = getConnection();
		
		Course c = new CourseDao().selectCourseDetail(conn, cno);
		
		close(conn);
		
		return c;
		
	}
	
	
	
	
	/**
	 * course update하는 메소드
	 * @param c
	 * @param cno
	 * @param list
	 */
	public int updateCourse(Course c, ArrayList<Uploadfile> list) {
	      
	      Connection conn = getConnection();
	      
	      int result1 = new CourseDao().updateCourse(conn, c);
	      
	      int result2 = 1;
	      // 첨부파일이 없는 경우는 없음 
	      // 썸네일 때문에 
	      
	      // 근데 상세는 없을 수 있음 
	      
	      
	      // 만약 첨부파일이 있다면 
	            if(!list.isEmpty()) {
	               // 기존에 첨부파일 있냐 없냐를 또 분기처리하기 
	               
	               // 만약 기존 2번에 파일이 있었다면 4
	               
	            for(int i =0; i<list.size(); i++) {
	               if(list.get(i).getFileNo()!= 0) {
	                  // 기존에 첨부파일이 있다면 fileNo가 0이 아님 
	                  // 기존에 첨부파일이 없다면 fileNo가 0임 
	                  
	                  // 여기서는 기존에 첨부파일이 있는 경우니까 uploadfile을 update 하면 됨!!
	                  result2*= new CourseDao().updateCourseFile(conn, list);
	                  
	                  
	               }else {
	                  // 여기는 fileNo이 없어서 기존에 첨부파일이 없다가 추가하는 경우
	                  //uploadfile에 insert하기 
	                  
	                  
	                  
	                  result2*= new CourseDao().insertNewCourseFile(conn,list);
	                  
	               }
	               
	            }
	               
	            }   
	            
	      
	      if(result1>0 && result2>0) {
	         commit(conn);
	      }else {
	         rollback(conn);
	      }
	      
	      close(conn);
	      
	     
	      return result1 * result2;
	      
	      
	      
	      
	   }
		/**
		 * 여행 코스에 댓글을 작성하는 메소드
		 * @param cno
		 * @param content
		 * @return
		 */
		public int insertCourseReply(Comments com) {
			
			Connection conn = getConnection();
			
			int result = new CourseDao().insertCourseReply(conn, com);
				
			
			
			
			
			if(result>0) {
				commit(conn);
			}else {
				rollback(conn);
			}
			
			
			close(conn);
			
			return result;
			
		
		}
		
		
		
		
		/**
		 * 여행 코스에 작성된 댓글 조회하는 메소드
		 * @return
		 */
		public ArrayList<Comments> selectCourseReply(int cno){
			
			Connection conn = getConnection();
			
			ArrayList<Comments> list = new CourseDao().selectCourseReply(cno, conn);
			
			close(conn);
			
			return list;
			
			
			
		}
		
		
		/**
		 * 여행 코스 좋아요 삽입
		 * @param boardNo
		 * @param memberId
		 * @return
		 */
		public int insertLike(int boardNo, int memberId) {
		      Connection conn = getConnection();
		      int result = new CourseDao().insertLike(conn, boardNo, memberId);
		      if(result>0) {
		         commit(conn);
		      }else {
		         rollback(conn);
		      }
		      close(conn);
		      
		      return result;
		   }

		
		/**
		 * 여행 코스 좋아요 확인 메소드
		 * @param boardNo
		 * @param memberId
		 * @return
		 */
		   public int checkLike(int boardNo, int memberId) {
		      
		      Connection conn = getConnection();
		      int likeResult = new CourseDao().checkLike(conn, boardNo, memberId);
		      close(conn);
		      
		      return likeResult;
		      
		      
		      
		   }

		   
		   
		   /**
			 * 여행 코스 좋아요 삭제 메소드
			 * @param boardNo
			 * @param memberId
			 * @return
			 */
		   public int deleteLike(int boardNo, int memberId) {
		      Connection conn = getConnection();
		      
		      int result = new CourseDao().deleteLike(conn, boardNo, memberId);
		      if(result>0) {
		         commit(conn);
		      }else {
		         rollback(conn);
		      }
		      close(conn);
		      
		      return result;
		   }
		
	
		   
		   
		   /**
			 * 여행 코스 신고 삽입
			 * @param boardNo
			 * @param memberId
			 * @return
			 */
			public int insertReport(int boardNo, int memberId) {
			      Connection conn = getConnection();
			      int result = new CourseDao().insertReport(conn, boardNo, memberId);
			      if(result>0) {
			         commit(conn);
			      }else {
			         rollback(conn);
			      }
			      close(conn);
			      
			      return result;
			   }

			
			/**
			 * 여행 코스 신고 확인 메소드
			 * @param boardNo
			 * @param memberId
			 * @return
			 */
			   public int checkReport(int boardNo, int memberId) {
			      
			      Connection conn = getConnection();
			      int ReportResult = new CourseDao().checkReport(conn, boardNo, memberId);
			      close(conn);
			      
			      return ReportResult;
			      
			      
			      
			   }

			   
			   
			   /**
				 * 여행 코스 신고 삭제 메소드
				 * @param boardNo
				 * @param memberId
				 * @return
				 */
			   public int deleteReport(int boardNo, int memberId) {
			      Connection conn = getConnection();
			      
			      int result = new CourseDao().deleteReport(conn, boardNo, memberId);
			      if(result>0) {
			         commit(conn);
			      }else {
			         rollback(conn);
			      }
			      close(conn);
			      
			      return result;
			   }
			
		
		
			   
			   
			   /**
			    * 여행 코스 댓글 삭제하는 메소드
			 * @return
			 */
			public int deleteCourseReply(int commentNo) {
				   
				Connection conn = getConnection();
				
				int result = new CourseDao().deleteCourseReply(commentNo, conn);
				
				if(result>0) {
					commit(conn);
				}else {
					rollback(conn);
				}
				
				close(conn);
				
				return result;
				
			   }
			   
			   
			   
			   
			   
			   
	

		}
		
	
