package com.kh.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.ReviewService;
import com.kh.board.model.vo.Review;
import com.kh.board.model.vo.Uploadfile;

/**
 * Servlet implementation class ReviewUpdateFormController
 */
@WebServlet("/updateForm.re")
public class ReviewUpdateFormController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateFormController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int boardNo = Integer.parseInt(request.getParameter("bno"));
		
		// 서비스 2번 호출해서 값 얻어옴 (기존 정보 넣기 위해)
		Review r = new ReviewService().selectReview(boardNo);
		List<Uploadfile> list = new ReviewService().selectUploadfileList(boardNo);
		
		
		
		request.setAttribute("r", r);
		request.setAttribute("list", list);
		
		
		request.getRequestDispatcher("views/review/reviewUpdateForm.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
