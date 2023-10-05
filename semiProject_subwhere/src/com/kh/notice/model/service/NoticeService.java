package com.kh.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.dao.NoticeDao;
import com.kh.notice.model.vo.Notice;

import static com.kh.common.JDBCTemplate.*;

public class NoticeService {

	
	/**
	 * 공지사항의 게시글 개수를 조회하는 메소드
	 * @return
	 */
	public int selectAllNoticeCount() {
		
		Connection conn = getConnection();
		
		int count = new NoticeDao().selectAllNoticeCount(conn);
		
		close(conn);
		
		return count;
	}
	
	
	/**
	 * 공지사항 조회하는 메소드 (페이징 포함)
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectNotice(PageInfo pi){
		
		Connection conn = getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectNotice(conn, pi);
		
		close(conn);
		
		return list;
		
	}
	
	
	
	/**
	 * 공지사항 조회수 증가시키는 메소드
	 * @return
	 */
	public Notice increaseNoticeCount(int ujBno) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().increaseNoticeCount(conn, ujBno);
		
		Notice n = null;
		
		if(result>0) {
			// 조회수 증가 성공하면 커밋하고 자세한 내용 조회하기!
			commit(conn);
			
			n = new NoticeDao().selectDetailNotice(conn, ujBno);
			
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return n;
	}
	
	
	
	/**
	 * 관리자가 공지사항을 작성하는 메소드
	 * @return
	 */
	public int insertNotice(String noticeTitle,String noticeContent) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().insertNotice(noticeTitle,noticeContent, conn);
		
		
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);

		return result;
		
	}
	
	
	/**
	 * 관리자가 공지사항을 수정하는 메소드
	 * @return
	 */
	public Notice selectDetailNotice( int UJnoticeNo) {
		
		Connection conn = getConnection();
		
		Notice n = new NoticeDao().selectDetailNotice(UJnoticeNo,conn);
		
		
		close(conn);
		
		return n;
		
		
	}
	
	
	
	/**
	 * 관리자가 공지사항을 수정하는 메소드
	 * 
	 * @param upNo
	 * @param noticeTitle
	 * @param noticeContent
	 * @return
	 */
	public int updateNotice(int upNo,String noticeTitle,String noticeContent) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().updateNotice(upNo,noticeTitle,noticeContent, conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	
	
	/**
	 * 공지사항 수정하는 메소드
	 * @return
	 */
	public int deleteNotice(int UJnoticeNo) {
		
		Connection conn = getConnection();
		
		int result = new NoticeDao().deleteNotice(UJnoticeNo, conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
		
	}
	
	
	
	
	
	
}


















