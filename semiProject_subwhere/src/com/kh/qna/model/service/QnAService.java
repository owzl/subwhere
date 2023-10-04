package com.kh.qna.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.PageInfo;
import com.kh.qna.model.dao.QnADao;
import com.kh.qna.model.vo.QnA;

public class QnAService {

	/**
	 * 자주묻는 질문 리스트 조회하는 메소드
	 * @return
	 */
	/**
	 * @return
	 */
	public ArrayList<QnA> selectQna(PageInfo pi){
		
		Connection conn =  getConnection();
		
		ArrayList<QnA> list = new QnADao().selectQna(conn, pi);
		
		close(conn);
		
		return list;
		
	}
	
	
	/**
	 * 자주묻는 질문 조회수 증가시키는 쿼리
	 * @return
	 */
	public QnA increaseQna(int ujQno) {
		
		Connection conn = getConnection();
		
		int result = new QnADao().increaseQna(conn, ujQno);
		
		QnA q = null;
		
		
		if(result>0) {
			// 만약 조회수 증가 성공했으면 세부사항 조회해오기 
			commit(conn);
			
			q = new QnADao().selectDetailQna(conn, ujQno);
			
			
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return q;
		
	}
	
	
	/**
	 * 자주 묻는 질문사항 수정하는 메소드
	 * @param qno
	 * @return
	 */
	public int updateQnA(int qno, String question, String answer) {
		
		Connection conn = getConnection();
		
		int result = new QnADao().updateQnA(qno, question, answer ,conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	
	/**
	 * 질문사항 작성하는 메소드
	 * @param faqTitle
	 * @param faqContent
	 * @return
	 */
	public int insertQnA(String faqTitle,String faqContent) {
		
		Connection conn = getConnection();
		
		int result = new QnADao().insertQnA(faqTitle,faqContent, conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	
	/**
	 * 질문 상세조회 쿼리
	 * @param UJqno
	 * @return
	 */
	public QnA selectDetailQna(int UJqno) {
		Connection conn = getConnection();
		
		QnA q = new QnADao().selectDetailQna(conn, UJqno);
		
		close(conn);
		
		
		return q;
		
		
	}
	
	
	
	/**
	 * 질문 삭제하는 메소드
	 * @return
	 */
	public int deleteQnA(int qno) {
		Connection conn = getConnection();
		
		int result = new QnADao().deleteQnA(qno,conn);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
		
	}
	
	
	
	
	
	
	
	
	
	
}
