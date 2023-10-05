package com.kh.board.model.dao;


import java.awt.Taskbar.State;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import javax.management.remote.JMXConnectionNotification;

import org.apache.catalina.util.StandardSessionIdGenerator;
import org.apache.tomcat.util.http.fileupload.UploadContext;

import static com.kh.common.JDBCTemplate.*;


import com.kh.board.model.vo.Course;
import com.kh.board.model.vo.Station;
import com.kh.board.model.vo.Uploadfile;
import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.PageInfo;




public class CourseDao {
	
	private Properties prop = new Properties();

	public CourseDao() {
		
		String filePath = CourseDao.class.getResource("/db/sql/course-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 여행 코스 게시물 목록을 조회하는 쿼리
	 * @param conn
	 * @return
	 */
	public ArrayList<Course> selectCourseList(Connection conn, PageInfo pi){
		
		// select문 -> resultset필요
		// arraylist필요 
		
		
		ArrayList<Course> list = new ArrayList<Course>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCourseList");
		
		int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Course(rset.getString("BOARD_NO"),
						 	        rset.getString("NICKNAME"),
						 	        rset.getString("TITLE"),
						 	        rset.getString("CONTENT"),
						 	        rset.getString("COURSE_TIP"),
						 	        rset.getString("STATION_NO"),
						 	        rset.getString("DTN_1"),
						 	        rset.getString("DTN_2"),
						 	        rset.getString("DTN_3"),
						 	        rset.getString("DTN_4"),
						 	        rset.getInt("COUNT"),
						 	        rset.getString("CREATE_DATE"),
						 	        rset.getDate("MODIFY_DATE"),
						 	        rset.getString("TITLEIMG")
						 	        ));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
			
	
		
	}
	
	
	/**
	 * 여행 코스 작성하기 전에 station을 조회하는 메소드
	 * @return
	 */
	public ArrayList<Station> selectStaion(Connection conn,int num){
		
		// resultset필요 
		
		
		ArrayList<Station> list = new ArrayList<Station>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Station(rset.getInt("station_no"),
									 rset.getString("station_name"),
									 rset.getInt("line")));
				
				
				
			}
			
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
		
		
		
		
		
	}
	
	
	
	/**
	 * course에 사용자가 작성한 값을 course 테이블에 insert하는 메소드 
	 * @return
	 */
	public int insertCourse(Connection conn,Course c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCourse");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(c.getMemberNo()));
			pstmt.setString(2, c.getCourseTitle());
			pstmt.setString(3, c.getCourseContent());
			pstmt.setString(4, c.getCourseTip());
			pstmt.setInt(5, Integer.parseInt(c.getStationNo()));
			pstmt.setString(6, c.getDtn1());
			pstmt.setString(7, c.getDtn2());
			pstmt.setString(8, c.getDtn3());
			pstmt.setString(9, c.getDtn4());
			
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
	}
	
	
	/**
	 * course 작성시 첨부파일을 insert하는 메소드 
	 * @return
	 */
	public int insertUploadFileCourse(Connection conn,ArrayList<Uploadfile> list) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertUploadFileCourse");
		
		try {
			
			for(Uploadfile upf : list) {
				
				pstmt = conn.prepareStatement(sql);
				
				//pstmt.setInt(1, Integer.parseInt(upf.getRefdBoardNo()));
				pstmt.setString(1, upf.getOriginName());
				pstmt.setString(2, upf.getChangeName());
				pstmt.setString(3, upf.getFilePath());
				pstmt.setInt(4, upf.getFileLevel());
		 
				result = pstmt.executeUpdate();
				
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * 여행 코스 게시글의 총 개수를 알아오는 메소드
	 * @return
	 */
	public int courseAllCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("courseAllCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				count = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return count;
		
	}
	
	
	
	/**
	 * 여행 코스 목록에서 특정 호선 버튼을 누르면 해당 호선의 여행 코스만을 보여주는 메소드
	 * @return
	 */
	public ArrayList<Course> selectLineList(Connection conn,int line, PageInfo pi){
	      
	      ArrayList<Course> list = new ArrayList<Course>();
	      
	      
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      
	      String sql = prop.getProperty("selectLineList");
	      
	      int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+1;
	      int endRow = startRow + pi.getBoardLimit() -1;
	      
	      
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, line);
	         pstmt.setInt(2, startRow);
	         pstmt.setInt(3, endRow);
	         
	         
	         rset = pstmt.executeQuery();
	         
	         
	         
	         while(rset.next()) {
	            list.add(new Course(
	                            rset.getString("board_no"),
	                            rset.getString("nickname"),
	                            rset.getString("title"),
	                            rset.getString("content"),
	                            rset.getString("course_tip"),
	                            rset.getString("station_no"),
	                            rset.getString("dtn_1"),
	                            rset.getString("dtn_2"),
	                            rset.getString("dtn_3"),
	                            rset.getString("dtn_4"),
	                            rset.getInt("count"),
	                            rset.getString("create_date"),
	                            rset.getString("station_name"),
	                            rset.getInt("line"),
	                            rset.getString("titleimg")));
	            
	            
	         }
	         
	      } catch (SQLException e) {
	         
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      return list;
	      
	   }
	   
	
	
	/**
	 *  여행 코스 조회수를 증가시키는 메소드
	 * @param conn
	 * @param cno
	 * @return
	 */
	public int increaseCourseCount(Connection conn, int cno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseCourseCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * 사용자가 선택한 코스의 자세한 내용을 조회하는 메소드
	 * @return
	 */
	public Course selectCourseDetail(Connection conn,int cno) {
		
		Course c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCourseDetail");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				c = new Course(
					    rset.getString("board_no"),
					    rset.getString("nickname"),
					    rset.getString("title"),
					    rset.getString("content"),
					    rset.getString("course_tip"),
					    rset.getString("station_no"),
					    rset.getString("dtn_1"),
					    rset.getString("dtn_2"),
					    rset.getString("dtn_3"),
					    rset.getString("dtn_4"),
					    rset.getInt("count"),
					    rset.getString("create_date"),
					    rset.getString("station_name"),
					    rset.getInt("line"),
					    rset.getString("titleimg"));
				
			}
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
			
		
		
		return c;
		
		
	}
	
	/**
	 * 여행 코스 조회할 때 첨부파일도 같이 조회하는 메소드
	 * @return
	 */
	public ArrayList<Uploadfile> selectCourseFile(Connection conn,int cno){
		
		ArrayList<Uploadfile> list = new ArrayList<Uploadfile>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCourseFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Uploadfile(rset.getInt("file_no"),
									    rset.getString("refd_bno"),
									    rset.getString("origin_name"),
									    rset.getString("change_name"),
									    rset.getString("file_path"),
									    rset.getDate("upload_date"),
									    rset.getInt("file_level")));
				
				
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(rset);
		}
		
		return list;
		
		
		
	}
	
	
	
	/**
	 * 여행코스 삭제하는 메소드 
	 * @param cno
	 * @param conn
	 * @return
	 */
	public int deleteCourse(int cno, Connection conn) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCourse");

		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	/**
	 * 여행코스 게시물을 삭제하면 거기에 첨부된 파일도 아예 삭제해버리는 메소드
	 * @return
	 */
	public int deleteCourseFile(int cno,Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteCourseFile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	
	
	
	
	/**
	 * 작성자가 선택한 역을 조회하는 메소드
	 * @param conn
	 * @param cno
	 * @return
	 */
	public Station selectStationUpdate(Connection conn,int cno) {
		
		
		Station st = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStationUpdate");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				st = new Station(rset.getInt("station_no"),
							     rset.getString("station_name"),
							     rset.getInt("line"));
				
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		return st;
		
		
		
		
		
	}
	
	
	/**
	 * Course에 update하는 메소드 (첨부파일 수정할 때 먼저 기존에 있던 첨부파일은 status를 n으로 만들기)
	 * @return
	 */
	public int updateCourse(Connection conn, Course c) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateCourse");
		
		try {
			
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, Integer.parseInt(c.getStationNo()));
			pstmt.setString(2, c.getCourseTitle());
			pstmt.setString(3, c.getCourseContent());
			pstmt.setString(4, c.getCourseTip());
			pstmt.setString(5, c.getDtn1());
			pstmt.setString(6, c.getDtn2());
			pstmt.setString(7, c.getDtn3());
			pstmt.setString(8, c.getDtn4());
			pstmt.setInt(9, Integer.parseInt(c.getBoardNo()));
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
	}
	
	
	
	/**
	 * Course에 file update하는 메소드
	 * @return
	 */
	public int updateCourseFile(Connection conn,ArrayList<Uploadfile> list) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		
		
		String sql = prop.getProperty("updateCourseFile");
		
		try {
			
			
			for(Uploadfile upf : list) {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, upf.getOriginName()); // ORIGIN_NAME
				pstmt.setString(2, upf.getChangeName()); // CHANGE_NAME
				pstmt.setString(3, upf.getFilePath()); // FILE_PATH
				pstmt.setInt(4, upf.getFileNo()); // FILE_NO
			
				pstmt.setInt(5, upf.getFileLevel()); // FILE_LEVEL
				
				result= pstmt.executeUpdate();
				
				
				
			}
			
			
			
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
		
		
	}
	
	
	
	/**
	 * 여행 코스에 첨부파일이 없다가 추가하는 경우 insert하는 메소드
	 * 
	 * @param conn
	 * @param list
	 * @param cno
	 * @return
	 */
	public int insertNewCourseFile(Connection conn,ArrayList<Uploadfile> list) {
		
		int result = 0;
		
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNewCourseFile");
		
		try {
			
	   for(Uploadfile upf : list) {
		   pstmt = conn.prepareStatement(sql);
		   
		   pstmt.setInt(1, Integer.parseInt(upf.getRefdBoardNo()));
		   pstmt.setString(2, upf.getOriginName()); // ORIGIN_NAME
		   pstmt.setString(3, upf.getChangeName()); // CHANGE_NAME
		   pstmt.setString(4, upf.getFilePath());   // FILE_PATH
		   pstmt.setInt(5, upf.getFileLevel());     // FILE_LEVEL
		   
		   result = pstmt.executeUpdate();
		   
	   }
		
	   
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
//	public int UpdateStatusCourseFile(ArrayList<Uploadfile> list, Connection conn) {
//		
//		int result = 0;
//		
//		PreparedStatement pstmt = null;
//		
//		String sql = prop.getProperty("UpdateStatusCourseFile");
//		
//		try {
//			
//		for(Uploadfile upf : list) {
//			
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setInt(1, upf.getRefdBno());
//			
//			result = pstmt.executeUpdate();
//		}
//		
//		
//		} catch (SQLException e) {
//			
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		return result;
//		
//	}
//	
//	
	
	/**
	 * 여행 코스 게시글 수정할 때 기존에 있던 첨부파일을 삭제하는 메소드
	 * @return
	 */
//	public int deleteOriginCourseFile(ArrayList<Uploadfile> list,Connection conn) {
//		
//		int result = 0;
//		PreparedStatement pstmt = null;
//		
//		String sql = prop.getProperty("deleteOriginCourseFile");
//		
//		try {
//			pstmt = conn.prepareStatement(sql);
//			
//			pstmt.setInt(1, fileNo);
//			
//			result = pstmt.executeUpdate();
//		} catch (SQLException e) {
//			
//			e.printStackTrace();
//		}finally {
//			close(pstmt);
//		}
//		
//		return result;
//		
//		
//	}
	
	
	
	/**
	 * 여행코스에 댓글을 작성하는 메소드
	 * @return
	 */
	public int insertCourseReply(Connection conn, Comments com) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertCourseReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, com.getMemberNo());
			pstmt.setString(2, com.getBoardNo());
			pstmt.setString(3, com.getCommentContent());
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	
	/**
	 * 여행 코스에 작성된 게시물을 조회하는 메소드
	 * @return
	 */
	public ArrayList<Comments> selectCourseReply(int cno,Connection conn){
		
		
		ArrayList<Comments> list = new ArrayList<Comments>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String sql = prop.getProperty("selectCourseReply");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, cno);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				
				list.add(new Comments(rset.getInt("comment_no"),
									  rset.getInt("member_no"),
									  
									  rset.getString("board_no"),
									  rset.getString("comment_content"),
									  rset.getString("enroll_date"),
									  rset.getString("nickname")));
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
 	
	/**
	 * 여행 코스 좋아요 삽입
	 * @param boardNo
	 * @param memberId
	 * @return
	 */
	public int insertLike(Connection conn, int boardNo, int memberId) {
	      int result = 0;
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("insertLike");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, memberId);
	         pstmt.setString(2, boardNo+"");
	         result = pstmt.executeUpdate();
	         
	         
	      } catch (SQLException e) {
	         
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      
	      
	      return result;
	   }

	
	/**
	 * 여행 코스 좋아요 체크 메소드
	 * @param boardNo
	 * @param memberId
	 * @return
	 */
	   public int checkLike(Connection conn, int boardNo, int memberId) {
	      int likeResult = 0;
	      PreparedStatement pstmt = null;
	      ResultSet rset = null;
	      String sql = prop.getProperty("checkLike");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         pstmt.setInt(1, memberId);
	         pstmt.setString(2, boardNo + "");
	         rset = pstmt.executeQuery();
	         
	         if(rset.next()) {
	            likeResult = 1;
	            
	         }
	      } catch (SQLException e) {
	         
	         e.printStackTrace();
	      }finally {
	         close(rset);
	         close(pstmt);
	      }
	      
	      
	      
	      
	      
	      return likeResult;
	   }

	   
	   /**
		 * 여행 코스 좋아요 삭제
		 * @param boardNo
		 * @param memberId
		 * @return
		 */
	   public int deleteLike(Connection conn, int boardNo, int memberId) {
	      
	      int result = 0;
	      PreparedStatement pstmt = null;
	      String sql = prop.getProperty("deleteLike");
	      try {
	         pstmt = conn.prepareStatement(sql);
	         
	         pstmt.setInt(1, memberId);
	         pstmt.setString(2, boardNo+"");
	         
	         result = pstmt.executeUpdate();
	         
	         
	      } catch (SQLException e) {
	         
	         e.printStackTrace();
	      }finally {
	         close(pstmt);
	      }
	      
	      
	      return result;
	   }
	
	   
	   /**
		 * 여행 코스 신고 삽입
		 * @param boardNo
		 * @param memberId
		 * @return
		 */
		public int insertReport(Connection conn, int boardNo, int memberId) {
		      int result = 0;
		      PreparedStatement pstmt = null;
		      String sql = prop.getProperty("insertReport");
		      try {
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, memberId);
		         pstmt.setString(2, boardNo+"");
		         result = pstmt.executeUpdate();
		         
		         
		      } catch (SQLException e) {
		         
		         e.printStackTrace();
		      }finally {
		         close(pstmt);
		      }
		      
		      
		      return result;
		   }

		
		/**
		 * 여행 코스 신고 체크 메소드
		 * @param boardNo
		 * @param memberId
		 * @return
		 */
		   public int checkReport(Connection conn, int boardNo, int memberId) {
		      int reportResult = 0;
		      PreparedStatement pstmt = null;
		      ResultSet rset = null;
		      String sql = prop.getProperty("checkReport");
		      try {
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, memberId);
		         pstmt.setString(2, boardNo + "");
		         rset = pstmt.executeQuery();
		         
		         if(rset.next()) {
		        	 reportResult = 1;
		            
		         }
		      } catch (SQLException e) {
		         
		         e.printStackTrace();
		      }finally {
		         close(rset);
		         close(pstmt);
		      }
		      
		      
		      
		      
		      
		      return reportResult;
		   }

		   
		   /**
			 * 여행 코스 신고 삭제
			 * @param boardNo
			 * @param memberId
			 * @return
			 */
		   public int deleteReport(Connection conn, int boardNo, int memberId) {
		      
		      int result = 0;
		      PreparedStatement pstmt = null;
		      String sql = prop.getProperty("deleteReport");
		      try {
		         pstmt = conn.prepareStatement(sql);
		         
		         pstmt.setInt(1, memberId);
		         pstmt.setString(2, boardNo+"");
		         
		         result = pstmt.executeUpdate();
		         
		         
		      } catch (SQLException e) {
		         
		         e.printStackTrace();
		      }finally {
		         close(pstmt);
		      }
		      
		      
		      return result;
		   }
	
		   
		   
		   
		   /**
		    * 여행 코스 댓글 삭제하는 메소드 
		 * @return
		 */
		public int deleteCourseReply(int  commentNo,Connection conn) {
			   
			
			int result = 0;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("deleteCourseReply");
			
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, commentNo);
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
			return result;
			
		   }
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
	
}
