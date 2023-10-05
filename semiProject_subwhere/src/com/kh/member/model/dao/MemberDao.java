package com.kh.member.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.board.model.vo.Course;
import com.kh.board.model.vo.Liked;
import com.kh.board.model.vo.Review;
import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

public class MemberDao {
	
	private Properties prop = new Properties();
	
	public MemberDao() { 
		
		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * memberId로 member 조회(갱신된 회원 정보 조회할 때 주로 사용)
	 * @param conn
	 * @param memberId
	 * @return
	 */
	public Member selectMember(Connection conn, String memberId) {
		
		Member m = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectMember"); // 미완성 상태의 쿼리
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO"),
							   rset.getString("MEMBER_NAME"),
							   rset.getString("MEMBER_ID"),
							   rset.getString("MEMBER_PWD"),
							   rset.getString("PHONE"), 
							   rset.getString("EMAIL"), 
							   rset.getString("NICKNAME"), 
							   rset.getString("STATUS"),
							   rset.getDate("ENROLL_DATE"),
							   rset.getString("PROFILE_IMG"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return m;
	}

	/**
	 * 로그인
	 * @param conn
	 * @param memberId
	 * @param memberPwd
	 * @return
	 */
	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		// select문 => ResultSet객체 필요(한 행) = > Member 객체
		
				Member loginMember = null;
				
				PreparedStatement pstmt = null;
				ResultSet rset = null;
				
				try {
					
					String sql = prop.getProperty("loginMember");
					
					pstmt = conn.prepareStatement(sql); // 미완성된 쿼리
					
					pstmt.setString(1, memberId);
					pstmt.setString(2, memberPwd);
					
					rset = pstmt.executeQuery();
					// 조회된 결과가 있다면 한 행 | 조회결과 없다고 하면 아무것도 안 담김
					
					if(rset.next()) {
						// rset에는 db의 컬럼이 들어감 => get~ 가져올 때는 변수명이 아닌 컬럼명 그대로! 써야 함 => 오타나거나 없는 컬럼 쓰면 "부적절한 인덱스~" 오류 뜸
						loginMember = new Member(rset.getInt("MEMBER_NO"),
											     rset.getString("MEMBER_NAME"),
											     rset.getString("MEMBER_ID"),
											     rset.getString("MEMBER_PWD"),
											     rset.getString("PHONE"), 
											     rset.getString("EMAIL"), 
											     rset.getString("NICKNAME"), 
											     rset.getString("STATUS"), 
											     rset.getDate("ENROLL_DATE"),
											     rset.getString("PROFILE_IMG"));
							}
					
				} catch (SQLException e1) {
					e1.printStackTrace();
				} finally {
					close(rset);
					close(pstmt);
				}
				
				return loginMember;
	}
	

	/**
	 * ID 찾기
	 * @param conn
	 * @param memberName
	 * @param email
	 * @return
	 */
	public Member findMemberId(Connection conn, String memberName, String email) {
		
		Member findIdMem = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findMemberId");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberName);
			pstmt.setString(2, email);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				findIdMem = new Member(rset.getInt("MEMBER_NO"),
											     rset.getString("MEMBER_NAME"),
											     rset.getString("MEMBER_ID"),
											     rset.getString("MEMBER_PWD"),
											     rset.getString("PHONE"), 
											     rset.getString("EMAIL"), 
											     rset.getString("NICKNAME"), 
											     rset.getString("STATUS"), 
											     rset.getDate("ENROLL_DATE"),
											     rset.getString("PROFILE_IMG"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return findIdMem;
		
	}

	
	/**
	 * 비밀번호 찾기
	 * @param conn
	 * @param memberId
	 * @param email
	 * @param phone
	 * @return
	 */
	public Member findMemberPwd(Connection conn, String memberId, String email, String phone){

		Member findPwdMem = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("findMemberPwd");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberId);
			pstmt.setString(2, email);
			pstmt.setString(3, phone);
			
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				findPwdMem = new Member(rset.getInt("MEMBER_NO"),
									    rset.getString("MEMBER_NAME"),
									    rset.getString("MEMBER_ID"),
									    rset.getString("MEMBER_PWD"),
									    rset.getString("PHONE"), 
									    rset.getString("EMAIL"), 
							   	        rset.getString("NICKNAME"), 
								        rset.getString("STATUS"), 
									    rset.getDate("ENROLL_DATE"),
									    rset.getString("PROFILE_IMG"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		
		return findPwdMem;
	}

	
	
	/**
	 * 비밀번호 변경하기
	 * @param conn
	 * @param memberId
	 * @param memberPwd
	 * @param updatePwd
	 * @return
	 */
	public int updateMemberPwd(Connection conn, String memberId, String updatePwd) {
		// update문 => 처리된 행 개수 => 트랜젝션 처리
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateMemberPwd");
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, memberId);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}
	
	
	

	   // ------------------------------- 수진 ----------------------------
	   // ajax 아이디 중복 체크
	      public int idCheck(Connection conn, String checkId) {
	         // select문 => ResultSet => 한개 숫자 => int
	         
	         int count = 0;
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         String sql = prop.getProperty("idCheck");
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, checkId);
	            
	            rset = pstmt.executeQuery();
	            if(rset.next()) {
	               count = rset.getInt("count"); // count(*)을 별칭 count로 줌
	            }
	         } catch (SQLException e) {
	            e.printStackTrace();
	         } finally {
	            close(rset);
	            close(pstmt);
	         }
	         
	         return count;
	      }
	      
	      
	      public int insertMember(Connection conn, Member m) {
	         //insert
	         int result = 0;
	         PreparedStatement pstmt = null;
	         
	         String sql = prop.getProperty("insertMember");
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, m.getMemberName());
	            pstmt.setString(2, m.getMemberId());
	            pstmt.setString(3, m.getMemberPwd());
	            pstmt.setString(4, m.getPhone());
	            pstmt.setString(5, m.getEmail());
	            pstmt.setString(6, m.getNickname());
	            pstmt.setString(7, m.getProfileImg());
	            
	            result = pstmt.executeUpdate();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         } finally {
	            close(pstmt);
	         }
	         
