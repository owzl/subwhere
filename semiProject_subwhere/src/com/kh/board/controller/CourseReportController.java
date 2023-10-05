package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.CourseService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class CourseReportController
 */
@WebServlet("/courseReport.co")
public class CourseReportController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseReportController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int result = 0;
	      
	      int boardNo = Integer.parseInt(request.getParameter("bno"));
	      int memberId= ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
	      
	      int reportResult = new CourseService().checkReport(boardNo, memberId);//찜했는지 안했는지확인
	      //result = new SightService().insertLike(boardNo, memberId);
	      
	      if(reportResult == 0) {//안했으면 찜하기
	         result = new CourseService().insertReport(boardNo, memberId);
	      }else {//했으면 지우기
	         
	         result = new CourseService().deleteReport(boardNo, memberId);
	         
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
