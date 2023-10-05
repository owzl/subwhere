package com.kh.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.board.model.service.CourseService;

import com.kh.board.model.vo.Course;
import com.kh.board.model.vo.Uploadfile;
import com.kh.member.model.vo.Member;


/**
 * Servlet implementation class CourseDetailViewController
 */
@WebServlet("/detail.co")
public class CourseDetailViewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseDetailViewController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int cno =   Integer.parseInt(request.getParameter("cno")) ;
	
		

		
		
		
		// 조회수 증가시키면서 여행 코스 내용을 조회함 
		Course c = new CourseService().increaseCourseCount(cno);
		
		// 첨부파일도 select해옴
		ArrayList<Uploadfile> list = new CourseService().selectCourseFile(cno);
		
		
		
		
		
		
		int userNo = 0;
		
        
        if(request.getSession().getAttribute("loginMember") != null) {
           
           // session에 넣어두면 controller, jsp 에서 모두 쓸 수 있음
           // session접근해서 loginMember불러와.MemberNo얻어와서 userNo변수에 담고 set!
           userNo = ((Member)request.getSession().getAttribute("loginMember")).getMemberNo();
              request.setAttribute("userNo", userNo);
              
              // 좋아요
              int likeResult = new CourseService().checkLike(cno, userNo);
              request.setAttribute("likeResult", likeResult);
              // 신고
              int reportResult = new CourseService().checkReport(cno, userNo);
              request.setAttribute("reportResult", reportResult);
              
        }
		
        
        request.setAttribute("c", c);
        request.setAttribute("list", list);
        
		
        request.getRequestDispatcher("views/course/courseDetailform.jsp").forward(request, response);
		
		
				
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
