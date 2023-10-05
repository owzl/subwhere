package com.kh.board.model.service;

import static com.kh.common.JDBCTemplate.close;
import static com.kh.common.JDBCTemplate.commit;
import static com.kh.common.JDBCTemplate.getConnection;
import static com.kh.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.ReviewDao;
import com.kh.board.model.vo.Review;
import com.kh.board.model.vo.Station;
import com.kh.board.model.vo.Uploadfile;
import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.PageInfo;

public class ReviewService {
	
	//ajax select박스로 역명들 조회
	public ArrayList<Station> selectStation(int num) { 
		
		 Connection conn = getConnection();
		 ArrayList<Station> list = new ReviewDao().selectStation(conn, num);
		 close(conn);
		 return list;
		
	}
	
	// 여행후기 글작성 (review에 글넣고, uploadafile에 사진넣기)
	public int insertReview(Review r, ArrayList<Uploadfile> list) {
		
		Connection conn = getConnection();
		
		int result1 = new ReviewDao().insertReview(conn, r);
		int result2 = new ReviewDao().insertUploadfile(conn, list);
		
		
		
		if(result1 > 0 && result2 > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1 * result2;
		
	}
	
	// 여행후기 리스트 게시글들 조회 (with pagingbar)
	public ArrayList<Review> selectReviewList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectReviewList(conn, pi);
		close(conn);
		return list;
		
	}
	
	
	// * 여행후기 호선별 리스트 게시글들 조회
	public ArrayList<Review> selectReviewLineList(int line) {
		
		Connection conn = getConnection();
		ArrayList<Review> list = new ReviewDao().selectReviewLineList(conn, line);
		close(conn);
		return list;
		
	}
	
	
	
	// 여행후기 리스트 총 게시글 수 (페이징 위해 필요 listCount)
	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new ReviewDao().selectListCount(conn);
		close(conn);
		return listCount;
		
	}
	
	// 조회수 증가
	public int increaseCount(int boardNo) {
		
		Connection conn = getConnection();
		int result = new ReviewDao().increaseCount(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
	}
	
	// 1)여행후기 상세페이지 (글)
	public Review selectReview(int boardNo) {
		
		Connection conn = getConnection();
		
		Review r = new ReviewDao().selectReview(conn, boardNo);
		
		close(conn);
		return r;
		
	}
	
	// 2)여행후기 상세페이지 (사진)
	public ArrayList<Uploadfile> selectUploadfileList(int boardNo) {
		
		Connection conn = getConnection();
		ArrayList<Uploadfile> list = new ReviewDao().selectUploadfileList(conn, boardNo);
		close(conn);
		return list;
	}
	
	
	// 여행후기 게시글 삭제
	public int deleteReview(int boardNo) { // num == boardNo
		
		Connection conn = getConnection();
		int result = new ReviewDao().deleteReview(conn, boardNo);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}
	
	// 댓글 등록
	public int insertReply(Comments c) { // c : 댓글내용, 게시글번호, 회원번호
		
		Connection conn = getConnection();
		int result = new ReviewDao().insertReply(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
	}
	
	// 댓글 조회
	public ArrayList<Comments> selectReplyList(int boardNo) {
		
		Connection conn = getConnection();
		ArrayList<Comments> list = new ReviewDao().selectReplyList(conn, boardNo);
		
		close(conn);
		return list;

	}
	
	// 댓글 삭제
	public int deleteReply(Comments c) {
		
		Connection conn = getConnection();
		int result = new ReviewDao().deleteReply(conn, c);
		
		if(result > 0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		return result;
		
	}

	
	// 좋아요!!
	public int checkLike(int boardNo, int MemberNo) {
	      
        Connection conn = getConnection();
        int likeResult = new ReviewDao().checkLike(conn, boardNo, MemberNo);
       
        close(conn);
        return likeResult;	// 조회결과(1,0) 조회만 한거니까 commit, rollback 필요 없음      
    }
	
	public int insertLike(int boardNo, int MemberNo) {
		
        Connection conn = getConnection();
        int result = new ReviewDao().insertLike(conn, boardNo, MemberNo);
        
        if(result>0) {
           commit(conn);
        }else {
           rollback(conn);
        }
        close(conn);
        
        return result;
    }

    public int deleteLike(int boardNo, int MemberNo) {
    	
        Connection conn = getConnection();
      
        int result = new ReviewDao().deleteLike(conn, boardNo, MemberNo);
        if(result>0) {
           commit(conn);
        }else {
           rollback(conn);
        }
        close(conn);
      
        return result;
    }
    
    
	// 신고!!
	public int insertReport(int boardNo, int memberId) {
		
        Connection conn = getConnection();
        int result = new ReviewDao().insertReport(conn, boardNo, memberId);
        if(result>0) {
           commit(conn);
        }else {
           rollback(conn);
        }
        close(conn);
      
        return result;
    }

    public int checkReport(int boardNo, int memberId) {
      
        Connection conn = getConnection();
        int reportResult = new ReviewDao().checkReport(conn, boardNo, memberId);
        close(conn);
      
        return reportResult;	      
    }

    public int deleteReport(int boardNo, int memberId) {
    	
        Connection conn = getConnection();
      
        int result = new ReviewDao().deleteReport(conn, boardNo, memberId);
        if(result>0) {
           commit(conn);
        }else {
           rollback(conn);
        }
        close(conn);
      
        return result;
    }
	
    
    // 여행 후기 게시글 수정(글, 사진)
    public int updateReview(Review r, ArrayList<Uploadfile> list) {
    	
    	Connection conn = getConnection();
    	
    	
    	
    	// * 글
    	int result1 = new ReviewDao().updateReview(conn, r);
    	
    	// * 사진(1 | 2,3,4)
    	
    	int result2 = new ReviewDao().updateUploadfile(conn, list);
    	result2 = 1;
    	// 사진 수정 안하고 싶을 수도 있으니까
    	
    	
    	
    	if(result1 > 0 && result2 > 0) {
    		commit(conn);
    	}else {
    		rollback(conn);
    	}
    	
    	close(conn);
    	return result1 * result2;
    }
	
	
    
    
  
    
	
	
}