	         return result;
	         
	      }
	      
	    //마이페이지 개인정보 변경
	      public int updateMember(Connection conn,Member m) {
	         //update문
	         PreparedStatement pstmt = null;
	         
	         int result = 0;
	         
	         String sql = prop.getProperty("updateMember");
	         
	      
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	            
	            pstmt.setString(1, m.getProfileImg());
	            pstmt.setString(2, m.getNickname());
	            pstmt.setString(3, m.getEmail());
	            pstmt.setString(4, m.getPhone());
	            pstmt.setString(5, m.getMemberId());
	            
	            result = pstmt.executeUpdate();
	            
	            
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }finally {
	            close(pstmt);
	         }
	         
	         return result;
	      }


	   //탈퇴
	      public int deleteMember(Connection conn,String memberId,String memberPwd) {
	         
	         PreparedStatement pstmt = null;
	         int result = 0;
	         
	         String sql = prop.getProperty("deleteMember");
	         
	         try {
	            pstmt=conn.prepareStatement(sql);
	            
	            pstmt.setString(1, memberId);
	            pstmt.setString(2, memberPwd);
	            result = pstmt.executeUpdate();
	            
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }finally {
	            close(pstmt);
	         }
	         return result;
	      }

	   //여행 후기 게시판 댓글 전체 리스트(페이징 용)
	      public int selectcReviewListCount(Connection conn, int memberno) {
	         int rlistCount = 0;
	         
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         
	         String sql = prop.getProperty("selectrreviewListCount");
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1,memberno );
	            
	            rset = pstmt.executeQuery();
	            
	            if(rset.next()) {
	               rlistCount = rset.getInt("count");
	            }
	            
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	         return rlistCount;
	      }

	   //비밀번호 변경
	      public int myupdatePwd(Connection conn,String memberId,String memberPwd,String updatePwd) {
	         int result = 0;
	         PreparedStatement pstmt = null;
	         
	         String sql = prop.getProperty("updateMemberPwd");
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setString(1, updatePwd);
	            pstmt.setString(2, memberId);
	            pstmt.setString(3, memberPwd);
	            
	            result = pstmt.executeUpdate();
	            
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(pstmt);
	         }
	         return result;
	         
	      }

	   //마이페이지 후기글 댓글 리스트 + 페이징 바
	      public ArrayList<Comments> selectRreviewList(Connection conn,int memberno,PageInfo pi){
	         
	         ArrayList<Comments> list = new ArrayList<Comments>();
	         
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         
	         String sql = prop.getProperty("selectRlist");
	         
	         int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1; //페이징 바 시작 번호
	         int endRow = startRow + pi.getBoardLimit()-1; //페이징 바 마지막 번호
	         
	         try {
	            pstmt= conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, memberno);
	            pstmt.setInt(2, startRow);
	            pstmt.setInt(3, endRow);
	            
	            rset= pstmt.executeQuery();
	            
	            while(rset.next()) {
	               list.add(new Comments(rset.getString("BOARD_NO"),
	                                 rset.getString("COMMENT"),
	                                 rset.getString("MODIFY_DATE"),
	                                 rset.getString("TITLE")
	                                 ));
	            }
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	         return list;
	         
	         
	      }

	     //코스 게시판 댓글 전체 리스트 (페이징)
	        public int selectCosListCount(Connection conn,int memberNo){
	           
	           int clistCount = 0;
	           
	           PreparedStatement pstmt = null;
	           ResultSet rset = null;
	           String sql = prop.getProperty("selectCosListCount");
	           
	           
	           try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, memberNo);
	            
	            rset = pstmt.executeQuery();
	            
	            if(rset.next()) {
	               clistCount = rset.getInt("count");
	            }
	            
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	         return clistCount;
	            

	      }

	         //마이페이지 코스글 댓글
	   //   public ArrayList<Comments> selectmyCreview(Connection conn,int memberNo){
