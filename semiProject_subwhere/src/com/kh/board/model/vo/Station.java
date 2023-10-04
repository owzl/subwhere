package com.kh.board.model.vo;

public class Station {
	
	private int stationNo;
	private String stationName;
	private int line;
	
	public Station() {}

	@Override
	public String toString() {
		return "Station [stationNo=" + stationNo + ", stationName=" + stationName + ", line=" + line + "]";
	}

	public Station(int stationNo, String stationName, int line) {
		super();
		this.stationNo = stationNo;
		this.stationName = stationName;
		this.line = line;
	}

	public int getStationNo() {
		return stationNo;
	}

	public void setStationNo(int stationNo) {
		this.stationNo = stationNo;
	}

	public String getStationName() {
		return stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}

	public int getLine() {
		return line;
	}

	public void setLine(int line) {
		this.line = line;
	}
	
	

}
