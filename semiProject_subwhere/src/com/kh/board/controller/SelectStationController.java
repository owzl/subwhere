package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.service.StationService;
import com.kh.board.model.vo.Station;


/**
 * Servlet implementation class SearchStationController
 */
@WebServlet("/selectStation.do")
public class SelectStationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectStationController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
	  // 호선 번호 선택때문에 parsing을 다르게 해줘야함
	  // 만약 '호선 번호 선택' 이 넘어왔다면 파싱 하지 말기!
	  String numText = request.getParameter("num");
	  int num = 0;
	  
	  //  호선 번호 선택이 아닐 경우에만 parsing하기!
	  	if(!numText.equals("호선 번호 선택")) {
	  		num = Integer.parseInt(request.getParameter("num"));
	  	}
	   
	   ArrayList<Station> list = new StationService().selectStation(num);
	  
	  
	   response.setContentType("application/json; charset=utf-8");
	   
	   new Gson().toJson(list,response.getWriter());
	   
	  

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
