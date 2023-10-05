package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.ReviewService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class ReviewReportController
 */
@WebServlet("/report.re")
public class ReviewReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		  //아이디, boardNo받고 report에 해당되는 데이터가 있는지 확인
	      //있으면-> 이미 신고해둔거 신고 해제를 위해서 delete
	      //없으면-> 신고안해둔거 신고을 위해서 insert
	      
	      int result = 0;
	      
	      int boardNo = Integer.parseInt(request.getParameter("bno"));
	      int memberId= ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
	      
	      int reportResult = new ReviewService().checkReport(boardNo, memberId); //신고 했는지, 안했는지 확인

	      if(reportResult == 0) {//안했으면 신고하기
	         result = new ReviewService().insertReport(boardNo, memberId);
	      }else {//했으면 지우기
	         result = new ReviewService().deleteReport(boardNo, memberId);   
	      }
	      
	      response.getWriter().print(reportResult);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
