package com.kh.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.board.model.vo.Sight;
import com.kh.board.model.vo.Station;
import com.kh.common.model.vo.PageInfo;
import com.kh.board.model.dao.SightDao;
import com.kh.board.model.dao.StationDao;

import static com.kh.common.JDBCTemplate.*;



public class StationService {

	public ArrayList<Station> selectStation(int num) {

		Connection conn = getConnection();
		ArrayList<Station> list = new StationDao().selectStation(conn, num);
		
		close(conn);
		return list;
	}
	
	
	public ArrayList<Sight> searchStation(PageInfo pi, int stationNo) {
		
		Connection conn = getConnection();
		ArrayList<Sight> list = new StationDao().searchStation(conn, stationNo, pi);
		
		close(conn);
		
		
		return list;
	}

	
	
	public int headerSearchListCount(int stationNo) {
		
		Connection conn = getConnection();
		int result = new StationDao().headerSearchListCount(conn, stationNo);
		
		if(result>0) {
			commit(conn);
		}else {
			rollback(conn);
		}
		close(conn);
		return result;
	}


	public Station whatisStationName(int stationNo) {
		
		Connection conn = getConnection();
		Station headerSearch = new StationDao().whatisStationName(conn, stationNo);
		
		close(conn);
		return headerSearch;
	}

	

}
