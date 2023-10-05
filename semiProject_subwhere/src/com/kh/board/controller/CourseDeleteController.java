package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.board.model.service.CourseService;

/**
 * Servlet implementation class CourseDeleteController
 */
@WebServlet("/delete.co")
public class CourseDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CourseDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int cno = Integer.parseInt(request.getParameter("cno"));
		
		int result = new CourseService().deleteCourse(cno);
		
		
		
		HttpSession session = request.getSession();
		
		if(result >0) {
		
			
			session.setAttribute("alertMsg", "여행 코스 삭제를 성공했습니다");
			response.sendRedirect(request.getContextPath() + "/list.co?cpage=1");
			
		}else {
			session.setAttribute("alertMsg", "여행 코스 삭제를 실패했습니다");
			response.sendRedirect(request.getContextPath() + "/detail.co?cno=cno");
			
		}
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