//	         ArrayList<Comments> clist = new ArrayList<Comments>();
//	         
//	         PreparedStatement pstmt = null;
//	         
//	         ResultSet rset = null;
//	         
//	         String sql = prop.getProperty("selectmyCreview");
//	         
//	         try {
//	            pstmt=conn.prepareStatement(sql);
//	            
//	            pstmt.setInt(1, memberNo);
//	            
//	            rset=pstmt.executeQuery();
//	            
//	            while(rset.next()) {
//	               clist.add(new Comments(rset.getString("MODIFY_DATE"),
//	                                 rset.getString("TITLE"),
//	                                 rset.getString("COMMENT")
//	                                 ));
//	            }
	   //
//	         } catch (SQLException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	         }finally {
//	            close(rset);
//	            close(pstmt);
//	         }
//	         return clist;
//	         
	   //   }
	      
	      //마이페이지 코스글 댓글
	        public ArrayList<Comments> selectmyCreview(Connection conn,int memberNo,PageInfo pi){
	           ArrayList<Comments> clist = new ArrayList<Comments>();
	           
	           PreparedStatement pstmt = null;
	           
	           ResultSet rset = null;
	           
	           String sql = prop.getProperty("selectmyCreview");
	           int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1; //페이징 시작번호 미완성 쿼리 앞"?"
	           int endRow = startRow + pi.getBoardLimit() - 1; //페이징 마지막 번호 미완성 쿼리뒤 "?"
	           
	           try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, memberNo);
	            pstmt.setInt(2, startRow);
	            pstmt.setInt(3, endRow);
	            
	            rset= pstmt.executeQuery();
	            
	            while(rset.next()) {
	               clist.add(new Comments(rset.getString("BOARD_NO"),
	                             rset.getString("COMMENT"),
	                                 rset.getString("MODIFY_DATE"),
	                                 rset.getString("TITLE")
	                                 ));
	            }
	            
	            
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	           return clist;
	        }

	      //마이페이지 여행지 게시판 댓글
	   //   public ArrayList<Comments> selectmyDreview(Connection conn,int memberno){
