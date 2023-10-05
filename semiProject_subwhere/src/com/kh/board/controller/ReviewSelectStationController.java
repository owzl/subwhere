package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.service.ReviewService;
import com.kh.board.model.vo.Station;

/**
 * Servlet implementation class ReviewSelectStationController
 */
@WebServlet("/selectBox.re")
public class ReviewSelectStationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSelectStationController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  // 호선 번호 선택때문에 parsing을 다르게 해줘야함
	      // 만약 '호선 번호 선택' 이 넘어왔다면 파싱 하지 말기!
	      String numText = request.getParameter("num"); // 파랑"num" : 전 화면 jsp에서 넘긴 키값. num : value="1"
	      int num = 0;
	      
	      //  '호선 번호 선택' 이 아닐 경우에만 parsing하기!
	      if(!numText.equals("호선 번호 선택")) { // value="1", value="2", ..
	         num = Integer.parseInt(request.getParameter("num"));
	      }
	       
	      ArrayList<Station> list = new ReviewService().selectStation(num);

	      response.setContentType("application/json; charset=utf-8");	       
	      new Gson().toJson(list, response.getWriter()); // success:function() 에 list 꽂힘

	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
