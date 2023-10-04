package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Sight;
import com.kh.board.model.vo.Station;
import com.kh.common.model.vo.PageInfo;

import static com.kh.common.JDBCTemplate.*;

public class StationDao {
	
	private Properties prop = new Properties();
	
		
		public StationDao() {
			try {
				prop.loadFromXML(new FileInputStream(StationDao.class.getResource("/db/sql/station-mapper.xml").getPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

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
				list.add(new Station(rset.getInt("STATION_NO"),
									 rset.getString("STATION_NAME"),
									 rset.getInt("LINE")
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
	
	/**
	 * @param conn
	 * @param stationNo
	 * @param pi
	 * @return
	 */
	public ArrayList<Sight> searchStation(Connection conn, int stationNo, PageInfo pi) {

		
		ArrayList<Sight> list = new ArrayList<Sight>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchStation");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			
			pstmt.setInt(1, stationNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Sight(rset.getString("BOARD_NO"),
								   rset.getInt("STATION_NO"),
								   rset.getString("TITLE"),
								   rset.getString("CONTENT"),
								   rset.getInt("COUNT"),
								   rset.getDate("MODIFY_DATE"),
								   rset.getString("DTN_NAME"),
								   rset.getString("STATUS"),
								   rset.getString("TITLE_IMAGE"),
								   rset.getInt("file_level")
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

	
	
	/**
	 * searchStationNo 총 게시글 개수를 세는 메소드
	 * @param conn
	 * @param stationNo
	 * @param pi
	 * @return
	 */
	public int headerSearchListCount(Connection conn, int stationNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("headerSearchListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, stationNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public Station whatisStationName(Connection conn, int stationNo) {
		
		Station headerSearch = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("whatisStationName");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, stationNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				headerSearch = new Station(rset.getInt("STATION_NO"),
										   rset.getString("STATION_NAME"),
										   rset.getInt("LINE"));
			}
					
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return headerSearch;
	}

	

}