//	         
//	         ArrayList<Comments> dlist = new ArrayList<Comments>();
//	         
//	         PreparedStatement pstmt = null;
//	         
//	         ResultSet rset = null;
//	         
//	         String sql = prop.getProperty("selectmyRreview");
//	         
//	         try {
//	            pstmt = conn.prepareStatement(sql);
//	            
//	            pstmt.setInt(1, memberno);
//	            rset=pstmt.executeQuery();
//	            
//	            while(rset.next()) {
//	               dlist.add(new Comments(rset.getString("MODIFY_DATE"),
//	                                 rset.getString("TITLE"),
//	                                 rset.getString("COMMENT")
//	                                 ));
//	            }
//	                  
//	            
//	         } catch (SQLException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	         }finally {
//	            close(rset);
//	            close(pstmt);
//	         }
//	         return dlist;
//	         
	   //   }
	        
	        //여행지 댓글 조회 + 페이징
	        public ArrayList<Comments> selectmyDreview(Connection conn,int memberno,PageInfo pi){
	           ArrayList<Comments> dlist = new ArrayList<Comments>();
	           
	           PreparedStatement pstmt = null;
	           ResultSet rset = null;
	           
	           String sql = prop.getProperty("selectmyRreview");
	           int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1; //페이징 시작번호 미완성 쿼리 앞"?"
	           int endRow = startRow + pi.getBoardLimit() - 1; //페이징 마지막 번호 미완성 쿼리뒤 "?"
	           
	           try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, memberno);
	            pstmt.setInt(2, startRow);
	            pstmt.setInt(3, endRow);
	            
	            rset=pstmt.executeQuery();
	            
	            while(rset.next()) {
	               dlist.add(new Comments(rset.getString("BOARD_NO"),
	                              rset.getString("COMMENT"),
	                                 rset.getString("MODIFY_DATE"),
	                                 rset.getString("TITLE")
	                                 ));
	            }
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	           return dlist;
	        }
	        
	      
	      //여행지 댓글 전체
	      public int selectDListCount(Connection conn,int memberno) {
	         
	         int dlistCount = 0;
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         
	         String sql = prop.getProperty("selectDListCount");
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, memberno);
	            rset=pstmt.executeQuery();
	            
	            if(rset.next()) {
	               dlistCount=rset.getInt("count");
	            }
	            
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	            return dlistCount;
	      }
	      
	      //마이페이지 여행코스 게시글 개수
	      public int selectCboardCount(Connection conn,int memberno) {
	         
	         int listCount = 0;
	         
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         
	         String sql = prop.getProperty("selectCboardCount");
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            pstmt.setInt(1, memberno);
	            rset=pstmt.executeQuery();
	            
	            if(rset.next()) {
	               listCount=rset.getInt("count");
	            }
	      
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	         
	         return listCount;
	      }
	      
	      //여행 코스 내가 쓴 글 + 페이징
	      
	      public ArrayList<Course> selectbcosList(Connection conn,PageInfo pi,int memberno){
	         
	         ArrayList<Course> blist = new ArrayList<Course>();
	         
	         PreparedStatement pstmt = null;
	         
	         ResultSet rset = null;
	         String sql = prop.getProperty("selectbcosList");
	         
	         int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1; //페이징 시작번호 미완성 쿼리 앞"?"
	         int endRow = startRow + pi.getBoardLimit() - 1; //페이징 마지막 번호 미완성 쿼리뒤 "?"
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, memberno);
	            pstmt.setInt(2, startRow);
	            pstmt.setInt(3, endRow);
	            
	            rset = pstmt.executeQuery();
	            
	            while(rset.next()) {
	               blist.add(new Course(rset.getString("BOARD_NO"),
	                                 rset.getString("TITLE"),
	                                 rset.getString("CONTENT"),
	                                 rset.getInt("COUNT"),
	                                 rset.getString("CREATE_DATE"),
	                                 rset.getString("TITLE_IMG")
	                                 )); 
	            }
	            
	            
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	         return blist;
	      }
	      
	      
	      

	      //마이페이지 여행코스 게시글
	   //   public ArrayList<Course> selectbcosList(Connection conn,int memberno){
