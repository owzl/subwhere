package com.kh.admin.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.admin.model.dao.AdminDao;
import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.vo.Member;

import static com.kh.common.JDBCTemplate.*;

public class AdminService {

	public int selectListCount() {
		
		Connection conn = getConnection();
		int listCount = new AdminDao().selectListCount(conn);
		close(conn);
		
		
		
		return listCount;
	}

	public ArrayList<Member> selectList(PageInfo pi) {
		Connection conn = getConnection();
		ArrayList<Member> list =  new AdminDao().selectList(conn,pi);
		close(conn);
		
		
		
		return list;
	}

	public int updateMember(Member m) {
		Connection conn = getConnection();
		int result = new AdminDao().updateMember(conn,m);
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		
		return result;
	}

	public int selectListCount(String search) {
		Connection conn = getConnection();
		int listCount =  new AdminDao().selectListCount(conn,search);
		
		
		close(conn);
		
		
		
		return listCount;
	}

	public ArrayList<Member> selectList(PageInfo pi, String search) {
		Connection conn = getConnection();
		ArrayList<Member> list =  new AdminDao().selectList(conn,pi, search);
		close(conn);
		
		
		
		return list;
	}

}
