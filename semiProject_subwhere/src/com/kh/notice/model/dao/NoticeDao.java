package com.kh.notice.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.PageInfo;
import com.kh.notice.model.vo.Notice;

/**
 * @author hobbang
 *
 */
public class NoticeDao {

	private Properties prop = new Properties();
	
	public NoticeDao() {
		
		String filePath = NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
			
			
		} catch (InvalidPropertiesFormatException e) {
			
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			
			e.printStackTrace();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}
	
	
	/**
	 * 공지사항의 게시글 개수를 조회하는 메소드
	 * @param conn
	 * @return
	 */
	public int selectAllNoticeCount(Connection conn) {
		
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectAllNoticeCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			
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
	 *  공지사항 리스트 조회하는 메소드(페이징 포함)
	 * @param conn
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectNotice(Connection conn,PageInfo pi) {
		
		
		ArrayList<Notice> list = new ArrayList<Notice>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		
		String sql = prop.getProperty("selectNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
			 list.add(new Notice(rset.getInt("notice_no"),
					 			 rset.getString("nickname"),
					 			 rset.getString("notice_title"),
					 			 rset.getString("notice_content"),
					 			 rset.getInt("count"),
					 			 rset.getString("create_date"),
					 			 rset.getString("status")));	
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
	 * 공지사항 조회수 증가시키는 메소드
	 * @param conn
	 * @param bno
	 * @return
	 */
	public int increaseNoticeCount(Connection conn,int ujBno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String spl = prop.getProperty("increaseNoticeCount");
		
		try {
			pstmt = conn.prepareStatement(spl);
			
			pstmt.setInt(1, ujBno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
		
	}
	
	
	
	/** 공지사항 상세내용 조회 메소드
	 * @return
	 */
	public Notice selectDetailNotice(Connection conn,  int ujBno) {
		
		Notice n = null;
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		
		String sql = prop.getProperty("selectDetailNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ujBno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_no"),
							   rset.getString("notice_title"),
							   rset.getString("notice_content")
							   );
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
		
	}
	
	
	/**
	 * 관리자가 공지사항을 작성하는 메소드
	 * @return
	 */
	public int insertNotice(String noticeTitle,String noticeContent,Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, noticeTitle);
			pstmt.setString(2, noticeContent);
			
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
				
		
		
		
	}
	
	
	
	/**
	 * 관리자가 공지사항을 수정하는 메소드 
	 * @return
	 */
	public Notice selectDetailNotice(int UJnoticeNo, Connection conn ) {
		
		
		Notice n= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDetailNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, UJnoticeNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				n = new Notice(rset.getInt("notice_no"),
							   rset.getString("notice_title"),
							   rset.getString("notice_content")); 
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return n;
		
		
	}
	
	
	/**
	 * 
	 * 공지사항 수정하는 메소드
	 * @param upNo
	 * @param noticeTitle
	 * @param noticeContent
	 * @param conn
	 * @return
	 */
	public int updateNotice( int upNo,String noticeTitle,String noticeContent,Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, noticeTitle);
			pstmt.setString(2, noticeContent);
			pstmt.setInt(3, upNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * 공지사항 삭제하는 메소드
	 * @return
	 */
	public int deleteNotice(int UJnoticeNo,Connection conn) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteNotice");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, UJnoticeNo);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	
	
	
	
}
