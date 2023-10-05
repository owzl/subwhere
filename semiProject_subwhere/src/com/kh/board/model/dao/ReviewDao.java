package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;
import java.util.prefs.PreferenceChangeListener;

import com.kh.board.model.vo.Review;
import com.kh.board.model.vo.Station;
import com.kh.board.model.vo.Uploadfile;
import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class ReviewDao {

   
   private Properties prop = new Properties();
   public ReviewDao() {
      try {
         prop.loadFromXML(new FileInputStream(ReviewDao.class.getResource("/db/sql/review-mapper.xml").getPath()));
      } catch (IOException e) {
         e.printStackTrace();
      }
   }
   
   // selecBox 가져오기
   public ArrayList<Station> selectStation(Connection conn, int num) {
      
      ArrayList<Station> list = new ArrayList<Station>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectStation");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, num);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Station(rset.getInt("station_no")         // 101
                             , rset.getString("station_name")      // 용산역
                             , rset.getInt("line")));            // 1
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }

   
   // 1) review에 insert
   public int insertReview(Connection conn, Review r) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("insertReview");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, Integer.parseInt(r.getStationNo()));
         pstmt.setInt(2, Integer.parseInt(r.getBoardWriter()));
         pstmt.setString(3, r.getTitle());
         pstmt.setString(4, r.getAddress());
         pstmt.setString(5, r.getContent());
         pstmt.setString(6, r.getTip());
         
         result = pstmt.executeUpdate();
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }
   
   // 2) uploadfile에 insert
   public int insertUploadfile(Connection conn, ArrayList<Uploadfile> list) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("insertUploadfile");
      
      try {
         
         for(Uploadfile up : list) {
            
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, up.getOriginName());
            pstmt.setString(2, up.getChangeName());
            pstmt.setString(3, up.getFilePath());
            pstmt.setInt(4, up.getFileLevel());
            
            result = pstmt.executeUpdate();
         }
      
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }
   
   // 여행후기 리스트 게시글들 조회 (with pagingbar)
   public ArrayList<Review> selectReviewList(Connection conn, PageInfo pi) {
      
      ArrayList<Review> list = new ArrayList<Review>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectReviewList");
      
      int startRow = (pi.getCurrentPage() -1) * pi.getBoardLimit() +1;
      int endRow = startRow + pi.getBoardLimit() -1;
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, startRow);
         pstmt.setInt(2, endRow);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Review(rset.getString("board_no")
                          , rset.getString("station_no")
                          , rset.getString("board_writer")
                          , rset.getString("title")
                          , rset.getString("address")
                          , rset.getString("content")
                          , rset.getString("tip")
                          , rset.getInt("count")
                          , rset.getString("titleimg")
                        ));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
      
   }
   
   
   // * 여행후기 호선별 게시글들 조회
   public ArrayList<Review> selectReviewLineList(Connection conn, int line) {
      
      ArrayList<Review> list = new ArrayList<Review>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectReviewLineList");
      
      try {
         
         pstmt = conn.prepareStatement(sql);      
   
         pstmt.setInt(1, line);
         
         rset = pstmt.executeQuery();
         
         while(rset.next()) {
            list.add(new Review(rset.getString("board_no")
                          , rset.getString("station_no")
                          , rset.getString("board_writer")
                          , rset.getString("title")
                          , rset.getString("address")
                          , rset.getInt("count")
                          , rset.getString("titleimg")
                          , rset.getInt("line")
                        ));
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
      
   }
   
   
   
   
   // 총 게시물 수 (페이징)
   public int selectListCount(Connection conn) {
      
      int listCount = 0;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectListCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         rset =  pstmt.executeQuery();
         
         if(rset.next()) {
            listCount = rset.getInt("count"); // 별칭
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return listCount;
   }
   
   // 조회수 증가
   public int increaseCount(Connection conn, int boardNo) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      String sql = prop.getProperty("increaseCount");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, boardNo);

         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
      
   }
   
   // 1) 여행후기 상세페이지 (글)
   public Review selectReview(Connection conn, int boardNo) {
      
      Review r = null;
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectReview");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, boardNo);
         
         rset = pstmt.executeQuery();
         
         if(rset.next()) {
            r = new Review(rset.getString("board_no")
                      , rset.getString("station_no")
                      , rset.getString("member_id")
                      , rset.getString("title")
                      , rset.getString("address")
                      , rset.getString("content")
                      , rset.getString("tip")
                      , rset.getInt("count")
                      , rset.getString("create_date")
                      , rset.getString("modify_date")
                      , rset.getString("station_name")
                      , rset.getInt("line")
                      );
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return r;
      
   }
   
   // 2) 여행후기 상세페이지 (사진)
   public ArrayList<Uploadfile> selectUploadfileList(Connection conn, int boardNo) {
      
      ArrayList<Uploadfile> list = new ArrayList<Uploadfile>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectUploadfileList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, boardNo);
         
         rset = pstmt.executeQuery();
         while(rset.next()) {
            Uploadfile up = new Uploadfile();
            up.setFileNo(rset.getInt("file_no"));
            up.setRefdBoardNo((rset.getString("refd_bno")));
            up.setOriginName(rset.getString("origin_name"));
            up.setChangeName(rset.getString("change_name"));
            up.setFilePath(rset.getString("file_path"));
            up.setFileLevel(rset.getInt("file_level"));
            up.setStatus(rset.getString("status"));
         
            list.add(up);
         }
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      return list;
   }
   
   
   // 여행후기 게시글 삭제
   public int deleteReview(Connection conn, int boardNo) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteReview");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, boardNo);
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }
   
   
   // 댓글 등록
   public int insertReply(Connection conn, Comments c) { // c : 댓글내용, 게시글번호, 회원번호
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("insertReply");
      
      try {
         pstmt = conn.prepareStatement(sql);
      
         pstmt.setInt(1, c.getMemberNo());
         pstmt.setString(2, c.getBoardNo());
         pstmt.setString(3, c.getCommentContent());
         
         result = pstmt.executeUpdate();
      
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
   }
   
   // 댓글 조회
   public ArrayList<Comments> selectReplyList(Connection conn, int boardNo) {
      
      ArrayList<Comments> list = new ArrayList<Comments>();
      PreparedStatement pstmt = null;
      ResultSet rset = null;
      
      String sql = prop.getProperty("selectReplyList");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, boardNo);
         
         rset = pstmt.executeQuery();
         while(rset.next()) {
            list.add(new Comments(rset.getInt("comment_no")
                           , rset.getInt("member_no")
                           , rset.getString("comment_content")
                           , rset.getString("modify_date")
                           , rset.getString("member_name")
                        ));
         }

      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(rset);
         close(pstmt);
      }
      
      return list;
   }
   
   
   // 댓글 삭제
   public int deleteReply(Connection conn, Comments c) {
      
      int result = 0;
      PreparedStatement pstmt = null;
      
      String sql = prop.getProperty("deleteReply");
      
      try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, c.getCommentNo());
         pstmt.setInt(2, c.getMemberNo());
         pstmt.setString(3, c.getBoardNo());
         
         result = pstmt.executeUpdate();
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         close(pstmt);
      }
      
      return result;
    }
   
   
   
    // 좋아요 (기존 '좋아요' 여부 확인)
    public int checkLike(Connection conn, int boardNo, int MemberNo) {
       
        // 해당 게시글에 해당 회원이 '좋아요' 한 기록이 있는지 확인. select 지만 결과값 1,0으로 받아야하니까 int
        int likeResult = 0;
         PreparedStatement pstmt = null;
         ResultSet rset = null;
         
         String sql = prop.getProperty("checkLike");
         
         try {
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, MemberNo);
            pstmt.setString(2, boardNo + "");
            
            rset = pstmt.executeQuery();
            
            if(rset.next()) { // 조회 결과 있으면 1, 없으면 0
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
   
    // 좋아요!! (추가)
    public int insertLike(Connection conn, int boardNo, int MemberNo) {
         
        int result = 0;
         PreparedStatement pstmt = null;
         
         String sql = prop.getProperty("insertLike");
         
         try {
            
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, MemberNo);
            pstmt.setString(2, boardNo + "");
            
            result = pstmt.executeUpdate();
            
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            close(pstmt);
         }
         
         return result;
    }
   
    
    
    // 좋아요 (삭제)
    public int deleteLike(Connection conn, int boardNo, int MemberNo) {
         
         int result = 0;      
         PreparedStatement pstmt = null;
         
         String sql = prop.getProperty("deleteLike");
         
         try {
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setInt(1, MemberNo);
            pstmt.setString(2, boardNo + "");
            
            result = pstmt.executeUpdate();

         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            close(pstmt);
         }
         
         return result;
     }
      
    
     // 신고!!
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
               
               if(rset.next()) { // 조회 결과 있으면 1, 없으면 0
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
       
       
       // 여행 후기 게시글 수정 (글, 사진)
       // * 글
       public int updateReview(Connection conn, Review r) {
          
          int result = 0;
          PreparedStatement pstmt = null;
          String sql = prop.getProperty("updateReview");
          
          try {
         pstmt = conn.prepareStatement(sql);
         
         pstmt.setInt(1, Integer.parseInt(r.getStationNo()));
         pstmt.setString(2, r.getTitle());
         pstmt.setString(3, r.getAddress());
         pstmt.setString(4, r.getContent());
         pstmt.setString(5, r.getTip());
         pstmt.setString(6, r.getBoardNo());
         
         result = pstmt.executeUpdate();
         
         } catch (SQLException e) {
            e.printStackTrace();
         } finally {
            close(pstmt);
         }
          return result;
       }
       
       // * 사진 (기존 첨부파일 있음 update)
       public int updateUploadfile(Connection conn, ArrayList<Uploadfile> list) {
          int result = 0;
          PreparedStatement pstmt = null;
          String sql = prop.getProperty("updateUploadfile");
          
          
         
          
          try {
             for(Uploadfile up : list) {
             //for(int i=0; i<list.size(); i++) { // 최대 0,1,2,3
                
                pstmt = conn.prepareStatement(sql);

                pstmt.setString(1, up.getOriginName());
                pstmt.setString(2, up.getChangeName());
                pstmt.setString(3, up.getFilePath());
                pstmt.setInt(4, up.getFileNo());
                pstmt.setInt(5, up.getFileLevel());
              
                result = pstmt.executeUpdate();
             }
         } catch (SQLException e) {
            e.printStackTrace();
         }finally {
            close(pstmt);
         }
          
        
          return result;
       }
       
       
       // * 사진 (기존 첨부파일 없음 insert) -- 모르겠음..몰라 몰라!!
       public int insertNewUploadfile(Connection conn, ArrayList<Uploadfile> list) {
          int result = 0;
          return result;
       }
       
       
       // * 역
//       public int updateStation(Connection conn, Station s) {
//          
//          int result = 0;
//          PreparedStatement pstmt = null;
//          String sql = prop.getProperty("updateStation");
//          
//          try {
//         pstmt = conn.prepareStatement(sql);
//         
//         
//         pstmt.setInt(1, s.getLine());
//         pstmt.setInt(2, s.getStationNo());
//         
//         result = pstmt.executeUpdate();
//         
//      } catch (SQLException e) {
//         e.printStackTrace();
//      } finally {
//         close(pstmt);
//      }
//       
//       return result; 
//       }
//       
      
      
   
   
   
}