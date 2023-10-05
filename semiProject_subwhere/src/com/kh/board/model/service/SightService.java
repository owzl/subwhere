package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.dao.SightDao;
import com.kh.board.model.vo.Liked;
import com.kh.board.model.vo.Sight;
import com.kh.board.model.vo.Station;
import com.kh.board.model.vo.Uploadfile;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.PageInfo;

public class SightService {

	public ArrayList<Sight> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Sight> list = new SightDao().selectList(conn, pi);
		close(conn);
		
		
		return list;
	}

	public int selectListCount() {
		Connection conn = getConnection();
		int listCount = new SightDao().selectListCount(conn);
		
		close(conn);
		
		return listCount;
	}

	public int insertSightBoard(Sight s, ArrayList<Uploadfile> list) {
		
		Connection conn = getConnection();
		int result1 = new SightDao().insertSightBoard(conn,s);
		int result2 = new SightDao().insertAttachmentList(conn,list);
		
		if(result1>0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1*result2;
	}

	public ArrayList<Sight> selectList(String search, PageInfo pi) {
		
		Connection conn = getConnection();
		ArrayList<Sight> list = new SightDao().selectList(conn, search, pi);
		close(conn);
		
		return list;
	}

	public int selectListCount(String search) {
		Connection conn = getConnection();
		int listCount = new SightDao().selectListCount(conn, search);
		
		close(conn);
		
		return listCount;
		
		
	}

	public ArrayList<Sight> selectListOrderByCount(String search, PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Sight> list = new SightDao().selectListOrderByCount(conn, search, pi);
		close(conn);
		return list;
	}

	public ArrayList<Station> selectStation(int num) {
		  Connection conn = getConnection();
	      
	      ArrayList<Station> line = new SightDao().selectStaion(conn,num);
	   
	      close(conn);
	      
	      return line;
		
		
	}

	public int increaseCount(int boardNo) {
		Connection conn = getConnection();
		int result = new SightDao().increaseCount(conn,boardNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		
		return result;
	}

	public Sight selectSight(int boardNo) {
		Connection conn = getConnection();
		Sight s = new SightDao().selectSight(conn, boardNo);
		close(conn);
		
		
		
		return s;
	}

	public ArrayList<Uploadfile> selectUploadfileList(int boardNo) {
		Connection conn =getConnection();
		ArrayList<Uploadfile> list = new SightDao().selectUploadfileList(conn, boardNo);
		close(conn);
		
		
		
		return list;
	}

	public int insertComment(Comments c) {
		Connection conn = getConnection();
		int result = new SightDao().insertComment(conn, c);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
		
		
		
	}

	public ArrayList<Comments> selectCommentList(int boardNo) {
		Connection conn = getConnection();
		ArrayList<Comments> list = new SightDao().selectCommentList(conn,boardNo);
		close(conn);
		
		return list;
	}

	public int insertLike(int boardNo, int memberId) {
		Connection conn = getConnection();
		int result = new SightDao().insertLike(conn, boardNo, memberId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int checkLike(int boardNo, int memberId) {
		
		Connection conn = getConnection();
		int likeResult = new SightDao().checkLike(conn, boardNo, memberId);
		close(conn);
		
		return likeResult;
		
		
		
	}

	public int deleteLike(int boardNo, int memberId) {
		Connection conn = getConnection();
		
		int result = new SightDao().deleteLike(conn, boardNo, memberId);
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
		
		int reportResult = new SightDao().checkReport(conn, boardNo, memberId);
		
		
		
			close(conn);
		
		return reportResult;
	}

	public int insertReport(int boardNo, int memberId) {
		Connection conn = getConnection();
		
		int result = new SightDao().insertReport(conn, boardNo, memberId);
		
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteReport(int boardNo, int memberId) {
		Connection conn = getConnection();
		
		int result = new SightDao().deleteReport(conn, boardNo, memberId);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int deleteComment(int commentNo) {
		
		Connection conn = getConnection();
		int result = new SightDao().deleteComment(conn, commentNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
		
		
	
	}

	public int updateSightBoard(Sight s, ArrayList<Uploadfile> list) {

		Connection conn = getConnection();
		int result1 = new SightDao().updateSightBoard(conn, s, list);
		int result2 = 1;
		result2 = new SightDao().insertNewAttachment(conn, list);
		
		
		
		if(result1>0 && result2 >0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result1*result2;
	}

	public int changeUploadfileStatus(String bno) {

		Connection conn = getConnection();
		int result = new SightDao().changeUploadfileStatus(conn, bno);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	public int deleteSight(int boardNo) {
		Connection conn = getConnection();
		int result = new SightDao().deleteSight(conn, boardNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}

	

	

	

}
