package com.kh.qna.model.dao;

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
import com.kh.qna.model.vo.QnA;

public class QnADao {

	private Properties prop = new Properties();
	
	
	public QnADao() {
		
		String filePath = QnADao.class.getResource("/db/sql/notice-mapper.xml").getPath();
		
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
	 * 질문 사항 조회하는 메소드
	 * @param conn
	 * @return
	 */
	public ArrayList<QnA> selectQna(Connection conn, PageInfo pi){
		
		ArrayList<QnA> list = new ArrayList<QnA>();
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		// 쿼리는 notice-mapper에 작성함
		String sql = prop.getProperty("selectQna");
		
		int startRow = (pi.getCurrentPage()-1)* pi.getBoardLimit()+1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new QnA(rset.getInt("qa_no"),
								 rset.getString("question"),
								 rset.getString("answer"),
								 rset.getString("qa_date"),
								 rset.getString("status"),
								 rset.getInt("count")));
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
	 * 자주 묻는 질문 조회수 증가시키는 메소드
	 * @param conn
	 * @param ujBno
	 * @return
	 */
	public int increaseQna(Connection conn,int ujQno) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("increaseQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, ujQno);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	/**
	 * 자주 묻는 질문사항 세부 조회 메소드
	 * @return
	 */
	public QnA selectDetailQna(Connection conn,int UJqno) {
		
		
		
		QnA q= null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDetailQna");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, UJqno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				q = new QnA(rset.getInt("QA_NO"),
							rset.getString("QUESTION"),
							rset.getString("ANSWER"));
			}
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		return q;
		
		
	}
	
	
	
	
	/**
	 * 자주 묻는 질문사항 수정하는 메소드
	 * @return
	 */
	public int updateQnA(int qno, String question, String answer, Connection conn) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("updateQnA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, question);
			pstmt.setString(2, answer);
			pstmt.setInt(3, qno);
			
			result = pstmt.executeUpdate();
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
		
	}
	
	
	/**
	 * 질문 작성하는 메소드
	 * @return
	 */
	public int insertQnA(String faqTitle,String faqContent,Connection conn) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertQnA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, faqTitle);
			pstmt.setString(2, faqContent);
			
			result = pstmt.executeUpdate();
			
			
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
	}
	
	
	/** 
	 * 질문 삭제하는 메소드
	 * @return
	 */
	public int deleteQnA(int qno,Connection conn) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("deleteQnA");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, qno);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
}
