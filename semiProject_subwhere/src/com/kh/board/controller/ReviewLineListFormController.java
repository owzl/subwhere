package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.ReviewService;
import com.kh.board.model.vo.Review;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class ReviewLineListFormController
 */
@WebServlet("/linelist.re")
public class ReviewLineListFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewLineListFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

/**
 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
 */
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	// 일단 페이징바 생략해보고..
	
	// --------------------------------------------------------------------------------	
	
	// selectbox=1,2,3, .. 필요
	int line = Integer.parseInt(request.getParameter("selectbox"));
	
	
	
	
	// 자 이제 리스트 조회하러 가보쟝구 (pagingbar 보류)
	ArrayList<Review> list = new ReviewService().selectReviewLineList(line);
	
	request.setAttribute("list", list);	
		
	request.getRequestDispatcher("views/review/reviewListLineView.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
