package com.kh.board.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import com.kh.board.model.vo.Liked;
import com.kh.board.model.vo.Sight;
import com.kh.board.model.vo.Station;
import com.kh.board.model.vo.Uploadfile;

import static com.kh.common.JDBCTemplate.*;

import com.kh.common.model.vo.Comments;
import com.kh.common.model.vo.PageInfo;

public class SightDao {

	private Properties prop = new Properties();
	
	public SightDao() {
		try {
			prop.loadFromXML(new FileInputStream(SightDao.class.getResource("/db/sql/sight-mapper.xml").getPath()));
		} catch (IOException e) {
			
			e.printStackTrace();
		}
	}

	public ArrayList<Sight> selectList(Connection conn, PageInfo pi) {
		
		ArrayList<Sight> list = new ArrayList<Sight>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Sight(rset.getString("board_no"),
								   rset.getInt("station_no"),
								   rset.getString("title"),
								   rset.getString("content"),
								   rset.getInt("count"),
								   rset.getDate("modify_date"),
								   rset.getString("dtn_name"),
								   rset.getString("status"),
								   rset.getString("title_image")
								   ));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
	}

	public int selectListCount(Connection conn) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt= conn.prepareStatement(sql);
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return listCount;
	}

	public int insertSightBoard(Connection conn, Sight s) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("insertSightBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, s.getStationNo());
			pstmt.setString(2, s.getTitle());
			pstmt.setString(3, s.getContent());
			pstmt.setString(4, s.getDtnName());
			pstmt.setString(5, s.getAddress());
			pstmt.setString(6, s.getTransport());
			pstmt.setString(7, s.getHoliday());
			pstmt.setString(8, s.getRuntime());
			pstmt.setString(9, s.getHashtag());
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public int insertAttachmentList(Connection conn, ArrayList<Uploadfile> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");
		
		try {
			for(Uploadfile uf: list) {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uf.getOriginName());
			pstmt.setString(2, uf.getChangeName());
			pstmt.setString(3, uf.getFilePath());
			pstmt.setInt(4, uf.getFileLevel());
			
			result = pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
		
		
		
		
		
	}

	public ArrayList<Sight> selectList(Connection conn, String search, PageInfo pi) {
		
		ArrayList<Sight> list = new ArrayList<Sight>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchList");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			switch(search) {
			case "1호선":
				pstmt.setInt(1,100);
				pstmt.setInt(2, 200);
				break;
			case "2호선":
				pstmt.setInt(1,200);
				pstmt.setInt(2, 300);
				break;
			case "3호선":
				pstmt.setInt(1,300);
				pstmt.setInt(2, 400);
				break;
			case "4호선":
				pstmt.setInt(1,400);
				pstmt.setInt(2, 500);
				break;
			case "5호선":
				pstmt.setInt(1,500);
				pstmt.setInt(2, 600);
				break;
			case "6호선":
				pstmt.setInt(1,600);
				pstmt.setInt(2, 700);
				break;
			case "7호선":
				pstmt.setInt(1,700);
				pstmt.setInt(2, 800);
				break;
			case "8호선":
				pstmt.setInt(1,800);
				pstmt.setInt(2, 900);
				break;
			case "9호선":
				pstmt.setInt(1,900);
				pstmt.setInt(2, 1000);
				break;
			default:
				pstmt.setInt(1, 100);
				pstmt.setInt(2, 1000);
				break;
			}
			
			
			
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Sight(rset.getString("board_no"),
								   rset.getInt("station_no"),
								   rset.getString("title"),
								   rset.getString("content"),
								   rset.getInt("count"),
								   rset.getDate("modify_date"),
								   rset.getString("dtn_name"),
								   rset.getString("status"),
								   rset.getString("title_image")
								   ));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
		
		
		
	}

	public int selectListCount(Connection conn, String search) {
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectListCountSearch");
		
		try {
			pstmt= conn.prepareStatement(sql);
			switch(search) {
			case "1호선":
				pstmt.setInt(1,100);
				pstmt.setInt(2, 200);
				break;
			case "2호선":
				pstmt.setInt(1,200);
				pstmt.setInt(2, 300);
				break;
			case "3호선":
				pstmt.setInt(1,300);
				pstmt.setInt(2, 400);
				break;
			case "4호선":
				pstmt.setInt(1,400);
				pstmt.setInt(2, 500);
				break;
			case "5호선":
				pstmt.setInt(1,500);
				pstmt.setInt(2, 600);
				break;
			case "6호선":
				pstmt.setInt(1,600);
				pstmt.setInt(2, 700);
				break;
			case "7호선":
				pstmt.setInt(1,700);
				pstmt.setInt(2, 800);
				break;
			case "8호선":
				pstmt.setInt(1,800);
				pstmt.setInt(2, 900);
				break;
			case "9호선":
				pstmt.setInt(1,900);
				pstmt.setInt(2, 1000);
				break;
			default:
				pstmt.setInt(1, 100);
				pstmt.setInt(2, 1000);
				break;
			}
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				listCount = rset.getInt("count");
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return listCount;
	}

	public ArrayList<Sight> selectListOrderByCount(Connection conn, String search, PageInfo pi) {
		ArrayList<Sight> list = new ArrayList<Sight>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("searchListOrderByCount");
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() +1;
		int endRow = startRow + pi.getBoardLimit() -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			switch(search) {
			case "1호선":
				pstmt.setInt(1,100);
				pstmt.setInt(2, 200);
				break;
			case "2호선":
				pstmt.setInt(1,200);
				pstmt.setInt(2, 300);
				break;
			case "3호선":
				pstmt.setInt(1,300);
				pstmt.setInt(2, 400);
				break;
			case "4호선":
				pstmt.setInt(1,400);
				pstmt.setInt(2, 500);
				break;
			case "5호선":
				pstmt.setInt(1,500);
				pstmt.setInt(2, 600);
				break;
			case "6호선":
				pstmt.setInt(1,600);
				pstmt.setInt(2, 700);
				break;
			case "7호선":
				pstmt.setInt(1,700);
				pstmt.setInt(2, 800);
				break;
			case "8호선":
				pstmt.setInt(1,800);
				pstmt.setInt(2, 900);
				break;
			case "9호선":
				pstmt.setInt(1,900);
				pstmt.setInt(2, 1000);
				break;
			default:
				pstmt.setInt(1, 100);
				pstmt.setInt(2, 1000);
				break;
			}
			
			
			
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Sight(rset.getString("board_no"),
								   rset.getInt("station_no"),
								   rset.getString("title"),
								   rset.getString("content"),
								   rset.getInt("count"),
								   rset.getDate("modify_date"),
								   rset.getString("dtn_name"),
								   rset.getString("status"),
								   rset.getString("title_image")
								   ));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return list;
	}

	public ArrayList<Station> selectStaion(Connection conn, int num) {
		
		ArrayList<Station> list = new ArrayList<Station>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectStation");
		
		try {
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				 list.add(new Station(rset.getInt("station_no"),
                         rset.getString("station_name"),
                         rset.getInt("line")));

			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
	         close(rset);
	         close(pstmt);
	      }
		return list;
		
	}

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
		}finally {
			close(pstmt);
		}
		
		
		
		return result;
	}

	public Sight selectSight(Connection conn, int boardNo) {
		Sight s = null;
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectSight");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			if(rset.next()) {
				s = new Sight(rset.getString("board_no"),
							  rset.getInt("board_writer"),
							  rset.getInt("station_no"),
							  rset.getString("title"),
							  rset.getString("content"),
							  rset.getInt("count"),
							  rset.getDate("create_date"),
							  rset.getDate("modify_date"),
							  rset.getString("dtn_name"),
							  rset.getString("address"),
							  rset.getString("transport"),
							  rset.getString("holiday"),
							  rset.getString("runtime"),
							  rset.getString("hashtag"),
							  rset.getString("status"),
							  rset.getString("filePath"));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return s;
		
		
	}

	public ArrayList<Uploadfile> selectUploadfileList(Connection conn, int boardNo) {
		ArrayList<Uploadfile> list = new ArrayList<Uploadfile>();
		PreparedStatement pstmt =null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectUploadfile");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset= pstmt.executeQuery();
			
			while(rset.next()) {
				Uploadfile uf = new Uploadfile();
				uf.setFileNo(rset.getInt("file_no"));
				uf.setChangeName(rset.getString("change_name"));
				uf.setFilePath(rset.getString("file_path"));
				
				list.add(uf);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return list;
	}

	
	
	public int insertComment(Connection conn, Comments c) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertComment");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,c.getMemberNo());
			pstmt.setString(2, c.getBoardNo());
			pstmt.setString(3, c.getCommentContent());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		return result;
	}

	public ArrayList<Comments> selectCommentList(Connection conn, int boardNo) {
		
		ArrayList<Comments> list = new ArrayList<Comments>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCommentList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			while(rset.next()) {
				list.add(new Comments(rset.getInt("comment_no"),
									  rset.getInt("member_no"),
									  rset.getString("comment_content"),
									  rset.getString("modify_date"),
									  rset.getString("member_name")
									  
									  		));
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(rset);
			close(pstmt);
		}
		
		
		return list;
	}

	public int insertLike(Connection conn, int boardNo, int memberId) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertLike");
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

	public int checkLike(Connection conn, int boardNo, int memberId) {
		int likeResult = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("checkLike");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberId);
			pstmt.setString(2, boardNo + "");
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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

	public int deleteLike(Connection conn, int boardNo, int memberId) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteLike");
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
			
			if(rset.next()) {
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

	public int deleteComment(Connection conn, int commentNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteComment");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, commentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		return result;
	}

	public int updateSightBoard(Connection conn, Sight s, ArrayList<Uploadfile> list) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateSightBoard");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,s.getStationNo());
			pstmt.setString(2, s.getTitle());
			pstmt.setString(3, s.getContent());
			pstmt.setString(4, s.getDtnName());
			pstmt.setString(5, s.getAddress());
			pstmt.setString(6, s.getTransport());
			pstmt.setString(7, s.getHoliday());
			pstmt.setString(8, s.getRuntime());
			pstmt.setString(9, s.getHashtag());
			pstmt.setString(10, s.getBoardNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		
		
		
		
		return result;
	}

	public int insertNewAttachment(Connection conn, ArrayList<Uploadfile> list) {
		
		int result =0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertNewAttachment");
		try {
		for(Uploadfile uf: list) {
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, Integer.parseInt(uf.getRefdBoardNo()));
				pstmt.setString(2,uf.getOriginName());
				pstmt.setString(3, uf.getChangeName());
				pstmt.setString(4, uf.getFilePath());
				pstmt.setInt(5, uf.getFileLevel());
				result = pstmt.executeUpdate();
			}
		}
			catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close(pstmt);
			}
		
		
		
		
		return result;
	}

	public int changeUploadfileStatus(Connection conn, String bno) {
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("changeUploadfileStatus");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, Integer.parseInt(bno));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		
		return result;
	}

	public int deleteSight(Connection conn, int boardNo) {
		
		
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteSight");
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
				
		
		return result;
		
		
		
		
	}

	

	
	
	
	
	
}