//	         
//	         ArrayList<Course> blist = new ArrayList<Course>();
//	         
//	         PreparedStatement pstmt = null;
//	         ResultSet rset = null;
//	         
//	         String sql = prop.getProperty("selectbcosList");
//	         
//	         try {
//	            pstmt=conn.prepareStatement(sql);
//	            
//	            pstmt.setInt(1, memberno);
//	            rset=pstmt.executeQuery();
//	            
//	            while(rset.next()) {
//	               
//	               blist.add(new Course(rset.getString("TITLE"),
//	                                 rset.getString("CONTENT"),
//	                                 rset.getInt("COUNT"),
//	                                 rset.getString("CREATE_DATE"),
//	                                 rset.getString("TITLE_IMG")
//	                                 )); 
//	               
//	            }
//	            
//	            
//	         } catch (SQLException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	         }finally {
//	            close(pstmt);
//	            close(rset);
//	         }
//	         return blist;
//	         
	   //   }
	      
	      //마이페이지 내가 쓴 후기글 개수
	      public int selectReBoardCount(Connection conn,int memberno) {
	         
	         int klistCount = 0;
	         
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         
	         String sql = prop.getProperty("selectReBoardCount");
	         
	         try {
	            pstmt= conn.prepareStatement(sql);
	            pstmt.setInt(1, memberno);
	            
	            rset = pstmt.executeQuery();
	            
	            if(rset.next()) {
	               klistCount=rset.getInt("count");
	            }

	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	         return klistCount;
	      }
	      
	      //마이페이지 후기글 게시글 + 페이징
	      
	      public ArrayList<Review> selectReview(Connection conn,PageInfo pi,int memberno){
	         ArrayList<Review> list = new ArrayList<Review>();
	         
	         PreparedStatement pstmt = null;
	         
	         ResultSet rset = null;
	         String sql = prop.getProperty("selectReview");
	         
	         int startRow = (pi.getCurrentPage()-1)*pi.getBoardLimit()+1; //페이징 시작번호 미완성 쿼리 앞"?"
	         int endRow = startRow + pi.getBoardLimit() - 1; //페이징 마지막 번호 미완성 쿼리뒤 "?"
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, memberno);
	            pstmt.setInt(2, startRow);
	            pstmt.setInt(3, endRow);
	            
	            rset=pstmt.executeQuery();
	            
	            while(rset.next()) {
	               list.add(new Review(rset.getString("BOARD_NO"),
	                              rset.getString("TITLE"),
	                              rset.getString("CONTENT"),
	                              rset.getInt("COUNT"),
	                              rset.getString("CREATE_DATE"),
	                              rset.getString("TITLE_IMG")
	                              ));
	            
	            }
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally {
	            close(rset);
	            close(pstmt);
	         }
	         return list;
	      }
	      
	      

	      //마이페이지 후기글 게시글
	   //   public ArrayList<Review> selectReview(Connection conn,int memberno){
//	         ArrayList<Review> list = new ArrayList<Review>();
//	         
//	         PreparedStatement pstmt = null;
//	         ResultSet rset = null;
//	         
//	         String sql = prop.getProperty("selectReview");
//	         
//	         try {
//	            pstmt=conn.prepareStatement(sql);
//	            
//	            pstmt.setInt(1, memberno);
//	            
//	            rset=pstmt.executeQuery();
//	            
//	            while(rset.next()) {
//	               list.add(new Review(rset.getString("TITLE"),
//	                              rset.getString("CONTENT"),
//	                              rset.getInt("COUNT"),
//	                              rset.getString("CREATE_DATE"),
//	                              rset.getString("TITLE_IMG")
//	                              ));
//	               
//	            }
	   //
//	         } catch (SQLException e) {
//	            // TODO Auto-generated catch block
//	            e.printStackTrace();
//	         }finally {
//	            close(rset);
//	            close(pstmt);
//	         }
//	         return list;
	   //   }
	      
	      //좋아요 보관함
	      public ArrayList<Liked> mylikelist(Connection conn,int memberno){
	         ArrayList<Liked> list = new ArrayList<Liked>();
	         
	         PreparedStatement pstmt = null;
	         ResultSet rset = null;
	         
	         String sql = prop.getProperty("mylikelist");
	         
	         try {
	            pstmt = conn.prepareStatement(sql);
	            
	            pstmt.setInt(1, memberno);
	            pstmt.setInt(2, memberno);
	            pstmt.setInt(3, memberno);
	            
	            rset=pstmt.executeQuery();
	            
	            while(rset.next()) {
	               list.add(new Liked(rset.getString("BOARD_NO"),
	                              rset.getString("TITLE_IMG"),
	                              rset.getString("title")));
	            }
	      
	            
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }finally{
	            close(rset);
	            close(pstmt);
	         }
	         return list;
	         
	      }
	
	

}
